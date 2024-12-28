import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prog_news/core/utils/widgets/my_text_form_field.dart';
import 'package:prog_news/features/search/search_cubit/cubit/search_cubit.dart';

class HeadOfSearchPageWidget extends StatelessWidget {
  final TextEditingController controller;
  const HeadOfSearchPageWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
        ),
        Text(
          'News around the world',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w500, color: Colors.black45),
        ),
        const SizedBox(height: 16),
        BlocBuilder<SearchCubit, SearchState>(
          bloc: BlocProvider.of<SearchCubit>(context),
          buildWhen: (previous, current) =>
              current is Searched || current is Searching,
          builder: (context, state) {
            if (state is Searching) {
              return MyTextFormField(
                controller: controller,
                hintText: 'search',
                suffixText: 'Search',
                icon: Iconsax.search_normal_14,
                suffixTextStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'HindMysuru',
                        color: Colors.black45),
              );
            }
            return MyTextFormField(
              controller: controller,
              hintText: 'search',
              suffixText: 'Search',
              icon: Iconsax.search_normal_14,
            );
          },
        ),
      ],
    );
  }
}
