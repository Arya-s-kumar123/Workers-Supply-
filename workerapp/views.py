from django.shortcuts import render,redirect,HttpResponse
from django.contrib.auth.hashers import make_password
from .models import *
from django.contrib import messages
from django.db import connection
from django.contrib.auth import logout
from django.core.files.storage import FileSystemStorage
from django.http import JsonResponse
from django.db.models import Q, Count, F, Case, When, Value
from datetime import date,datetime,timedelta



now = datetime.now()
today = date.today()

# Create your views here.

def index(request):
    return render(request,'index.html')

def home(request):
    if 'log_id' in request.session:
        user = request.session['log_id']
        data = Login.objects.get(log_id=user)
        if data.role == 'admin':
            request.session['master'] = data.log_id
            return redirect('/master_home')
        elif data.role == 'user':
            use = User_register.objects.get(log_id=user)
            request.session['user'] = use.u_id
            return redirect('/user_home')
        elif data.role == 'worker':
            wor = Worker_register.objects.get(log_id=user)
            request.session['worker'] = wor.w_id
            return redirect('/worker_home')
        else:
            return redirect('/home')  
    else:
        return render(request,'home.html')
    
def login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        try:
            data = Login.objects.get(username=username,password= password)
            if data.approval_status == None or data.approval_status == "Approved":
                request.session['log_id'] = data.log_id
                return redirect('/home')
            else:
                messages.success(request,'Admin Approval required for login')
                return redirect(login)
        except Exception:
            messages.success(request, 'Invalid Username Or Password')
            return redirect(login)
    else:
        return render(request,'login.html')

def user_register(request):
    if request.method == 'POST':
        name = request.POST['name']
        email = request.POST['email']
        contact_number = request.POST['contact_number']
        address = request.POST['address']
        username = request.POST['username']
        password = request.POST['password']
    
        try:
            Login.objects.get(username=username)
            messages.success(request, 'This Username is already Exist.')
            return redirect('/user_register')
        except Exception:
            Login.objects.create(username=username,password=password,role='user')
            d = Login.objects.get(username=username)

            User_register.objects.create(name=name,email=email,contact_number=contact_number,address=address,log_id=d.log_id)
            messages.success(request, 'Registered successfully.')
            return redirect('/user_register')
    else:
        return render(request,'user_register.html')
    
def worker_register(request):
    if request.method == 'POST':
        name = request.POST['name']
        email = request.POST['email']
        contact_number = request.POST['contact_number']
        address = request.POST['address']
        place = request.POST['place']
        service_id = request.POST['service_id']
        district_id = request.POST['district_id']
        work_experience = request.POST['work_experience']
        username = request.POST['username']
        password = request.POST['password']
        student = request.POST['student']

        if 'work_time' in request.POST:
            work_time = request.POST['work_time']
        else:
            work_time = None

        image=request.FILES['image']
        obj = FileSystemStorage()
        fl = obj.save(image.name,image)
        image = obj.url(fl)

        proof=request.FILES['proof']
        obj = FileSystemStorage()
        fl = obj.save(proof.name,proof)
        proof = obj.url(fl)
    
        try:
            Login.objects.get(username=username)
            messages.success(request, 'This Username is already Exist.')
            return redirect('/worker_register')
        except Exception:
            Login.objects.create(username=username,password=password,role='worker',approval_status="Pending")
            d = Login.objects.get(username=username)

            Worker_register.objects.create(name=name,email=email,contact_number=contact_number,address=address,image=image,
                                           place=place,service_id=service_id,district_id=district_id,work_experience=work_experience,
                                           proof=proof,student=student,work_time=work_time,log_id=d.log_id)
            messages.success(request, 'Registered successfully.')
            return redirect('/worker_register')
    else:
        state = State.objects.all()
        data = Services.objects.all()
        return render(request,'worker_register.html',{'data':data,'state':state})

def worker_request(request):
    if 'master' in request.session:
        data = Worker_register.objects.filter(log__approval_status='Pending').order_by('-w_id')
        return render(request,'master/worker_request.html',{'data':data})
    else:
        return redirect('/home')

