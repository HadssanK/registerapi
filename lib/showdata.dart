import 'dart:convert';

import 'package:assignmentlogin/apilink.dart';
import 'package:assignmentlogin/uidesign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Mydata extends StatefulWidget {
  const Mydata({super.key});

  @override
  State<Mydata> createState() => _MydataState();
}

class _MydataState extends State<Mydata> {
  late Future<dynamic> _apiData;
  @override
  void initState() {
    super.initState();
    _apiData = apiproduct().apifetch();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          width: 230,
          child:  Column(
            children: [
              Container(
                width: 230,
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover, image: NetworkImage("https://tse4.mm.bing.net/th?id=OIP.9UbJkKEmppOpQuzHn9BX_QHaEK&pid=Api&P=0&h=220"))
                ),
              ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Setting"),
                        // subtitle: Text("sdfsdfsd"),
                      ),
                      ListTile(
                        leading: Icon(Icons.share),
                        title: Text("Share"),
                        // subtitle: Text("sdfsdfsd"),
                      ),

                      ListTile(
                        leading: Icon(Icons.local_grocery_store_outlined),
                        title: Text("Product"),
                        // subtitle: Text("sdfsdfsd"),
                      ),

                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Email"),
                        subtitle: Text("${FirebaseAuth.instance.currentUser!.email.toString()}",style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500
                        ),),
                      ),
                      ListTile(
                        leading: Icon(Icons.login_outlined),
                        title: Text("Logout"),
                        // subtitle: Text("sdfsdfsd"),
                      ),
                    ],
                  ),


                ],

          ),


      ),

      appBar: AppBar(
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage("https://tse2.mm.bing.net/th?id=OIP.RYsKHqksC3450NQnxSYt-wHaFP&pid=Api&P=0&h=220"),
          ),
          SizedBox(
            width: 20,
          )
        ],

        backgroundColor: Colors.pinkAccent,
        title: Text("Ecommerce Store",style: TextStyle(),),
      ),
      body: FutureBuilder(
        future: _apiData,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Icon(Icons.error_outline));
          } else {

            List mydata = jsonDecode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (context, index) {
                var id = mydata[index]["id"];

                return Container(
                  child: Mydesign(
                    title: mydata[index]["title"].toString(),
                    price: mydata[index]["price"].toString(),
                    image: mydata[index]["image"].toString(),
                  ),
                );
              },
              itemCount: mydata.length,
            );
          }
        },
      ),
      // backgroundColor: Colors.deepOrangeAccent,
    );
  }
}
