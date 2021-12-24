import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_database/screens/add_new_contact.dart';
import 'package:personal_database/screens/contact_details_page.dart';



class HomePage extends StatefulWidget {
  // const MyApp({ Key? key }) : super(key: key);
// 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List _contacts=[];
  
  String _iniApha='';
  bool diffAlpha=false;
  //loading data from local json file 


  Future<void> readJson() async{
    final String response= await rootBundle.loadString('lib/assets/contacts_data.json');
    if(response.isNotEmpty){
        final data =await json.decode(response);

         setState(() {
      _contacts=data['contacts'];

    });
    }
    

   
    
  }


  @override
  void initState(){
    super.initState();

    readJson();
  }
  @override
  Widget build(BuildContext context) {
    //sorting the map of contacts according to name (alphabetically)alphabetical
    _contacts.sort((a,b)=>a['name'].compareTo(b['name']));
    

    // _contacts.forEach(
    //   (contact)=> print(contact['name'][0])
    // );

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("HEllo"),
      // ),
       
       body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             Container(
              //  color: Colors.black12,
              //  height: 209,
               child: Column(
                 children: [
                   Padding(padding: EdgeInsets.only(top: 30)),
              ListTile(
                trailing: IconButton(
                  onPressed: (){
                    // print("Add");
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=> NewContact())
                      );
                  }, 
                  icon: Icon(
                  
                  Icons.add,
                  color: Colors.blue,
                  size: MediaQuery.of(context).size.width * 0.07,
                
                  ),
                  ),
                  // tileColor: Colors.amber,
              ),
            
             ListTile(
               title: Text(
                 'Contacts',
                 style: TextStyle(
                   fontSize: MediaQuery.of(context).size.width * 0.09,
                   fontWeight: FontWeight.bold,
                 ),
                 ),
                //  tileColor: Colors.red,
             ),

            //  TextField(
            //    decoration: InputDecoration(
            //      hintText: 'Search',
            //      border
            //    ),

            //  ),
              SizedBox(
                child:DecoratedBox(
                  decoration:BoxDecoration(
                  // color: Colors.black,
                ),
                
                  ),
                  height: 10,
                  width: 20,
              ),
              
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: CupertinoSearchTextField(
                      onChanged: (val){
                        // print(val); 
                      },
                      onSubmitted: (val){
                        print(val);
                      },
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                        color: Colors.black12,
                        
                      ),
                    // padding: EdgeInsets.only(left:),
                ),
              ),
                SizedBox(
                  height: 1,
                ),
                 ],
               ),
             ),
              Divider(
                thickness: 1,
                color: Colors.black26,
                
                ),
             
              // SizedBox(
              //   child:DecoratedBox(
              //     decoration:BoxDecoration(
              //     color: Colors.black,
              //   ),
                
              //     ),
              //     height:5,
              //     width: 20,
              // ),
                
              Card(
                child: Row(
                  children:[
                    SizedBox(
                child:DecoratedBox(
                  decoration:BoxDecoration(
                  // color: Colors.black,
                ),
                
                  ),
                  height: 10,
                  width: 20,
              ),
                    CircleAvatar(
                  backgroundImage: NetworkImage("https://wegotthiscovered.com/wp-content/uploads/2021/07/Ultra-Instinct-Goku.jpg"),
                  radius: MediaQuery.of(context).size.width * 0.09,
                ),
                SizedBox(
                child:DecoratedBox(
                  decoration:BoxDecoration(
                  // color: Colors.black,
                ),
                
                  ),
                  height: 30,
                  width: 20,
              ),

              Card(
                child:Text(
                  "Dheeraj Raina",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                  ),
              ),
                  ],
                ),
                
              ),
    
             _contacts.isNotEmpty ?
            Expanded(
                    child: ListView.builder(
                      itemCount: _contacts.length,
                      itemBuilder: (context,index){
                        // print(index);
                        if(index!=0 && _iniApha!=_contacts[index]['name'][0]){
                            _iniApha=_contacts[index]['name'][0];

                            diffAlpha=true;
                        }
                        else{
                          if(index==0){
                                _iniApha=_contacts[index]['name'][0];
                                diffAlpha=true;
                          }
                          else{
                            diffAlpha=false;
                          }
                        }
                            
          
                        return Column(
                          
                          children: [

                            diffAlpha==true
                            ? Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.width * 0.07,
                              color: Colors.black12,
                            child: Row(
                              children:[
                                SizedBox(
                                  width: 20,

                                ),
                                Text(
                                  _iniApha,
                                  style: TextStyle(
                                    // fontWeight:FontWeight.bold,
                                    fontSize: MediaQuery.of(context).size.width * 0.046,
                                  ),
                                  ),
                              ],
                            ),

                            )
                            : Divider(),
                            Container(
                              height: 30,
                              // color: Colors.amber,
                              child: ListTile(
                                title: Text(_contacts[index]['name']),
                                 onTap: (){

                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(
                                      builder: (context) => ContactDetails() 
                                      )
                                    );
                                   
                                 },
                                
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 8)),
                            // Divider(),
                          ],
                        );
                      }
                      )
                      )
               : Container(
                // color: Colors.red,
                height: 400,
                 child: Center(
                   child: Text(
                     "No Contacts",
                     style: TextStyle(
                       fontSize: 20,
                     ),
                     ),
                 ),
               ),
          ],
           
         ),
         
       
    );
  }
}