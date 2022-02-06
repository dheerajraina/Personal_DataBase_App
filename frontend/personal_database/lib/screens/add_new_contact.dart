// import 'dart:html';

import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

class NewContact extends StatefulWidget {
  const NewContact({ Key? key }) : super(key: key);

  @override
  _NewContactState createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {

  // final _formKey=GlobalKey<FormState>();
  bool _isButtonDisabled=true;
    String name='';
    String phone='';
    String email='';

    // var dio=Dio();

    late var response;
// http://10.0.2.2:8000/api/contact-create/

  postData(name,phone,email) async{
    // print("postData  "+phone);
    


    
    // {

    //     "name": "Princy Raina",
    //     "phone_number": "7006044141",
    //     "email": "princyraina@gmail.com"
    // }


    var usrData='{"name": "$name","phone_number":"$phone","email":"$email"}';
    // print("raw data=" +usrData);
    
   var response =await http.post(
    Uri.parse('http://10.0.2.2:8000/api/contact-create/'), 
                  
    headers: <String, String>{
    'Content-Type': 'application/json',
    },
                  
    body:usrData,
    
    );

    // print(response.body);
    return response;
  }
  @override
  Widget build(BuildContext context) {
    
    //  print(name+''+phone+''+email);
    
      // print(_isButtonDisabled);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          widthFactor: 3.2,
          child: Text("New Contact"),
        ),
        actions: [
          TextButton(
              
              onPressed:(){
                // print("$name has phone number $phone and email $email");

                // print(postData(name, phone, email));
                postData(name, phone, email);

                Navigator.pop(context);

                },
               
              child: Text(
                "Done",
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
              )
        ],
      ),
      body: Form(
       child: Column(
         children: [
           Padding(
             padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05,left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
             child: TextFormField(
              style:TextStyle(
                fontSize: 25,
              ),
               onChanged: (val){
                 
                 setState(() {
                   name=val;
                  //  print(_name.length);
                 });
               },
               
               decoration: InputDecoration(
                
                 focusedBorder: UnderlineInputBorder(
                   borderSide: BorderSide(
                     color: Colors.white,
                   ),
                 ),
                //  focusColor: Colors.white,
                
                //  fillColor: Colors.white,
                
                 labelText: "Enter name",
                 labelStyle: TextStyle(
                   color: Colors.red,
                   fontSize:20,
                 ),
                 
               ),
             ),
           ),

           Padding(
             padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05,left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
             child: TextFormField(
              style:TextStyle(
                fontSize: 25,
              ),
               onChanged: (val){
                //  print(val);
                // val.length==10?
                setState(() {
                   phone=val;
                  //  print(name.length);
                  _isButtonDisabled=false;
                  //  print(phone.length);
                 });
               },
               
               decoration: InputDecoration(
                
                 focusedBorder: UnderlineInputBorder(
                   borderSide: BorderSide(
                     color: Colors.white,
                   ),
                 ),
                //  focusColor: Colors.white,
                
                //  fillColor: Colors.white,
                
                 labelText: "Enter Phone Number",
                 labelStyle: TextStyle(
                   color: Colors.red,
                   fontSize:20,
                 ),
                 
               ),
             ),
           ),
           Padding(
             padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05,left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
             child: TextFormField(
              style:TextStyle(
                fontSize: 25,
              ),
               onChanged: (val){
                //  print(val);
                setState(() {
                   email=val;

                 });
               },
               
               decoration: InputDecoration(
                
                 focusedBorder: UnderlineInputBorder(
                   borderSide: BorderSide(
                     color: Colors.white,
                   ),
                 ),
                //  focusColor: Colors.white,
                
                //  fillColor: Colors.white,
                
                 labelText: "Enter Email",
                 labelStyle: TextStyle(
                   color: Colors.red,
                   fontSize:20,
                 ),
                 
               ),
             ),
           ),
      ], 
    ),
      )
    );
  }
}