import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocky_morty_characters/Screens/home.dart';
import 'package:rocky_morty_characters/Screens/pageView.dart';
import 'package:rocky_morty_characters/viewmodels/List_result_view_model.dart';
import 'package:rocky_morty_characters/widgets/tap_bar.dart';

import 'Screens/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfffefdfd),
        appBarTheme: AppBarTheme(
            color: Color(0xfffefdfd),
            elevation: 0,
            textTheme: TextTheme(
                title: TextStyle(
              color: Colors.black,
            ))),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ResultListViewModel(),
          ),
        ],
        child: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            TopTapBar(),
            Search(),
            MyPageView(),
          ],
        ),
      ),
    );
  }
}
