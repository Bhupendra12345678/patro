import 'package:shrayesh_patro/News/utils_news/extensions.dart';
import 'package:flutter/material.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.15,
      height: context.height * 0.03,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),

      ),
      child: const Center(
        child: Text(
          '',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
