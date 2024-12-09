import 'package:shrayesh_patro/News/models_news/news_model.dart';
import 'package:shrayesh_patro/services/router_service.dart';
import 'package:shrayesh_patro/News/utils_news/assets_manager.dart';
import 'package:shrayesh_patro/News/utils_news/extensions.dart';
import 'package:shrayesh_patro/News/view/home_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BreakingSliderItem extends StatelessWidget {
  const BreakingSliderItem({
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
      child: Container(
        width: context.width * 0.85,
        height: context.height * 0.25,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              offset: const Offset(0, 4),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: newsModel.media!,
                errorWidget: (context, url, error) => Image.asset(
                  AssetsManager.newsImagePlaceholder,
                  fit: BoxFit.cover,
                ),
                placeholder: (context, url) => Image.asset(
                  AssetsManager.newsImagePlaceholder,
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 20.0,
                ),
                color: Colors.black.withOpacity(0.35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CategoryWidget(),
                    const Spacer(),
                    InfoItem(newsModel: newsModel),
                    SizedBox(
                      width: context.width * 0.6,
                      child: Text(
                        newsModel.title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
