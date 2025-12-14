import 'package:flutter/material.dart';
import 'package:news/views/all_news.dart';
import 'package:news/views/contact.dart';
import 'package:news/views/top_news.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages=[AllNews(),TopNews(),Contact()];
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App",style: TextStyle(color: Colors.white),),
      centerTitle: true,
      backgroundColor: Colors.deepPurple
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.newspaper),label: "All News"),
        BottomNavigationBarItem(icon: Icon(Icons.info_outline_rounded),label: "Top New"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Contact Us"),
      ],
      backgroundColor: Colors.orange,
        iconSize: 35,
        fixedColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index){
        setState(() {
          _selectedIndex=index;
        });
        },
      ),
      body: pages[_selectedIndex],
    );
  }
}

