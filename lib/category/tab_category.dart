import 'package:flutter/material.dart';
import 'package:newsapp/category/tab_item.dart';
import '../model/SourceResponse.dart';
import '../my_theme.dart';
import '../news/news_widget.dart';
import '../provider/app_confing_provider.dart';
import 'package:provider/provider.dart';

class TabWidget extends StatefulWidget {
  List <Source> sourceList;

  TabWidget({super.key, required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
   int  selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);

    return DefaultTabController(
        length: widget.sourceList.length,
        child:
        Column(children: [
          TabBar(
            onTap: (index){
              selectedIndex =index;
              setState(() {

              });
            },
              isScrollable: true,
              indicatorColor:  provider.isDarkMode()
                  ? MyTheme.blackDark
                  :  Colors.transparent,
              dividerColor: Colors.transparent,

              tabAlignment: TabAlignment.start,
              tabs:widget.sourceList.map((Source) =>TabItem(
                  isSelected: selectedIndex==widget.sourceList.indexOf(Source),
                  source: Source)
              ).toList()

          ),
          Expanded(child:

          NewsWidget(source: widget.sourceList[selectedIndex],
          ))
        ],)


    );
  }
}
