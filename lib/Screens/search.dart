import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocky_morty_characters/viewmodels/List_result_view_model.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() => new SearchState();
}

class SearchState extends State<Search> {
  List results = [];

  var rows = [];
  String query = '';
  TextEditingController tc;

  @override
  void initState() {
    super.initState();

    Provider.of<ResultListViewModel>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    var resultviewmodel =
        Provider.of<ResultListViewModel>(context, listen: false);
    Size mobSize = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Delivero Contacts",
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(mobSize.height * 0.010),
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobSize.height * 0.010),
                    child: TextField(
                      controller: tc,
                      decoration: InputDecoration(hintText: 'Search...'),
                      onChanged: (v) {
                        setState(() {
                          query = v;
                          setResults(query);
                        });
                      },
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: query.isEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: resultviewmodel.resultviewmodel.length,
                            itemBuilder: (con, index) {
                              var itemData =
                                  resultviewmodel.resultviewmodel[index];
                              return Column(children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage:
                                          NetworkImage(itemData.image),
                                    ),
                                  ],
                                ),
                                ListTile(
                                  title: Text(itemData.name),
                                  subtitle: Text(itemData.gender),
                                  onTap: () {
                                    setState(() {
                                      tc.text = itemData.name;
                                      query = itemData.gender;
                                      setResults(query);
                                    });
                                  },
                                ),
                              ]);
                            },
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: resultviewmodel.resultviewmodel.length,
                            itemBuilder: (con, index) {
                              var itemData =
                                  resultviewmodel.resultviewmodel[index];
                              return Column(children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage:
                                          NetworkImage(itemData.image),
                                    ),
                                  ],
                                ),
                                ListTile(
                                  title: Text(itemData.name),
                                  subtitle: Text(itemData.gender),
                                  onTap: () {
                                    setState(() {
                                      tc.text = itemData.name;
                                      query = itemData.gender;
                                      setResults(query);
                                    });
                                  },
                                ),
                              ]);
                            },
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setResults(String query) {
    print(query);

    Provider.of<ResultListViewModel>(context, listen: false).searchQuery(query);
  }
}
