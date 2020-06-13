
class User{
  String id;
  String username;
  String password;
  User({this.id, this.username, this.password});


  User.fromJson(Map<String, dynamic> json){
    this.id = json['id'];
    this.username = json['username'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;

    return data;
  }
}