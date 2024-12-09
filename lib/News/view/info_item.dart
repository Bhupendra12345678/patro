import 'package:shrayesh_patro/News/models_news/news_model.dart';
import 'package:flutter/material.dart';




class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.newsModel,
  });

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Text(

          newsModel.pubdate!.substring(0, 17),
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
