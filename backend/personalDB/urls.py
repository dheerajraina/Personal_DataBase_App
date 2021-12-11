from django.urls import path
from django.contrib import admin

from personalDB import views

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('contacts/',views.contact_list),

    path('contacts/<query>/',views.contact_details),
]