import 'package:flutter/material.dart';
import 'package:giphy_for_all/features/home/state/giphy.state.dart';
import 'package:giphy_for_all/shared/models/giphy.model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);
  final searchEditingController = TextEditingController();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingMore = ref.watch(isLoadingMoreProvider.state);
    final trendingGiphys = ref.watch(giphyNotifierProvider);

    void _listener() async {
      if (!isLoadingMore.state && scrollController.offset >= scrollController.position.maxScrollExtent) {
        isLoadingMore.state = true;
        await ref.read(giphyNotifierProvider.notifier).loadMore();
        isLoadingMore.state = false;
      }
    }

    scrollController.addListener(_listener);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(giphyNotifierProvider.notifier).getTrendingGiphys();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Giphy for all'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              child: TextField(
                controller: searchEditingController,
                decoration: const InputDecoration(
                  label: Text('Search'),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onSubmitted: (search) {
                  if (searchEditingController.text.isNotEmpty) {
                    ref.read(giphyNotifierProvider.notifier).searchGiphy(search);
                  }
                },
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: trendingGiphys.when(
                data: (data) {
                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: scrollController,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: data?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final giphy = data?.data?[index];
                      return GestureDetector(
                        onTap: () => _previewGiphy(context, giphy),
                        child: Image.network(
                          giphy?.images?.original?.url ?? '',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                },
                error: (err, _) => const Text('Error getting trending'),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            if (isLoadingMore.state)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(child: CircularProgressIndicator()),
              )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (searchEditingController.text.isNotEmpty) {
              ref.read(giphyNotifierProvider.notifier).searchGiphy(searchEditingController.text.trim());
            }
          },
          tooltip: 'Search',
          child: const Icon(Icons.search),
        ),
      ),
    );
  }

  Future<void> _previewGiphy(BuildContext context, Data? giphy) async {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Image.network(
            giphy?.images?.original?.url ?? '',
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width,
          ),
        );
      },
    );
  }
}
