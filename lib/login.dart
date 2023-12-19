
import 'package:assignmentlogin/register.dart';
import 'package:assignmentlogin/showdata.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _RegisterState();
}

class _RegisterState extends State<Login> {
  TextEditingController userEmail = TextEditingController();
  TextEditingController userpass = TextEditingController();

  void login()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail.text, password: userpass.text);
      Navigator.push(context, PageRouteBuilder(pageBuilder:(context, animation, secondaryAnimation) =>Mydata()));
    } on FirebaseAuthException catch(error){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${error.code.toString()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text("Login",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic
              ),),
            ),
            Center(
              child: Container(
                width: 130,
                child: Divider(
                  height: 2,
                  color: Colors.green,
                  thickness: 2,

                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            TextFormField(
              controller: userEmail,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(Icons.email),
                  hintText: "john@gmail.com",
                  label: Text("Enter Email")
              ),
            ),
            SizedBox(
              height: 20,
            ),

            TextFormField(
              controller: userpass,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(Icons.key),
                  hintText: "123*****46",
                  label: Text("Enter password")
              ),
            ),
            SizedBox(
              height: 20,
            ),

            ElevatedButton(onPressed: (){
              login();

            }, child: Container(
              width: 90,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),

              height: 40,
              child: Text("Login",style: TextStyle(
                  fontSize: 15.6
              ),),)),
            SizedBox(
              height: 15,
            ),
            TextButton(onPressed: (){
              Navigator.push(context, PageRouteBuilder(pageBuilder:(context, animation, secondaryAnimation) => Register()));
            }, child: Text(" have already account"))



          ],
        ),
      ),


    );
  }
}
