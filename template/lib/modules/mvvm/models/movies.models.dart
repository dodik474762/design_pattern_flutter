
class Movies{
  int page;
  int totalResults;
  int totalPages;
  List<Results> results;

  static String modules = "movies";

  Movies({this.page, this.totalResults, this.totalPages, this.results});

  Movies.fromJson(Map<String, dynamic> json){
    this.page = json['page'];
    this.totalResults = json['total_results'];
    this.totalPages = json['total_pages'];

    if(json['result']!=null){
      this.results = new List<Results>();
      json['result'].forEach((item){
        this.results.add(new Results.fromJson(item));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    
    if(this.results != null){
      data['result'] = this.results.map((item) => item.toJson()).toList();
    }

    return data;
  }
}


class Results{
  String id;
  String judul;

  Results({this.id, this.judul});

  Results.fromJson(Map<String, dynamic> json){
    this.id = json['id'];
    this.judul = json['judul'];    
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;

    return data;
  }
}