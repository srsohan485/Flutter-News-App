import 'package:flutter/material.dart';

import '../api_service/api_services.dart';
import '../model/news_model.dart';
import 'news_item.dart';
class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  APIservices apiServices=APIservices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: apiServices.all_news(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<NewsModel> articleList=snapshot.data?? [];
              return ListView.builder(
                  itemBuilder: (context,index){
                    return NewsItem(newsModel: articleList[index],);
                  },
                  itemCount: articleList.length
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
