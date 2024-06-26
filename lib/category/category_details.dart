import 'package:flutter/material.dart';
import 'package:newsapp/category/tab_category.dart';

import '../Api/api_manager.dart';
import '../model/Category_model.dart';
import '../model/SourceResponse.dart';
import '../my_theme.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'CategoryDetails';
  final CategoryDM category;

  const CategoryDetails({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: MyTheme.greenColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text("Something went wrong: ${snapshot.error}"),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("Try Again"),
                ),
              ],
            ),
          );
        } else if (snapshot.data?.status != 'ok') {
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? "Unknown error occurred"),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(widget.category.id);
                    setState(() {});
                  },
                  child: const Text("Try Again"),
                ),
              ],
            ),
          );
        } else {
          var sourceList = snapshot.data?.sources ?? [];
          return TabWidget(sourceList: sourceList);
        }
      },
    );
  }
}