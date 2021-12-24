from django.shortcuts import render
from django.http import JsonResponse


from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import ContactSerializer

from .models import Contact
# Create your views here.

@api_view(['GET'])
def apiOverview(request):
    api_urls={
        'List': '/contact-list/',
        'Detail View':'/contact-detail/<str:pk>/',
        'Create':'/contact-create/',
        'Update':'/contact-update/<str:pk>/',
        'Delete':'/contact-delete/str:pk/',

    }
    
    return Response(api_urls)


@api_view(['GET'])
def contactList(request):
    contacts=Contact.objects.all()
    serializer=ContactSerializer(contacts,many=True)
    return Response(serializer.data)


@api_view(['GET'])
def contactDetail(request,pk):
    contact=Contact.objects.get(id=pk)
    serializer=ContactSerializer(contact,many=False)
    return Response(serializer.data)

@api_view(['POST'])
def contactCreate(request):
    
    serializer=ContactSerializer(data=request.data)

    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)


@api_view(['POST'])
def contactUpdate(request,pk):
    contact=Contact.objects.get(id=pk)
    serializer=ContactSerializer(instance=contact,data=request.data)

    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)


@api_view(['DELETE'])
def contactDelete(request,pk):
    contact=Contact.objects.get(id=pk)
    contact.delete()
    # return Response(serializer.data)
    return "Item deleted Sucessfully"


