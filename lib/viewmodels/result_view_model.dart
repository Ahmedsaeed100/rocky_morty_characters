import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';
import 'package:rocky_morty_characters/models/origin.dart';
import 'package:rocky_morty_characters/models/result.dart';

class ResultViewModle {
  Results _results;

  ResultViewModle({Results data}) : _results = data;

  int get id => _results.id;
  String get name => _results.name;
  String get status => _results.status;
  String get species => _results.species;
  String get type => _results.type;
  String get gender => _results.gender;
  Origin get origin => _results.origin;
  Origin get location => _results.location;
  String get image => _results.image;
  List<String> get episode => _results.episode;
  String get url => _results.url;
  String get created {
    final datetime =
        DateFormat('yyyy-mm-ddTHH:mm:ssZ').parse(_results.created, true);
    return DateFormat.yMMMMEEEEd('en_US').format(datetime).toString();
  }
}
