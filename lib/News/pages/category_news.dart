import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shrayesh_patro/extensions/l10n.dart';
import 'package:shrayesh_patro/News/models_news/show_category.dart';
import 'package:shrayesh_patro/News/pages/shimmer_news_tile.dart';
import 'package:shrayesh_patro/News/services_news/show_category_news.dart';
import 'package:url_launcher/url_launcher.dart';


class CategoryNews extends StatefulWidget {
  CategoryNews({super.key, required this.name});
  String name;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool _loading = true;
  Color baseColor = Colors.grey[300]!;
  Color highlightColor = Colors.grey[100]!;
  @override
  void initState() {
    super.initState();
    getNews();

  }

  getNews() async {
    final showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(widget.name.toLowerCase());
    categories = showCategoryNews.categories;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n!.source),
        ),


      body: _loading
          ? Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,

          itemBuilder: (BuildContext context, int index) {
            return ShimmerNewsTile();
          },
        ),
      )

          : ListView.builder(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ShowCategory(
                Image: categories[index].media!,
                desc: categories[index].description!,
                title: categories[index].title!,
                url: categories[index].link!
            );
          }),
    );
  }
}

class ShowCategory extends StatelessWidget {
  ShowCategory({super.key, required this.Image, required this.desc, required this.title, required this.url});
  String Image, desc, title, url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: Image,
              width: MediaQuery.of(context).size.width,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),



        ],
      ),
    );
  }
}
