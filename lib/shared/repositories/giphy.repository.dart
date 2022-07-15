import 'dart:convert';
import 'dart:io';
import 'package:giphy_for_all/shared/repositories/urls.dart';
import 'package:giphy_for_all/shared/models/giphy.model.dart';
import 'package:giphy_for_all/shared/repositories/giphy.repository.interface.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final giphyRepositoryProvider = Provider<IGiphyRepositoy>((ref) {
  return GiphyRepository();
});

class GiphyRepository implements IGiphyRepositoy {
  final apiKey = 'MY_API_KEY';

  @override
  Future<Giphy?> getTrendingGiphys() async {
    final response = await http.get(
      _buildUrl(trendingGiphysEndpoint),
    );

    if (response.statusCode == HttpStatus.ok) {
      return Giphy.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error getting giphys ${response.body}');
    }
  }

  @override
  Future<Giphy?> searchGiphys(String search) async {
    final response = await http.get(
      _buildUrl(
        searchGiphysEndpoint,
        queryParams: {'q': search},
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      return Giphy.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error getting giphys ${response.body}');
    }
  }

  Uri _buildUrl(String path, {Map<String, String>? queryParams}) {
    final query = {'api_key': apiKey, 'limit': '20', 'rating': 'g'};

    if (queryParams != null) {
      query.addAll(queryParams);
    }
    return Uri.https(giphyHost, path, query);
  }
}
