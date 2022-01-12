import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task1/models/match_data.dart';

class DataApi {
  final String url = 'https://gorest.co.in/public/v1/users?page=1';

  Future<List<MatchData>> getData() async {
    List _temp = [];
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      Map decodedData = jsonDecode(data);
      for (var i in decodedData['data']) {
        _temp.add(i);
      }

      return MatchData.dataFromSnapshot(_temp);
    } else {
      print(response.statusCode);
    }
    return MatchData.dataFromSnapshot(_temp);
    
  }
}
