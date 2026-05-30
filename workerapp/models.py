from django.db import models

# Create your models here.

class Login(models.Model):
    log_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=20)
    password = models.TextField()
    role = models.CharField(max_length=15)
    approval_status = models.CharField(max_length=15,null=True,blank=True)
    class Meta:
        db_table = 'tb_Login'

class State(models.Model):
    state_id=models.AutoField(primary_key=True)
    state=models.CharField(max_length=50)
    class Meta:
        db_table='tb_State'

class District(models.Model):
    district_id=models.AutoField(primary_key=True)
    state = models.ForeignKey(State, on_delete=models.CASCADE,null=True)
    district=models.CharField(max_length=50)
    class Meta:
        db_table='tb_District'

class User_register(models.Model):
    u_id = models.AutoField(primary_key=True)
    log =  models.ForeignKey(Login,on_delete=models.CASCADE)
    name = models.CharField(max_length=30)
    email = models.CharField(max_length=40)
    contact_number = models.BigIntegerField()
    address = models.TextField()
    class Meta:
        db_table = 'tb_User_register'

class Services(models.Model):
    s_id = models.AutoField(primary_key=True)
    service_name = models.CharField(max_length=60)
    image = models.TextField()
    description = models.TextField()
    class Meta:
        db_table = 'tb_Services'

class Worker_register(models.Model):
    w_id = models.AutoField(primary_key=True)
    log =  models.ForeignKey(Login,on_delete=models.CASCADE)
    service = models.ForeignKey(Services,on_delete=models.SET_NULL,null=True,blank=True)
    name = models.CharField(max_length=30)
    email = models.CharField(max_length=40)
    contact_number = models.BigIntegerField()
    place = models.CharField(max_length=50)
    address = models.TextField()
    district =  models.ForeignKey(District,on_delete=models.SET_NULL,null=True,blank=True)
    proof = models.TextField()
    student = models.CharField(max_length=20,null=True)
    work_time = models.CharField(max_length=50,null=True)
    image = models.TextField()
    work_experience = models.CharField(max_length=20)
    class Meta:
        db_table = 'tb_Worker_register'

class Service_request(models.Model):
    sr_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User_register,on_delete=models.CASCADE)
    district =  models.ForeignKey(District,on_delete=models.SET_NULL,null=True,blank=True)
    service = models.ForeignKey(Services,on_delete=models.SET_NULL,null=True,blank=True)
    title = models.CharField(max_length=30)
    place = models.CharField(max_length=50)
    description = models.TextField()
    requested_date = models.DateField()
    status = models.CharField(max_length=40,null=True,blank=True)
    class Meta:
        db_table = 'tb_Service_request'

class Work_assigns(models.Model):
    wa_id = models.AutoField(primary_key=True)
    service_request = models.ForeignKey(Service_request,on_delete=models.CASCADE)
    worker = models.ForeignKey(Worker_register,on_delete=models.SET_NULL,null=True,blank=True)
    completed_date = models.DateField(null=True,blank=True)
    status = models.CharField(max_length=40,null=True,blank=True)
    class Meta:
        db_table = 'tb_Work_assigns'

class Membership_fee(models.Model):
    mf_id = models.AutoField(primary_key=True)
    membership_fee = models.FloatField()
    class Meta:
            db_table = 'tb_Membership_fee'


class Membership(models.Model):
    m_id = models.AutoField(primary_key=True)
    worker = models.ForeignKey(Worker_register,on_delete=models.SET_NULL,null=True,blank=True)
    membership_date = models.DateField()
    membership_validity = models.DateField() 
    amount = models.FloatField()
    class Meta:
        db_table = 'tb_Membership'

class Feedback(models.Model):
    f_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User_register,on_delete=models.CASCADE)
    service_request = models.ForeignKey(Service_request,on_delete=models.CASCADE,null=True)
    feedback_date = models.DateField()
    feedback = models.TextField()
    reply = models.TextField(null=True,blank=True)
    class Meta:
        db_table = 'tb_Feedback'


