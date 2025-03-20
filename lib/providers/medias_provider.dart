import 'package:flutter/material.dart';
import 'package:mediasquest/models/media_model.dart';
import 'package:mediasquest/providers/creators_provider.dart';
import 'package:mediasquest/services/medias_service.dart';

class MediasProvider extends ChangeNotifier {
  final MediasService _mediasService;
  final CreatorsProvider _creatorsProvider;

  MediasProvider(this._mediasService, this._creatorsProvider);

  int? _creatorId;
  bool _isLoading = false;
  String? _error;
  List<MediaModel> _medias = [];

  int? get creatorId => _creatorId;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<MediaModel> get medias => _medias;

  void _sortMedias() {
    _medias.sort((a, b) {
      List<int> order = [2, 1, 3];
      return order.indexOf(a.status.id).compareTo(order.indexOf(b.status.id));
    });
  }

  Future<void> fetchMedias(int creatorId) async {
    _creatorId = creatorId;
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _medias = await _mediasService.getMedias(creatorId);
      _sortMedias();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateStatus(int mediaId, int statusId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      int newStatusId = statusId < 3 ? statusId + 1 : 1;
      MediaModel updatedMedia = await _mediasService.updateMedia(mediaId, {"status_id": newStatusId});
      int index = _medias.indexWhere((e) => e.id == mediaId);
      _medias[index] = _medias[index].copyWith(status: updatedMedia.status);
      _sortMedias();
      _creatorsProvider.updateCompletedMedia(creatorId!, _medias);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
