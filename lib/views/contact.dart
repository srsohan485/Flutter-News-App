import 'package:flutter/material.dart';
class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.greenAccent,
        child: Column(
          children: [
            CircleAvatar(backgroundImage: AssetImage('images/sohan.png'),
            radius: 70
            ),
            Text("Sayedur Rahman",style: TextStyle(fontSize: 22),),
            Text("Flutter Developer",style: TextStyle(fontSize: 22),),
            SizedBox(
                width: 250,
              child: Divider(
                color: Colors.black,
                thickness: 5,
              ),
            ),
            Card(
              color: Colors.amber,
              child: ListTile(
                leading: Icon(Icons.call,size: 40,),
                title: Text("+8801852451485",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.amber,
              child: ListTile(
                leading: Icon(Icons.email,size: 40,),
                title: Text("sayedurrahmansohan@gmail.com",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
