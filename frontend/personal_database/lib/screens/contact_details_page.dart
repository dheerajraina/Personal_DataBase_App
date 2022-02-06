import 'package:flutter/material.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails({ Key? key }) : super(key: key);

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: Center(
        child: Text("Contact Details"),
      ),
      
    );
  }
}