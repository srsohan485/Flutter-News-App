import 'dart:convert';

import 'package:http/http.dart';
import 'package:news/model/news_model.dart';

class APIservices{
  final all_news_api='https://newsapi.org/v2/everything?q=bitcoin&apiKey=1f59a24fceef420e80f21652983c11cd';
  final top_news_api='https://newsapi.org/v2/top-headlines?country=us&apiKey=1f59a24fceef420e80f21652983c11cd';

  Future<List<NewsModel>> all_news()async{
    try{
      Response response=await get(Uri.parse(all_news_api));
      if(response.statusCode==200){
        Map<String,dynamic> json=jsonDecode(response.body);
        List<dynamic> body=json['articles'];
        List<NewsModel> articleList=body.map((news)=>NewsModel.fromJson(news)).toList();
        return articleList;
      }else{
        throw("News No Found");
      }
    }catch(e){
      throw e;
    }
  }


  Future<List<NewsModel>> topNews()async{
    try{
      Response response=await get(Uri.parse(top_news_api));
      if(response.statusCode==200){
        Map<String,dynamic> json=jsonDecode(response.body);
        List<dynamic> body=json['articles'];
        List<NewsModel> articleList=body.map((news)=>NewsModel.fromJson(news)).toList();
        return articleList;
      }else{
        throw("News No Found");
      }
    }catch(e){
      throw e;
    }
  }
}