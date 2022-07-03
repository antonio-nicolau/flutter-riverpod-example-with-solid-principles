import 'package:flutter/material.dart';
import 'package:giphy_for_all/models/giphy.model.dart';
import 'package:giphy_for_all/state/giphy.state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingGiphys = ref.watch(getTrendingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending giphys'),
      ),
      body: trendingGiphys.when(
        data: (data) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: data?.data?.length ?? 0,
            itemBuilder: (context, index) {
              final giphy = data?.data?[index];
              return GestureDetector(
                onTap: () => openModal(context, giphy),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Search',
        child: const Icon(Icons.search),
      ),
    );
  }

  Future<void> openModal(BuildContext context, Data? giphy) async {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Image.network(
                      giphy?.images?.original?.url ?? '',
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(giphy?.title ?? '', style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
          );
        });
  }
}
