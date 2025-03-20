import 'package:flutter/material.dart';
import 'package:mediasquest/models/creator_model.dart';
import 'package:mediasquest/models/media_model.dart';
import 'package:mediasquest/services/creators_service.dart';

class CreatorsProvider extends ChangeNotifier {
  final CreatorsService _creatorsService;

  CreatorsProvider(this._creatorsService);

  bool _isLoading = false;
  String? _error;
  List<CreatorModel> _creators = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<CreatorModel> get creators => _creators;

  void _sortCreators() {
    _creators.sort((a, b) => (a.name).compareTo(b.name));
    _creators.sort((a, b) {
      if (a.mediasNotCompleted == 0 && b.mediasNotCompleted != 0) return 1;
      if (b.mediasNotCompleted == 0 && a.mediasNotCompleted != 0) return -1;
      return 0;
    });
  }

  Future<void> fetchCreators(int typeId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _creators = await _creatorsService.getCreators(typeId);
      _sortCreators();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateCompletedMedia(int creatorId, List<MediaModel> medias) {
    int index = _creators.indexWhere((e) => e.id == creatorId);
    int completedMedia = medias.where((e) => e.status.id == 3).length;
    int notCompletedMedia = medias.where((e) => e.status.id != 3).length;
    _creators[index] = _creators[index].copyWith(mediasCompleted: completedMedia, mediasNotCompleted: notCompletedMedia);
    _sortCreators();
    notifyListeners();
  }
}
