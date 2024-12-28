import 'package:flutter/material.dart';
import 'package:prog_news/features/home/views/widgets/my_custom_icon.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: MyCustomIcon(
            onTap: () => Navigator.pop(context),
            icon: Icons.arrow_back_ios_new_outlined),
        // leadingWidth: 80,
      ),
    );
  }
}
