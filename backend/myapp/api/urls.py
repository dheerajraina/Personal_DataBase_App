from django.urls import path

from . import views

urlpatterns=[
    
    path('', views.apiOverview, name='api-overview'),

    path('contact-list/', views.contactList, name='contact-list'),

    path('contact-detail/<str:pk>/', views.contactDetail, name='contact-detail'),

    path('contact-create/', views.contactCreate, name='contact-create'),

    path('contact-update/<str:pk>/', views.contactUpdate, name='contact-update'),

    path('contact-delete/<str:pk>/', views.contactDelete, name='contact-delete'),

]