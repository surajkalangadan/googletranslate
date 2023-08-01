import 'dart:convert';
import 'package:http/http.dart';

import '../modelclass/Googlemodel.dart';
import 'api_client.dart';





class Googleapi {
  ApiClient apiClient = ApiClient();


  Future<Googlemodel> postGooglemodel() async {
    String trendingpath = 'https://google-translate105.p.rapidapi.com/v1/rapid/translate';
    var body = {
"text":"hello","from_lang":"en","to_lang":"ml"
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST_', body);

    return Googlemodel.fromJson(jsonDecode(response.body));
  }
}