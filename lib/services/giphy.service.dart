import 'dart:developer';

import 'package:giphy_for_all/models/giphy.model.dart';
import 'package:giphy_for_all/repositories/giphy.repository.interface.dart';
import 'package:giphy_for_all/services/giphy.service.interface.dart';

class GiphyService implements IGiphyService {
  final IGiphyRepositoy _giphyRepositoy;

  GiphyService(this._giphyRepositoy);

  @override
  Future<Giphy?> getTrending() async {
    try {
      return _giphyRepositoy.getTrending();
    } catch (e) {
      log('Could not load trending giphy:$e');
    }
    return null;
  }
}
