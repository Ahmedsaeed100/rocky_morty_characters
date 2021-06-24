import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocky_morty_characters/Screens/home.dart';
import 'package:rocky_morty_characters/Screens/pageView.dart';
import 'package:rocky_morty_characters/Screens/search.dart';
import 'package:rocky_morty_characters/viewmodels/List_result_view_model.dart';

class TopTapBar extends StatefulWidget {
  @override
  _TopTapBarState createState() => _TopTapBarState();
}

class _TopTapBarState extends State<TopTapBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Color(0xff2c609a),
              child: TabBar(
                  controller: _tabController,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 3.0, color: Colors.orange)),
                  indicatorColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 22),
                  unselectedLabelStyle: TextStyle(fontSize: 14),
                  indicatorWeight: 1.0,
                  tabs: <Widget>[
                    Tab(
                      text: 'Home',
                    ),
                    Tab(
                      text: 'Search',
                    ),
                    Tab(
                      text: 'Another View Way',
                    ),
                  ]),
            )),
        body: TabBarView(controller: _tabController, children: <Widget>[
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ResultListViewModel(),
              ),
            ],
            child: MyHomePage(),
          ), //Home
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ResultListViewModel(),
              ),
            ],
            child: Search(),
          ), //Search

          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ResultListViewModel(),
              ),
            ],
            child: MyPageView(),
          ), // Other
        ]),
      ),
    );
  }
}