def delete_worker(request):
    if 'master' in request.session:
        data = Login.objects.get(log_id=request.GET['log_id'])
        data.delete()
        messages.success(request, 'Deleted successfully')
        return redirect('/workers_list')
    else:
        return redirect('/home')

def worker_approval(request):
    if 'master' in request.session:
        Login.objects.filter(log_id=request.GET['log_id']).update(approval_status=request.GET["approval_status"])
        messages.success(request, 'Request '+request.GET["approval_status"])
        return redirect('/worker_request')
    else:
        return redirect('/home')

def workers_list(request):
    if 'master' in request.session:
        data = Worker_register.objects.filter(~Q(log__approval_status="Pending")).order_by('-w_id')
        return render(request,'master/workers_list.html',{'data':data})
    elif 'user' in request.session:
        data = Worker_register.objects.filter(log__approval_status="Approved").order_by('-w_id')
        return render(request,'user/workers_list.html',{'data':data})
    else:
        data = Worker_register.objects.filter(log__approval_status="Approved").order_by('-w_id')
        return render(request,'workers_list.html',{'data':data})

def about(request):
    if 'user' in request.session:
        return render(request,'user/about.html')
    else:
        return render(request,'user/about.html')

def user_home(request):
    if 'user' in request.session:
        data2 = User_register.objects.get(u_id=request.session['user'] )
        return render(request,'user/home.html',{'data2':data2})
    else:
        return redirect('/home')

def master_home(request):
    if 'master' in request.session:
        s = Services.objects.all()
        w = Worker_register.objects.filter(log__approval_status="Approved")
        t = Service_request.objects.all()
        c = Service_request.objects.filter(status="Completed")
        p = Service_request.objects.filter(status=None)
        t = len(t)
        c = len(c)
        s = len(s)
        w = len(w)
        p = len(p)
        return render(request,'master/home.html',{'t':t,'c':c,'s':s,'w':w,'p':p})
    else:
        return redirect('/home')
    
def worker_home(request):
    if 'worker' in request.session:
        total = Work_assigns.objects.filter(worker_id=request.session['worker'])
        comp = Work_assigns.objects.filter(worker_id=request.session['worker'],status="Completed")
        t = len(total)
        c = len(comp)
        return render(request,'worker/home.html',{'t':t,'c':c})
    else:
        return redirect('/home')

def service(request):
    if 'master' in request.session:
        if request.method == 'POST':
            service_name = request.POST['service_name']
            description = request.POST['description']

            image=request.FILES['image']
            obj = FileSystemStorage()
            fl = obj.save(image.name,image)
            image = obj.url(fl)

            Services.objects.create(service_name=service_name,description=description,image=image)
            messages.success(request, 'Added successfully.')
            return redirect('/service')
        else:
            data = Services.objects.all()
            return render(request,'master/service.html',{'data':data})
    elif 'user' in request.session:
        data = Services.objects.all()
        return render(request,'user/service_list.html',{'data':data})
    else:
        data = Services.objects.all()
        return render(request,'service_list.html',{'data':data})

def edit_service(request):
    if 'master' in request.session:
        data = Services.objects.get(s_id=request.GET['s_id'])
        return render(request,'master/edit_service.html',{'data':data})
    else:
        return redirect('/home')

def update_service(request):
    if 'master' in request.session:
        if request.method == 'POST':
            s_id = request.POST['s_id']
            service_name = request.POST['service_name']
            description = request.POST['description']

            if 'image' in request.FILES:
                im=request.FILES['image']
                obj = FileSystemStorage()
                fl = obj.save(im.name,im)
                image = obj.url(fl)
                Services.objects.filter(s_id=s_id).update(image=image)

            Services.objects.filter(s_id=s_id).update(service_name=service_name,description=description)
            messages.success(request, 'Updated successfully.')
            return redirect('/service')
        else:
            return redirect('/service')
    else:
        return redirect('/home')
    
