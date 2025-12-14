import 'package:flutter/material.dart';
import 'package:news/api_service/api_services.dart';
import 'package:news/model/news_model.dart';
import 'package:news/views/news_item.dart';
class TopNews extends StatefulWidget {
  const TopNews({super.key});

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  APIservices apiServices=APIservices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: apiServices.topNews(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<NewsModel> articleList=snapshot.data?? [];
              return ListView.builder(
                  itemBuilder: (context,index){
                    return NewsItem(newsModel: articleList[index],);  //NewsItem Class daka hoyece
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
