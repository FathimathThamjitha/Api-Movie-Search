import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

import '../MovieModel.dart';

class MainProvider extends ChangeNotifier{
  List<MovieImg>Movielist = [];
TextEditingController MovienameController = TextEditingController();
  String url="https://api.themoviedb.org/3/search/movie";
  String key="b944d6eba2d3f434fdb9d98457345ae8";
  int page=1;
  Future getApi(String name,int pagecount)async{
    http.Response response;
    response= await
    http.get(Uri.parse("$url?api_key=$key&query=$name&page=$pagecount"));
    print(MovieImg);
    if (response.statusCode ==200){
    final Map<String,dynamic> data=jsonDecode(response.body);
    final List<dynamic> results = data["results"];
    Movielist = results.map((e) => MovieImg(
        title: e['title'], Photo: e['poster_path'].toString())).toList();
    notifyListeners();
    }
    else
    {
      // throw Exception('Failed to load album');
    }
  }
}