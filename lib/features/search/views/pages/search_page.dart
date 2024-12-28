import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_news/core/utils/route/app_routes.dart';
import 'package:prog_news/features/home/views/widgets/my_custom_icon.dart';
import 'package:prog_news/features/home/views/widgets/recommendation_section_widget.dart';
import 'package:prog_news/features/search/search_cubit/cubit/search_cubit.dart';
import 'package:prog_news/features/search/views/widgets/head_of_search_page_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: size.height * 0.1,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: MyCustomIcon(
                  onTap: () => Navigator.pop(context),
                  icon: CupertinoIcons.chevron_left),
            ),
            leadingWidth: 65,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Head Of the Search Page
                      HeadOfSearchPageWidget(controller: _controller),
                      // List of Articles
                      BlocBuilder<SearchCubit, SearchState>(
                        bloc: BlocProvider.of<SearchCubit>(context),
                        buildWhen: (previous, current) =>
                            current is Searched ||
                            current is SearchError ||
                            current is Searching,
                        builder: (context, state) {
                          if (state is SearchError) {
                            return Center(child: Text(state.message));
                          } else if (state is Searching) {
                            return Padding(
                              padding: EdgeInsets.only(top: size.height * 0.25),
                              child: const Center(
                                  child: CircularProgressIndicator()),
                            );
                          } else if (state is Searched) {
                            if (state.articles.isEmpty) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.25),
                                child: Center(
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.search_off,
                                        size: 36,
                                        color: Colors.black54,
                                      ),
                                      Text(
                                        'No articles found',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 16),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.articles.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, AppRoutes.productDetail,
                                          arguments: state.articles[index]);
                                    },
                                    child: RecommendationSectionWidget(
                                        articles: state.articles[index]),
                                  );
                                },
                              );
                            }
                          } else {
                            return Padding(
                              padding: EdgeInsets.only(top: size.height * 0.25),
                              child: const Center(
                                  child: Text(
                                      'Search here for any news articles')),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
