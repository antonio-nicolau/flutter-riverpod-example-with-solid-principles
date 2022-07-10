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
  final apiKey = '1udPRUZGDkBj1Akd38yr2Efd3WcpQX30';

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
      _buildUrl(searchGiphysEndpoint, search: search),
    );

    if (response.statusCode == HttpStatus.ok) {
      return Giphy.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error getting giphys ${response.body}');
    }
  }

  Uri _buildUrl(String path, {String? search}) {
    return Uri(
      scheme: 'https',
      host: 'api.giphy.com',
      path: path,
      queryParameters: {
        'api_key': apiKey,
        'limit': '50',
        'rating': 'g',
        if (search != null) 'q': search,
      },
    );
  }
}
