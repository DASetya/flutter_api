abstract class ApiHelper{
  Future<dynamic> postData(String path, Map<String, dynamic> data);
  Future<dynamic> getData(String path, {Map<String, dynamic>? queryParameter});
  Future<dynamic> deleteData(String path);
}