import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/character_model.dart';
import '../services/api_service.dart';

enum LoadingState { idle, loading, success, error }

class CharacterProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<CharacterModel> _items = [];
  String? _errorMessage;
  LoadingState _state = LoadingState.idle;

  List<CharacterModel> get items => _items;
  String? get errorMessage => _errorMessage;
  LoadingState get state => _state;

  Future<void> loadCharacters() async {
    _state = LoadingState.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.fetchCharactersRaw();
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        _items = jsonList.map((e) => CharacterModel.fromJson(e)).toList();
        _state = LoadingState.success;
      } else {
        _errorMessage = 'Error ${response.statusCode}';
        _state = LoadingState.error;
      }
    } catch (e) {
      _errorMessage = e.toString();
      _state = LoadingState.error;
    }
    notifyListeners();
  }
}
