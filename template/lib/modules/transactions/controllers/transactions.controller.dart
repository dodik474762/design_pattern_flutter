
class TransactionsController {
  static Future<List<String>> loadData({last_page}) async {
    // perform fetching data delay
    await new Future.delayed(new Duration(seconds: 2));
    List<String>  data = await getData();
    return data;
  }

  //request data to api
  static Future<List<String>> getData() async{
    List<String> data = ['oke', 'masuk'];
    return data;
  }

}