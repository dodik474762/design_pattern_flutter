class Pagination{
  int limit = 5;
  int total = 100;

  Pagination({this.limit, this.total});

  Future<List<Object>> create(List<Object> data) async{
//    print(data);
  }
}