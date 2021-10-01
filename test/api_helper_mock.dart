import 'package:flutter_api/data/api/api_helper.dart';
import 'package:mockito/mockito.dart';

class ApiHelperMock extends Mock implements ApiHelper{

  @override
  Future<dynamic> postData(String path, Map<String, dynamic> data)async{
    return super.noSuchMethod(Invocation.method(#getWorkers, null),
    returnValue: Future<dynamic>.value()
    );
  }

  @override
  Future<dynamic> getData(String path, {Map<String, dynamic>? queryParameter})async{
    return super.noSuchMethod(Invocation.method(#getWorkers, null),
    returnValue: Future<dynamic>.value()
    );
  }

  Future<dynamic> deleteData(String path);
}