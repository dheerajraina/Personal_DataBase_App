from django.db import models

# Create your models here.


class Contact (models.Model):
    first_name=models.CharField(max_length=30)
    last_name=models.CharField(max_length=30)
    email=models.EmailField()
    birthday=models.DateField()
    mobile=models.CharField(max_length=10,primary_key=True)
    address=models.CharField(max_length=300)
    
    
