import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_news/core/utils/theme/app_colors.dart';
import 'package:prog_news/features/search/search_cubit/cubit/search_cubit.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icon;
  final String hintText;
  final String suffixText;
  final TextStyle? suffixTextStyle;
  const MyTextFormField(
      {super.key,
      required this.controller,
      this.icon,
      required this.hintText,
      required this.suffixText,
      this.suffixTextStyle});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: AppColors.grey2,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          icon,
          // Iconsax.search_normal_14,
          color: Colors.black38,
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.black38,
              fontFamily: 'HindMysuru',
              fontWeight: FontWeight.w500,
            ),
        suffixIcon: TextButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              BlocProvider.of<SearchCubit>(context).search(controller.text);
              FocusScope.of(context).unfocus();
            }
          },
          child: Text(suffixText,
              style: suffixTextStyle ??
                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'HindMysuru',
                      color: AppColors.primary.withOpacity(.8))),
        ),
      ),
    );
  }
}
