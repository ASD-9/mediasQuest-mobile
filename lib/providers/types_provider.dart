import 'package:flutter/material.dart';
import 'package:mediasquest/models/type_model.dart';
import 'package:mediasquest/services/types_service.dart';

class TypesProvider extends ChangeNotifier {
  final TypesService _typesService;

  TypesProvider(this._typesService);

  bool _isLoading = false;
  String? _error;
  List<TypeModel> _types = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<TypeModel> get types => _types;

  Future<void> fetchTypes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _types = await _typesService.getTypes();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
