class MovieImg{
  String title;
  String Photo;
MovieImg({
    required this.title,
    required this.Photo,
});
factory MovieImg.fromJson(Map<String,dynamic>json) => MovieImg(
    title: json["title"],
    Photo: json["Poster"]);


}
