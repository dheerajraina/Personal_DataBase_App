from rest_framework import serializers
from personalDB.models import Contact

class ContactSerializer(serializers.Serializer):
    first_name=serializers.CharField(required=True,max_length=30)
    last_name=serializers.CharField(max_length=30)
    email=serializers.EmailField(required=False,allow_blank=True)
    birthday=serializers.DateField(required=True)
    mobile=serializers.CharField(required=True,max_length=10)
    address=serializers.CharField(required=True,max_length=300)


    # def create(self, validated_data):
    #     '''
    #     create and return new contact instance given the validated
    #     data 

    #     ''' 

    #     return Contact.objects.create(**validated_data)




# class ContactSerializer(serializers.HyperlinkedModelSerializer):

#     class Meta:
#         model=Contact
#         fields=['first_name','last_name','email','birthday','mobile','address']\





{'first_name': 'Dheeraj', 'last_name': 'Raina', 'email': '', 'birthday': '1998-10-31', 'mobile': '', 'address': ''}