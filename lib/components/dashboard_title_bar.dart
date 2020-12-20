import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';

class DashboardTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List list = [
      "A",
      "BC",
      "DEF",
      "GHIJ",
    ];

    TextEditingController textEditingController = new TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "Dash",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  ".",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            Expanded(
              flex: 2,
              // width: MediaQuery.of(context).size.width / 3,
              child: GFSearchBar(
                searchBoxInputDecoration: new InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                ),
                searchList: list,
                searchQueryBuilder: (query, list) {
                  return list.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
                },
                overlaySearchListItemBuilder: (item) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  );
                },
                onItemSelected: (item) {
                  // setState(() {
                  //   print('$item');
                  // });
                },
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
