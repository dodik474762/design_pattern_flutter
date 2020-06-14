
class Movies{
  List<Results> results;

  static String modules = "movies";

  Movies({this.results});

  Movies.fromJson(Map<String, dynamic> json){
    if(json['data']!=null){
      this.results = new List<Results>();
      json['data'].forEach((item){
        this.results.add(new Results.fromJson(item));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();    
    if(this.results != null){
      data['data'] = this.results.map((item) => item.toJson()).toList();
    }

    return data;
  }
}


class Results{
  String id;
  String username;
  String password;

  Results({this.id, this.username, this.password});

  Results.fromJson(Map<String, dynamic> json){
    this.id = json['id'].toString();
    this.username = json['username'].toString();    
    this.password = json['password'].toString();    
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;

    return data;
  }
}