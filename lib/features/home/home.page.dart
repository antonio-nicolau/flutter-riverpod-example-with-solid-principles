import 'package:flutter/material.dart';
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
          return Text(data?.data?.length.toString() ?? '');
        },
        error: (err, _) => const Text('Error getting trending'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
