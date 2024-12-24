import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_news/features/home/home_cubit/home_cubit.dart';
import 'package:prog_news/features/home/views/widgets/custom_carousel_slider.dart';
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
                const SizedBox(height: 10),
                TitleBarWidget(
                  titleName: 'Breaking News',
                  onPress: () {},
                ),
                const SizedBox(height: 4),
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is TopHeadlinesLoaded ||
                      current is TopHeadlinesError ||
                      current is TopHeadlinesLoading,
                  bloc: homeCubit,
                  builder: (context, state) {
                    if (state is TopHeadlinesLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is TopHeadlinesError) {
                      return Text(state.message);
                    } else if (state is TopHeadlinesLoaded) {
                      return SizedBox(
                        height: size.height * 0.33,
                        width: double.infinity,
                        child: CustomCarouselSlider(
                          articles: state.articles!,
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
              ],
            ),
          ),
        ));
  }
}
