import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shrayesh_patro/News/models_news/show_category.dart';


class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoriesNews(String category) async {
    String url =
        'https://sgrayesh-dahal.github.io/bhupendra/categorynews.json';
    final response = await http.get(Uri.parse(url));

    final jsonData = jsonDecode(response.body);

    if (jsonData['source'] == 'Latest Feed') {
      jsonData['articles'].forEach((element) {
        if (element['media'] != null && element['description'] != null) {
          final categoryModel = ShowCategoryModel(
            title: element['title'],
            description: element['description'],
            link: element['link'],
            media: element['media'],
            source: element['source'],

          );
          categories.add(categoryModel);
        }
      });
    }
  }
}
