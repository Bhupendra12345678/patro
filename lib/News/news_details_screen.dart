import 'package:shrayesh_patro/News/bookmark/bookmark_cubit.dart';
import 'package:shrayesh_patro/News/models_news/news_model.dart';
import 'package:shrayesh_patro/News/view/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                      ),

                    ),

                  ],
                ),
                const SizedBox(height: 10),
                DecoratedBox(
                  // height: 330,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            newsModel.media.toString(),
                            fit: BoxFit.contain,
                            frameBuilder: (BuildContext context, Widget child, int? frame,
                                bool wasSynchronouslyLoaded) {
                              if (wasSynchronouslyLoaded) return child;
                              if (frame == null) {
                                return const Center(

                                  child: Text(''),
                                );

                              }
                              return child;
                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  newsModel.title!,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '${newsModel.source} * ${newsModel.pubdate?.substring(0, 17)}',
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),

                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: ClipRRect(

                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                            newsModel.profile ??
                                'https://static.toiimg.com/thumb/msid-46918916,width=1200,height=900/46918916.jpg',
                            fit:BoxFit.fill

                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      newsModel.source!,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // height: 30,
                  child: Row(
                    children: [



                      TextButton(
                        onPressed: () => launchUrl(Uri.parse(newsModel.link!)),


                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'पुरा समचार ',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,

                              size: 18,
                            ),
                            BlocBuilder<BookmarkCubit, BookmarkState>(
                              builder: (context, state) {
                                return CustomIconButton(
                                  onTap: () {
                                    context.read<BookmarkCubit>().addToBookmarked(newsModel);
                                  },
                                  child: Icon(
                                    newsModel.isBookmarked ? Icons.bookmark : Icons.bookmark_border,


                                    size: 30,
                                  ),
                                );
                              },
                            ),
                          ],

                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        newsModel.description ?? 'कुनै विवरण छैन',
                        style: const TextStyle(
                          fontSize: 18,

                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
