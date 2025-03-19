import 'package:flutter/material.dart';
import 'package:mediasquest/models/creator_model.dart';
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

  Future<void> fetchCreators(int typeId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _creators = await _creatorsService.getCreators(typeId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
