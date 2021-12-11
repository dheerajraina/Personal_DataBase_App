# from django.shortcuts import render

# Create your views here.

from django.http import HttpResponse,JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from personalDB.serializers import ContactSerializer
from personalDB.models import Contact

@csrf_exempt
def contact_list(request):
    
    if request.method=="GET":
        contact=Contact.objects.all()
        serializer=ContactSerializer(contact,many=True)
        return JsonResponse(serializer.data,safe=False)

    elif request.method=='POST':
        data=JSONParser().parse(request)
        serializer=ContactSerializer(data=data)

        if serializer.is_valid():
            serializer.save()

            return JsonResponse(serializer.data,status=200)
        
        return JsonResponse(serializers.errors,status=400)



@csrf_exempt

def contact_details(request,query):

    try:
        contact=Contact.objects.get(pk=query)
    
    except Contact.DoesNotExist:
        return HttpResponse(status=400)
    
    if request.method=="GET":
        serializer=ContactSerializer(contact)
        return JsonResponse(serializer.data)

    elif request.method=='PUT':
        data=JSONParser().parse(request)
        serializer=ContactSerializer(contact,data=data)
        
        if serializer.is_valid():
            serializer.save()

            return JsonResponse(serializer.data,status=200)
        
        return JsonResponse(serializers.errors,status=400)


    elif request.method=='DELETE':
        contact.delete()
        return HttpResponse(status=204)
