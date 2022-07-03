import 'dart:developer';
import 'package:giphy_for_all/models/giphy.model.dart';
import 'package:giphy_for_all/repositories/giphy.repository.dart';
import 'package:giphy_for_all/services/giphy.service.interface.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final giphyServiceProvider = Provider<IGiphyService>((ref) {
  return GiphyService(ref.read);
});

class GiphyService implements IGiphyService {
  final Reader _read;

  GiphyService(this._read);

  @override
  Future<Giphy?> getTrending() async {
    try {
      return _read(giphyRepositoryProvider).getTrending();
    } catch (e) {
      log('Could not load trending giphy:$e');
    }
    return null;
  }
}
