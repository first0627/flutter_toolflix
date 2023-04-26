import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  //여기서  await한 다음에 응답이 와야지 다음 코드가 실행된다.
  //await은 비동기함수이고 이 비동기함수내에서는 코드가 동기처럼 await이 끝나야 다음코드가 실행되지만
  //이 함수 뿐 아니라 프로그램 전체적인 실행의 방면에서는 비동기다. 즉 해당함수 말고 다른 코드의 흐름은 먼저 작동한다는 뜻
  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final reponse =
        await http.get(url); //return 타입은 Future이다. 미래에 받을 값의 타입을 알려준다.
    if (reponse.statusCode == 200) {
      final List<dynamic> webtoons =
          jsonDecode(reponse.body); //여기에 서버에서 보낸 데이터가 들어있어.
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
