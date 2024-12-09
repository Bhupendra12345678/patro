
import 'package:shrayesh_patro/News/breaking_news_cubit.dart';
import 'package:shrayesh_patro/News/home_repo_impl.dart';
import 'package:shrayesh_patro/News/recommended_news_cubit.dart';
import 'package:shrayesh_patro/News/utils_news/service_locator.dart';
import 'package:shrayesh_patro/News/view/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
          BreakingNewsCubit(getIt.get<HomeRepoImpl>())..fetchBreakingNews(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
          RecommendedNewsCubit(getIt.get<HomeRepoImpl>())
            ..fetchRecommendedNews(),
        ),
      ],
      child: SafeArea(
        child: BlocBuilder<BreakingNewsCubit, BreakingNewsState>(
            builder: (context, state) {
              return BlocBuilder<RecommendedNewsCubit, RecommendedNewsState>(
                  builder: (context, state) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        await context.read<BreakingNewsCubit>().fetchBreakingNews();
                        await context.read<RecommendedNewsCubit>().fetchRecommendedNews();
                      },
                      child: CustomScrollView(
                        physics: const BouncingScrollPhysics(),
                        slivers: [
                          SliverPersistentHeader(
                            pinned: false,
                            floating: true,
                            delegate: PersistentHeader(),
                          ),

                          const SliverFillRemaining(
                            child: RecNewsListView(),
                          ),
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  PersistentHeader();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const Music();
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
