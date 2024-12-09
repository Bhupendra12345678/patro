import 'package:shrayesh_patro/News/utils_news/extensions.dart';
import 'package:shrayesh_patro/News/utils_news/shimmer.dart';
import 'package:flutter/material.dart';


class BreakingNewsLoading extends StatelessWidget {
  const BreakingNewsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ShimmerWidget.rectangular(
          height: context.height * 0.16,
          width: context.width * 0.08,
          shapeBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
          ),
        ),
        ShimmerWidget.rectangular(
          width: context.width * 0.75,
          height: context.height * 0.2,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        ShimmerWidget.rectangular(
          height: context.height * 0.16,
          width: context.width * 0.08,
          shapeBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
            ),
          ),
        ),
      ],
    );
  }
}
