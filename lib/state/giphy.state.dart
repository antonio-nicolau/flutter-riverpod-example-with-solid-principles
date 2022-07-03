import 'package:giphy_for_all/models/giphy.model.dart';
import 'package:giphy_for_all/services/giphy.service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getTrendingProvider = FutureProvider<Giphy?>((ref) async {
  return ref.read(giphyServiceProvider).getTrending();
});
