import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrayesh_patro/News/bookmark/bookmark_screen.dart';
import 'package:shrayesh_patro/extensions/l10n.dart';
import 'package:shrayesh_patro/News/pages/category_news.dart';
import 'package:shrayesh_patro/screens/search_page.dart';

class Music extends StatelessWidget {
  const Music({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n!.news),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(right: 30),
            icon: const Icon(Icons.search, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ), //IconButton
          IconButton(
            padding: const EdgeInsets.only(right: 30),
            icon: const Icon(Icons.bookmark),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const BookmarkScreen()),
              );
            },
          ), //IconButto
          //IconButton
        ], //<Widget>[]
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.newspaper),
          onPressed: () {
            Navigator.push(
              context,
                CupertinoPageRoute(builder: (context) => CategoryNews(name: 'Source News',),)
            );
          },
        ), //IconButto
      ),
    ); //AppBar
  }
}
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Icon(
          icon,
          color: Colors.red,
        ),
      ),
    );
  }
}
