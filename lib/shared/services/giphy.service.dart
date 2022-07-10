import 'dart:developer';
import 'package:giphy_for_all/shared/models/giphy.model.dart';
import 'package:giphy_for_all/shared/repositories/giphy.repository.dart';
import 'package:giphy_for_all/shared/services/giphy.service.interface.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final giphyServiceProvider = Provider<IGiphyService>((ref) {
  return GiphyService(ref.read);
});

class GiphyService implements IGiphyService {
  final Reader _read;

  GiphyService(this._read);

  @override
  Future<Giphy?> getTrendingGiphys() async {
    try {
      return _read(giphyRepositoryProvider).getTrendingGiphys();
    } catch (e) {
      log('Could not load trending giphy:$e');
    }
    return null;
  }

  @override
  Future<Giphy?> searchGiphys(String search) async {
    try {
      return _read(giphyRepositoryProvider).searchGiphys(search);
    } catch (e) {
      log('Could not load trending giphy:$e');
    }
    return null;
  }
}
