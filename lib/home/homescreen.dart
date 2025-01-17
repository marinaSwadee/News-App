import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../category/category_details.dart';
import '../category/category_frogment.dart';
import '../category/new_search.dart';
import '../model/Category_model.dart';
import '../my_theme.dart';
import '../provider/app_confing_provider.dart';
import '../settings/settings_screen.dart';
import 'home_drawer.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home_Screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: provider.isDarkMode()
              ? Image.asset(
            "assets/dark.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          )
              : Image.asset(
            "assets/splash.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    showSearch(context: context, delegate: NewsSearch(),);
                  });
                },
                icon: const Icon(Icons.search),
              ),
            ],
            toolbarHeight: MediaQuery.of(context).size.height / 9,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        selectedMenuItem == HomeDrawer.settings
                            ? 'Setting'
                            : selectedCategory == null
                            ? 'News App'
                            : selectedCategory!.id,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          drawer: Drawer(
            child: HomeDrawer(
              onsideMenuItem: onSideMenuClick,
            ),
          ),
          body: selectedMenuItem == HomeDrawer.settings
              ? const SettingScreen()
              : selectedCategory == null
              ? CategoryFragment(
            onCategoryClick: onCategoryClick,
          )
              : CategoryDetails(category: selectedCategory!),
        ),
      ],
    );
  }

  CategoryDM? selectedCategory;

  void onCategoryClick(CategoryDM newSelectedCategory) {
    setState(() {
      selectedCategory = newSelectedCategory;
    });
  }

  int selectedMenuItem = HomeDrawer.categories;

  void onSideMenuClick(int newSelectedMenuItem) {
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}