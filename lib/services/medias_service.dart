import 'package:dio/dio.dart';
import 'package:mediasquest/models/media_model.dart';
import 'package:mediasquest/utils/error_handler.dart';

class MediasService {
  final Dio _dio;

  MediasService(this._dio);

  Future<List<MediaModel>> getMedias(int creatorId, int typeId) async {
    try {
      final response = await _dio.get('/medias/creator/$creatorId/type/$typeId');
      return (response.data["data"] as List).map((e) => MediaModel.fromJson(e)).toList();
    } catch (e) {
      throw ErrorHandler.getErrorMessage(e);
    }
  }

  Future<MediaModel> updateMedia(int mediaId, Map updateData) async {
    try {
      final response = await _dio.put('/medias/$mediaId', data: updateData);
      return MediaModel.fromJson(response.data["data"]);
    } catch (e) {
      throw ErrorHandler.getErrorMessage(e);
    }
  }
}
