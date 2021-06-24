import 'package:flutter/material.dart';
import 'package:rocky_morty_characters/models/result.dart';
import 'package:rocky_morty_characters/services/web_service.dart';
import 'package:rocky_morty_characters/viewmodels/result_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class ResultListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<ResultViewModle> resultviewmodel = <ResultViewModle>[];

  void getData() async {
    List<Results> resultdata = await WebService().fetchData();
    notifyListeners();

    this.resultviewmodel = resultdata
        .map((resultdata) => ResultViewModle(data: resultdata))
        .toList();

    if (this.resultviewmodel.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }

  void searchQuery(String query) async {
    List<Results> resultdata = await WebService().fetchData();
    notifyListeners();

    this.resultviewmodel = resultdata
        .map((resultdata) => ResultViewModle(data: resultdata))
        .where((elem) =>
            elem.name.toString().toLowerCase().contains(query.toLowerCase()) ||
            elem.gender.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (this.resultviewmodel.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