def membership_fee(request):
    if 'master' in request.session:
        if request.method == 'POST':
            membership_fee = request.POST['membership_fee']
            
            Membership_fee.objects.create(membership_fee=membership_fee)
            messages.success(request, 'Added successfully.')
            return redirect('/membership_fee')
        else:
            data = Membership_fee.objects.all()
            return render(request,'master/membership_fee.html',{'data':data})   
    else:
        return redirect('/home')
    
def edit_membership_fee(request):
    if 'master' in request.session:
        data = Membership_fee.objects.get(mf_id=request.GET['mf_id'])
        return render(request,'master/edit_membership_fee.html',{'data':data})
    else:
        return redirect('/home')
    
def update_membership_fee(request):
    if 'master' in request.session:
        if request.method == 'POST':
            mf_id = request.POST['mf_id']
            membership_fee = request.POST['membership_fee']

            Membership_fee.objects.filter(mf_id=mf_id).update(membership_fee=membership_fee)
            messages.success(request, 'Updated successfully.')
            return redirect('/membership_fee')
        else:
            return redirect('/membership_fee')
    else:
        return redirect('/home')

def delete_service(request):
    if 'master' in request.session:
        data = Services.objects.get(s_id=request.GET['s_id'])
        data.delete()
        messages.success(request, 'Deleted successfully')
        return redirect('/service')
    else:
        return redirect('/home')

def service_request(request):
    if 'user' in request.session:
        if request.method == 'POST':
            district_id = request.POST['district_id']
            service_id = request.POST['service_id']
            title = request.POST['title']
            place = request.POST['place']
            description = request.POST['description']

            Service_request.objects.create(district_id=district_id,place=place,description=description,
                                    service_id=service_id,requested_date=today,status='Pending',
                                    title=title,user_id=request.session['user'])
            messages.success(request, 'Submitted successfully.')
            return redirect('/service_request?s_id='+service_id)
        else:
            state = State.objects.all()
            data = Services.objects.get(s_id=request.GET['s_id'])
            return render(request,'user/service_request.html',{'data':data,'state':state})
    elif 'master' in request.session:
        data = Service_request.objects.filter(status='Pending')
        return render(request,'master/service_request.html',{'data':data})
    else:
        return redirect('/home')

def worker_assign(request):
    if 'master' in request.session:
        data = Service_request.objects.get(sr_id=request.GET['sr_id'])
        state = State.objects.all()
        service = Services.objects.all()
        return render(request,'master/worker_assign.html',{'data':data,'state':state,'service':service})
    else:
        return redirect('/home')

def search_worker(request):
    state = request.GET['state_id']
    district = request.GET['district_id']
    place = request.GET['place']
    service_id = request.GET['service_id']
    service_id_list = service_id.split(',')
    service_id_int = [int(id_str) for id_str in service_id_list]
    
    last_memberships = Membership.objects.filter(membership_validity__gte=today).values('worker_id').annotate(
        last_membership=models.Max('m_id')
    ).values_list('worker_id', flat=True)

    print(last_memberships)

    mm = Worker_register.objects.filter(w_id__in=last_memberships)
    l=[]
    for i in mm:
        l.append(i.w_id)
    print(l)

    data = Worker_register.objects.annotate(
        completed_count=Count(
            Case(
                When(work_assigns__status='Completed', then=Value(1)),
                output_field=models.IntegerField()
            )
        ),
        total_assigns=Count('work_assigns'),
    ).filter(
        Q(completed_count=F('total_assigns')) | Q(total_assigns=0)|Q(total_assigns__isnull=True),
        log__approval_status="Approved",
        district__state_id=state,
        district_id=district,
        place__icontains=place,
        service_id__in=service_id_int,  # Assuming service is a ForeignKey in Worker_register
        w_id__in=l
    ).distinct()

    # data = Worker_register.objects.filter(Q(work_assigns__status="Completed")|Q(work_assigns__isnull=True),log__approval_status="Approved",district_id=district,district__state_id=state,service_id=service_id,place__icontains=place)

    # data = Worker_register.objects.filter(district_id=district,district__state_id=state,place__icontains=place,log__approval_status='Approved',service_id=service_id)
    str1 = '''<table class="table select-table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Worker</th>
                            <th>Student</th>
                            <th>Location</th>
                            <th>Select<div id="msg" style="color: brown;font-size: small;"></div></th>
                        </tr>
                        </thead>
                    <tbody>'''
    str2 = ''
    if data:
        for i in data:
            str2+=f''' 
                    <tr>
                        <td>
                        </td>
                        <td>
                        <div class="d-flex ">
                            <img src="{i.image}" alt="">
                            <div>
                            <h6>{i.name}</h6>
                            <p class="badge-opacity-success px-4">{i.service.service_name}</p>
                            </div>
                        </div>
                        </td>
                        <td>'''
            if i.student == 'Yes':
                str2+=f'''<p class="bg-warning text-white h6 p-2">{i.student}</p> 
                <p class="bg-danger text-white h6 p-2">{i.work_time}</p>'''
            else:
                str2+=f'''<p>{i.student}</p>'''       
            str2+=f'''</td>
            <td>
            <p><b class="p-2">{i.district.state.state}</b></p>
            <p><b class="badge badge-opacity-danger">{i.district.district}</b></p>
            <h6><b class="badge badge-opacity-warning">{i.place}</b></h6>
            </td>
            <td>
            <div class="form-check form-check-flat mt-0">
                <label class="form-check-label">
                <input type="checkbox" class="form-check-input" name="worker_id" value="{i.w_id}" aria-checked="false"><i class="input-helper"></i></label>
            </div>
            </td>
        </tr>
                    
                    '''
        str1 = str1+str2 + '</tbody></table><input type="submit" value="Assign" class="btn btn-sm btn-success">'
    return HttpResponse(str1)

