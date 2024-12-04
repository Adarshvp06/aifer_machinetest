import 'dart:developer';

import 'package:aifer_machinetest/model/list_photos.dart';
import 'package:aifer_machinetest/service/list_photos_service.dart';
import 'package:flutter/material.dart';

class ListPhotoProvider with ChangeNotifier {
  final _service = ListPhotosService();
  List<ListPhotosModel> _listphotos = [];
  bool isLoading = false;

  List<ListPhotosModel> get listphotos => _listphotos;

  Future<void> fetchPhotos() async {
    isLoading = true;
    notifyListeners();

    try {
      _listphotos = await _service.fetchPhotos();
    } catch (e) {
      log('error : $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
