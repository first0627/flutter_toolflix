class WebtoonEpisodeModel {
  final String id, title, raitng, date;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        raitng = json["rating"],
        date = json["date"];
}
