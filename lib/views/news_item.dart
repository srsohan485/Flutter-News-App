import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/news_model.dart';
class NewsItem extends StatelessWidget {
  NewsModel newsModel;
  NewsItem({super.key,required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            height: 200,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            imageUrl: newsModel.urlToImage.toString(),
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

          SizedBox(height: 10,),

          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                color: Colors.deepPurple),
                child: Text(newsModel.source!.name.toString(),style: TextStyle(fontSize: 18,color: Colors.white),),
              ),
              SizedBox(width: 10,),
              Text(newsModel.publishedAt.toString())
            ],
          ),
          SizedBox(height: 10,),
          Text(newsModel.author == null? "":"Author :"+newsModel.author.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          Text(newsModel.title.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
