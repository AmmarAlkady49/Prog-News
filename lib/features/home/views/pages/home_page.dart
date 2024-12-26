import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_news/features/home/home_cubit/home_cubit.dart';
import 'package:prog_news/features/home/views/widgets/custom_carousel_slider.dart';
import 'package:prog_news/features/home/views/widgets/home_app_bar_widget.dart';
import 'package:prog_news/features/home/views/widgets/recommendation_section_widget.dart';
import 'package:prog_news/features/home/views/widgets/title_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBarWidget(),
                TitleBarWidget(
                  titleName: 'Breaking News',
                  onPress: () {},
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is TopHeadlinesLoaded ||
                      current is TopHeadlinesError ||
                      current is TopHeadlinesLoading,
                  bloc: homeCubit,
                  builder: (context, state) {
                    if (state is TopHeadlinesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is TopHeadlinesError) {
                      return Text(state.message);
                    } else if (state is TopHeadlinesLoaded) {
                      return SizedBox(
                        height: size.height * 0.33,
                        width: double.infinity,
                        child: CustomCarouselSlider(
                          articles: state.articles ?? [],
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                const SizedBox(height: 15),
                TitleBarWidget(
                  titleName: 'Recommendation',
                  onPress: () {},
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  bloc: homeCubit,
                  buildWhen: (previous, current) =>
                      current is RecommendationLoading ||
                      current is RecommendationError ||
                      current is RecommendationLoaded,
                  builder: (context, recommendationState) {
                    if (recommendationState is RecommendationLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (recommendationState is RecommendationError) {
                      return Text(recommendationState.message);
                    } else if (recommendationState is RecommendationLoaded) {
                      return ListView.separated(
                        itemCount: recommendationState.articles!.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: RecommendationSectionWidget(
                              articles: recommendationState.articles![index]),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ));
  }
}
