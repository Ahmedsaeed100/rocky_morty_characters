import 'package:flutter/material.dart';
import 'package:rocky_morty_characters/viewmodels/result_view_model.dart';

class DetailsScreen extends StatelessWidget {
  final ResultViewModle results;
  const DetailsScreen({this.results});

  @override
  Widget build(BuildContext context) {
    Size mobSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          this.results.name,
          style: TextStyle(
              fontSize: mobSize.width * 0.05, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Divider(
            color: Colors.blueAccent,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Image.network(
                  this.results.image,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.blueAccent,
            thickness: 2,
          ),
          Container(
            margin: EdgeInsets.all(mobSize.height * 0.020),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Gender : ${this.results.gender}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: mobSize.height * 0.020),
                    Text(
                      "Created : ${this.results.created}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: mobSize.height * 0.020),
                    Text(
                      "Location : ${this.results.location}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: mobSize.height * 0.020),
                    Text(
                      "Origin : ${this.results.origin}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: mobSize.height * 0.020),
                    Text(
                      "Species : ${this.results.species}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: mobSize.height * 0.020),
                    Text(
                      "Status : ${this.results.status}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: mobSize.height * 0.020),
                    Text(
                      "Url : ${this.results.url}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: mobSize.height * 0.020),
                    this.results.type == ' '
                        ? Text(
                            "Type : ${this.results.type}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          )
                        : Text(
                            'Type : nothing to show',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                    RaisedButton.icon(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Episode Show'),
                                content:
                                    setupAlertDialoadContainer(this.results),
                              );
                            });
                      },
                      icon: Icon(Icons.list),
                      label: Text('Episode Show'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget setupAlertDialoadContainer(ResultViewModle data) {
  return Column(
    children: [
      Container(
        height: 500, // Change as per your requirement
        width: 800, // Change as per your requirement
        child: Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.episode.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Text(data.episode[index]),
                  SizedBox(height: 8.0),
                ],
              );
            },
          ),
        ),
      ),
    ],
  );
}
