import 'package:dio/dio.dart';
import 'package:flutter_api/data/api/api_helper.dart';

class ApiHelperImpl implements ApiHelper{
  ApiHelperImpl._privateConstructor();

  static ApiHelperImpl INSTANCE = ApiHelperImpl._privateConstructor();

  final _dio = Dio(BaseOptions(baseUrl: 'http://192.168.100.7:8080'));

  Future<dynamic> postData(String path, Map<String, dynamic> data) async{
    try{
      Response response = await _dio.post(path, data: data);
      if(response.statusCode == 200 || response.statusCode == 201){
        return response.data;
      }else{
        throw Exception('Failed to post');
      }
    }catch (e){
      throw Exception('Connection failure');
    }
  }

  Future<dynamic> getData(String path, {Map<String, dynamic>? queryParameter})async{
    try{
      Response response = await _dio.get(path, queryParameters: queryParameter);
      if(response.statusCode == 200 || response.statusCode == 201){
        return response.data;
      }else{
        throw Exception('Failed get data');
      }
    }catch(e){
      print(e);
      throw Exception('Connection failure');
    }
  }

  Future<dynamic> deleteData(String path)async{
    try{
      Response response = await _dio.delete(path);
      if(response.statusCode == 200 || response.statusCode == 204){
        return response.data;
      }else{
        throw Exception('Failed delete data');
      }
    }catch(e){
      print(e);
      throw Exception('Connection failure');
    }
  }
}