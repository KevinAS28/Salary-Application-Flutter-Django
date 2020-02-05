import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import './Configuration.dart' show Configuration ;


Future<Response> hitApi(Map<String, String> dataMap, String apiname) async{
      Map<String, String> data = {"username": Configuration.username, "password": Configuration.password};
      var url = Configuration.fullHost+"/api/$apiname/";
      return await http.post(url, body:data);
}



