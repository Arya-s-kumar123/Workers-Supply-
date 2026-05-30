"""
URL configuration for workers_supply project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from .import views

urlpatterns = [
    path('', views.home),
    path('home/', views.home),
    path('login/', views.login),
    path('user_register/', views.user_register),
    path('worker_register/', views.worker_register),
    path('user_home/', views.user_home),
    path('master_home/', views.master_home),
    path('worker_home/', views.worker_home),
    path('about/', views.about),
    
    path('service/', views.service),
    path('edit_service/', views.edit_service),
    path('update_service/', views.update_service),
    path('delete_service/', views.delete_service),
    path('worker_request/', views.worker_request),
    path('worker_approval/', views.worker_approval),
    path('workers_list/', views.workers_list),
    path('membership_fee/', views.membership_fee),
    path('edit_membership_fee/', views.edit_membership_fee),
    path('update_membership_fee/', views.update_membership_fee),
    
    path('service_request/', views.service_request),
    path('worker_assign/', views.worker_assign),
    path('search_worker/', views.search_worker),
    path('assign_work/', views.assign_work),
    

    path('membership_payment/', views.membership_payment),
    path('payment_list/', views.payment_list),
    

    path('pending_works/', views.pending_works),
    path('completed_works/', views.completed_works),
    path('work_details/', views.work_details),
    path('update_work_status/', views.update_work_status),
    path('work_completed/', views.work_completed),
    path('delete_worker/', views.delete_worker),

    path('feedback/', views.feedback),
    path('my_feedback/', views.my_feedback),
    path('reply/', views.reply),
    path('profile/', views.profile),
    path('change_password/', views.change_password),
    path('display_district/', views.display_district),
    path('sign_out/', views.sign_out),
    path('check_username/', views.check_username),
    path('master_reg/', views.master_reg),

]

