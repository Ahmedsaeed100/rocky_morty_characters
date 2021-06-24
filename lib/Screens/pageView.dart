import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocky_morty_characters/viewmodels/List_result_view_model.dart';

class MyPageView extends StatefulWidget {
  MyPageView({Key key}) : super(key: key);

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    Provider.of<ResultListViewModel>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    var resultviewmodel = Provider.of<ResultListViewModel>(context);
    Size mobSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: mobSize.height * 1.010,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, mobSize.height * 0.00),
                child: PageView.builder(
                  controller: pageViewController,
                  scrollDirection: Axis.horizontal,
                  itemCount: resultviewmodel.resultviewmodel.length,
                  itemBuilder: (context, index) {
                    var itemData = resultviewmodel.resultviewmodel[index];

                    return ListView(
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: mobSize.width * 0.010,
                                vertical: mobSize.height * 0.015,
                              ),
                              child: Image.network(
                                itemData.image,
                                width: mobSize.width * 1.590,
                                height: mobSize.height * 0.730,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              bottom: mobSize.width * 0.050,
                              right: mobSize.width * 0.090,
                              left: mobSize.width * 0.090,
                              height: mobSize.height * 0.045,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      mobSize.height * 0.030),
                                  color: Colors.blueAccent,
                                ),
                                child: Text(
                                  itemData.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: mobSize.height * 0.033,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
