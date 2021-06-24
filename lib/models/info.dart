class Info {
  int _count;
  int _pages;
  String _next;
  Null _prev;

  Info({int count, int pages, String next, Null prev}) {
    this._count = count;
    this._pages = pages;
    this._next = next;
    this._prev = prev;
  }

  Info.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    _pages = json['pages'];
    _next = json['next'];
    _prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    data['pages'] = this._pages;
    data['next'] = this._next;
    data['prev'] = this._prev;
    return data;
  }
}
