import 'dart:developer';

import 'package:untitled1/bloc_api/data/service.dart';
import 'package:http/http.dart';


class ServiceRepo{
  final _url="http://osamastartup.osamamy-class.com/api/services";
Future<List<Datum>> getServices()async{
  final response=await get(Uri.parse(_url));
  final services=serviceFromJson(response.body);
  return services.data;
}
}