def membership_payment(request):
    if 'worker' in request.session:
        if request.method == 'POST':
            amount = request.POST['amount']

            t = today + timedelta(days=30)
            membership_validity = t

            Membership.objects.create(membership_date=today,amount=amount,membership_validity=membership_validity,worker_id=request.session['worker'])
            messages.success(request, 'You got the membership.')
            return redirect('/membership_payment')
        else:
            try:
                amount = Membership_fee.objects.first().membership_fee
            except Exception:
                amount = None
            return render(request,'worker/membership_payment.html',{'amount':amount})
    else:
        return redirect('/home')
    
def payment_list(request):
    if 'master' in request.session:
        data = Membership.objects.all().order_by('-m_id')
        return render(request,'master/membership_list.html',{'data':data})
    elif 'worker' in request.session:
        data = Membership.objects.filter(worker_id=request.session['worker']).order_by('-m_id')
        return render(request,'worker/payment_list.html',{'data':data})
    else:
        return redirect('/home')

def assign_work(request):
    if 'master' in request.session:
        if request.method == 'POST':
            service_request_id = request.POST['service_request_id']
            worker_id = request.POST.getlist('worker_id')
            s = len(worker_id)
            for i in range(s):
                Work_assigns.objects.create(service_request_id=service_request_id,worker_id=worker_id[i])
            Service_request.objects.filter(sr_id=service_request_id).update(status=None)
            messages.success(request, 'work assigned successfully.')
            return redirect('/pending_works')
        else:
            return redirect('/service_request')
    else:
        return redirect('/home')

def pending_works(request):
    if 'master' in request.session:
        data = Service_request.objects.filter(status=None).order_by('-sr_id')
        return render(request,'master/pending_works.html',{'data':data})
    elif 'user' in request.session:
        data = Service_request.objects.filter(Q(status=None)|Q(status="Pending"),user_id=request.session['user']).order_by('-sr_id')
        return render(request,'user/pending_works.html',{'data':data})
    elif 'worker' in request.session:
        data = Work_assigns.objects.filter(status=None,worker_id=request.session['worker']).order_by('-wa_id')
        return render(request,'worker/assigned_work.html',{'data':data})
    else:
        return redirect('/home')

