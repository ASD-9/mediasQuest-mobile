import 'package:dio/dio.dart';
import 'package:mediasquest/models/creator_model.dart';
import 'package:mediasquest/utils/error_handler.dart';

class CreatorsService {
  final Dio _dio;

  CreatorsService(this._dio);

  Future<List<CreatorModel>> getCreators(int typeId) async {
    try {
      final response = await _dio.get('/creators/$typeId');
      return (response.data["data"] as List).map((e) => CreatorModel.fromJson(e)).toList();
    } catch (e) {
      throw ErrorHandler.getErrorMessage(e);
    }
  }
}
