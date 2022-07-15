import 'package:giphy_for_all/shared/models/giphy.model.dart';
import 'package:giphy_for_all/shared/services/giphy.service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isLoadingMoreProvider = StateProvider<bool>((ref) {
  return false;
});

final giphyNotifierProvider = StateNotifierProvider<GiphyNotifier, AsyncValue<Giphy?>>((ref) {
  return GiphyNotifier(ref.read);
});

class GiphyNotifier extends StateNotifier<AsyncValue<Giphy?>> {
  GiphyNotifier(this._read) : super(const AsyncValue.loading()) {
    getTrendingGiphys();
  }

  final Reader _read;

  Future<void> getTrendingGiphys() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return _read(giphyServiceProvider).getTrendingGiphys();
    });
  }

  Future<void> searchGiphy(String search) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      return _read(giphyServiceProvider).searchGiphys(search);
    });
  }

  Future<void> loadMore() async {
    final response = await _read(giphyServiceProvider).getTrendingGiphys();

    if (response != null && response.data?.isNotEmpty == true) {
      state.asData?.value?.data?.addAll(response.data!);
    }
  }
}
