class Origin {
  String _name;
  String _url;

  Origin({String name, String url}) {
    this._name = name;
    this._url = url;
  }

  Origin.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['url'] = this._url;
    return data;
  }
}
