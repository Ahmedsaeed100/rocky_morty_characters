import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocky_morty_characters/Screens/details_screens.dart';
import 'package:rocky_morty_characters/viewmodels/List_result_view_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ResultListViewModel>(context, listen: false).getData();
  }

  void _showDetails(context, data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return DetailsScreen(
            results: data,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var resultviewmodel = Provider.of<ResultListViewModel>(context);
    Size mobSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Text(
          "Rocky & Morty Characters",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        Divider(
          color: Colors.orange,
          height: mobSize.height * 0.030,
          thickness: 3,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (_, index) {
              var itemData = resultviewmodel.resultviewmodel[index];
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      _showDetails(context, itemData);
                    },
                    child: Card(
                      elevation: 10,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/loading.gif',
                              image: itemData.image,
                              fit: BoxFit.fill,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(mobSize.height * 0.030),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  color: Color(0xaa000003),
                                  padding: EdgeInsets.all(
                                    mobSize.width * 0.030,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          itemData.name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: resultviewmodel.resultviewmodel.length,
          ),
        ),
      ]),
    );
  }
}
