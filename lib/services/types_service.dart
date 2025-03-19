import 'package:dio/dio.dart';
import 'package:mediasquest/models/type_model.dart';
import 'package:mediasquest/utils/error_handler.dart';

class TypesService {
  final Dio _dio;

  TypesService(this._dio);

  Future<List<TypeModel>> getTypes() async {
    try {
      final response = await _dio.get('/types');
      return (response.data["data"] as List).map((e) => TypeModel.fromJson(e)).toList();
    } catch (e) {
      throw ErrorHandler.getErrorMessage(e);
    }
  }
}
