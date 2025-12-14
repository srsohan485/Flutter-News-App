import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';
class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key,required this.newsModel}); //newModel required korci

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.newsModel.title.toString(),style: TextStyle(color: Colors.white),), //StatefulWedget er khatre widget diye model name
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(children: [
          CachedNetworkImage(
            height: 200,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            imageUrl: widget.newsModel.urlToImage.toString(),
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
                child: Text(widget.newsModel.source!.name.toString(),style: TextStyle(fontSize: 18,color: Colors.white),),
              ),
              SizedBox(width: 10,),
              Text(widget.newsModel.publishedAt.toString()),
              SizedBox(width: 10,),
              Text(widget.newsModel.author == null? "":"Author :"+widget.newsModel.author.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 10,),
          Text(widget.newsModel.title.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Text(widget.newsModel.description.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(height: 15),
          ElevatedButton(onPressed: ()async{
            final Uri uri=Uri.parse(widget.newsModel.url.toString());
            if(!await launchUrl(uri)){
              throw Exception("Could Not Launc");
            }
          }, child: Text("Read More..."))
        ],),
      ),
    );
  }
}
