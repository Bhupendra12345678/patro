import 'package:shrayesh_patro/News/models_news/news_model.dart';
import 'package:shrayesh_patro/services/router_service.dart';
import 'package:shrayesh_patro/News/utils_news/assets_manager.dart';
import 'package:shrayesh_patro/News/utils_news/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Backup/function.dart';


class RecNewsItem extends StatelessWidget {
  const RecNewsItem({
    super.key,
    required this.newsModel,
  });

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(
        NavigationManager.newsDetailsScreenRoute,
        extra: newsModel,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
    padding:
    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: newsModel.media!,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Image.asset(
                      AssetsManager.newsImagePlaceholder,
                      fit: BoxFit.cover,
                    ),
                    placeholder: (context, url) => Image.asset(
                      AssetsManager.newsImagePlaceholder,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                (context.width * 0.04).spaceX,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        newsModel.title!,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,

                        ),
                        maxLines: 2,
                      ),
                      Text(
                        newsModel.description!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,

                        ),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 0),
                   Row(
                      children: [
                        SizedBox(
                          height: 27,
                          width: 27,
                  child: ClipRRect(

                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    newsModel.profile ??
                        'https://static.toiimg.com/thumb/msid-46918916,width=1200,height=900/46918916.jpg',
                      fit:BoxFit.fill

                  ),
                ),
            ),


                        (context.width * 0.009).spaceX,
                        Text(
                          newsModel.source!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 0.0,
                          ),
                        ),
                        (context.width * 0.010).spaceX,
                        const CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 3.0,
                        ),
                        (context.width * 0.009).spaceX,
                        Text(
                          newsModel.pubdate!.substring(0, 17),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                   ),
                    ],
                  ),
                ),
              ],
            ),
            ),
          ),
        ),
      )
    );

  }
}
