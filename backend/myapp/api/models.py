from django.db import models

# Create your models here.

class Contact(models.Model):
    name=models.CharField(max_length=30)
    phone_number=models.CharField(max_length=10)
    email=models.CharField(max_length=50)

    def __str__(self):
        return self.name