def completed_works(request):
    if 'master' in request.session:
        data = Service_request.objects.filter(status="Completed").order_by('-sr_id')
        return render(request,'master/completed_works.html',{'data':data})
    elif 'user' in request.session:
        data = Service_request.objects.filter(status="Completed",user_id=request.session['user']).order_by('-sr_id')
        return render(request,'user/completed_works.html',{'data':data})
    elif 'worker' in request.session:
        data = Work_assigns.objects.filter(status="Completed",worker_id=request.session['worker']).order_by('-wa_id')
        return render(request,'worker/completed_works.html',{'data':data})
    else:
        return redirect('/home')

def work_details(request):
    if 'user' in request.session:
        data = Service_request.objects.get(sr_id=request.GET['sr_id'])
        data2 = Work_assigns.objects.filter(service_request_id=request.GET['sr_id'])
        return render(request,'user/work_details.html',{'data':data,'data2':data2})
    elif 'master' in request.session:
        data = Service_request.objects.get(sr_id=request.GET['sr_id'])
        data2 = Work_assigns.objects.filter(service_request_id=request.GET['sr_id'])
        return render(request,'master/work_details.html',{'data':data,'data2':data2})
    elif 'worker' in request.session:
        data = Service_request.objects.get(sr_id=request.GET['sr_id'])
        data2 = Work_assigns.objects.filter(service_request_id=request.GET['sr_id'])
        data3 = Work_assigns.objects.get(service_request_id=request.GET['sr_id'],worker_id=request.session['worker'])
        return render(request,'worker/work_details.html',{'data':data,'data2':data2,'data3':data3})
    else:
        return redirect('/home')

def update_work_status(request):
    if 'user' in request.session:
        if request.method == 'POST':
            sr_id = request.POST['sr_id']
            status = request.POST['status']
            Service_request.objects.filter(sr_id=sr_id).update(status=status)
            messages.success(request, 'Updated successfully.')
            return redirect('/work_details?sr_id='+sr_id)
        else:
            return redirect('/pending_works')
    else:
        return redirect('/home')
    
def work_completed(request):
    if 'worker' in request.session:
        wa_id = request.GET['wa_id']
        status = request.GET['status']
        Work_assigns.objects.filter(wa_id=wa_id).update(status=status,completed_date=today)
        messages.success(request, 'Updated successfully.')
        return redirect('/completed_works')
    else:
        return redirect('/home')

def feedback(request):
    if 'user' in request.session:
        if request.method == 'POST':
            feedback = request.POST['feedback']
            service_request_id = request.POST['service_request_id']
            Feedback.objects.create(feedback=feedback,service_request_id=service_request_id,feedback_date=today,user_id=request.session['user'])
            messages.success(request, 'Submittd successfully')
            return redirect('/feedback?sr_id='+service_request_id)
        else:
            # data = Feedback.objects.filter(user_id=request.session['user']).order_by('-f_id')
            return render(request,'user/feedback.html',{'service_request_id':request.GET['sr_id']})
    elif 'master' in request.session:
        data = Feedback.objects.all().order_by('-f_id')
        return render(request,'master/feedback.html',{'data':data})
    else:
        return redirect('/home')
    
def my_feedback(request):
    if 'user' in request.session:
        data = Feedback.objects.filter(user_id=request.session['user']).order_by('-f_id')
        return render(request,'user/my_feedback.html',{'data':data})
    else:
        return redirect('/home')

def reply(request):
    if 'master' in request.session:
        if request.method == 'POST':
            f_id = request.POST['f_id']
            reply = request.POST['reply']
            Feedback.objects.filter(f_id=f_id).update(reply=reply)
            messages.success(request, 'Submitted successfully')
            return redirect('/feedback')
        else:
            return redirect('/feedback')
    else:
        return redirect('/home')

def profile(request):
    if 'user' in request.session:
        if request.method == 'POST':
            name = request.POST['name']
            email = request.POST['email']
            contact_number = request.POST['contact_number']
            address = request.POST['address']

            User_register.objects.filter(u_id=request.session['user']).update(name=name,email=email,contact_number=contact_number,address=address)
            messages.success(request, 'Updated successfully.')
            return redirect('/profile')
        else:
            data = User_register.objects.get(u_id=request.session['user'])
            return render(request,'user/profile.html',{'data':data})
    elif 'worker' in request.session:
        if request.method == 'POST':
            name = request.POST['name']
            email = request.POST['email']
            contact_number = request.POST['contact_number']
            address = request.POST['address']
            place = request.POST['place']
            service_id = request.POST['service_id']
            district_id = request.POST['district_id']
            work_experience = request.POST['work_experience']
            

            if 'image' in request.FILES:
                im=request.FILES['image']
                obj = FileSystemStorage()
                fl = obj.save(im.name,im)
                image = obj.url(fl)
                Worker_register.objects.filter(w_id=request.session['worker']).update(image=image)

            Worker_register.objects.filter(w_id=request.session['worker']).update(name=name,email=email,contact_number=contact_number,address=address,
                                           place=place,service_id=service_id,district_id=district_id,work_experience=work_experience,)
            messages.success(request, 'Updated successfully.')
            return redirect('/profile')
        else:
            data = Worker_register.objects.get(w_id=request.session['worker'])
            state = State.objects.all()
            data2 = Services.objects.all()
            return render(request,'worker/profile.html',{'data':data,'state':state,'data2':data2})
    else:
        return redirect('/home')

def change_password(request):
    if 'user' in request.session:
        if request.method == 'POST':
            current_password = request.POST['current_password']
            password = request.POST['password']
            try:
                data = Login.objects.get(log_id=request.session['log_id'])
                if data.password == current_password:
                    Login.objects.filter(log_id=request.session['log_id']).update(password=password)
                    messages.success(request, 'Your Password has been Reset successfully.....')
                    return redirect('/change_password')
                else:
                    messages.success(request, 'Enter valid current password',extra_tags='msg')
                    return redirect('/change_password')
            except Exception:
                messages.success(request, 'Invalid User',extra_tags='msg')
                return redirect('/change_password')
        else:
            return render(request,'user/change_password.html')
    elif 'worker' in request.session:
        if request.method == 'POST':
            current_password = request.POST['current_password']
            password = request.POST['password']
            try:
                data = Login.objects.get(log_id=request.session['log_id'])
                if data.password == current_password:
                    Login.objects.filter(log_id=request.session['log_id']).update(password=password)
                    messages.success(request, 'Your Password has been Reset successfully.....')
                    return redirect('/change_password')
                else:
                    messages.success(request, 'Enter valid current password',extra_tags='msg')
                    return redirect('/change_password')
            except Exception:
                messages.success(request, 'Invalid User',extra_tags='msg')
                return redirect('/change_password')
        else:
            return render(request,'worker/change_password.html')
    elif 'master' in request.session:
        if request.method == 'POST':
            current_password = request.POST['current_password']
            password = request.POST['password']
            try:
                data = Login.objects.get(log_id=request.session['log_id'])
                if data.password == current_password:
                    Login.objects.filter(log_id=request.session['log_id']).update(password=password)
                    messages.success(request, 'Your Password has been Reset successfully.....')
                    return redirect('/change_password')
                else:
                    messages.success(request, 'Enter valid current password',extra_tags='msg')
                    return redirect('/change_password')
            except Exception:
                messages.success(request, 'Invalid User',extra_tags='msg')
                return redirect('/change_password')
        else:
          return render(request,'master/change_password.html')
    else:
        return redirect('/home')

def display_district(request):
    try:
        dis = District.objects.filter(state_id=request.GET.get("state_id"))
    except Exception:
        data=[]
        data['error_message'] = 'error' 
        return JsonResponse(data)
    return JsonResponse(list(dis.values('district_id', 'district')), safe = False)


def sign_out(request):
    logout(request)
    request.session.delete()
    return redirect('/home')

def check_username(request):
    username = request.GET.get("username")
    data = {
       'username_exists':      Login.objects.filter(username=username).exists(),
        'error':"This Username already has an account"
    }
    if(data["username_exists"]==False):
        data["success"]="Available"

    return JsonResponse(data)

def master_reg(request):
    if request.method == 'POST':
        username = request.POST['username']
        password =  request.POST['password']
        Login.objects.create(username=username,password=password,role='admin')
        return redirect('/master_reg')
    else:
        return render(request,'master_reg.html')

