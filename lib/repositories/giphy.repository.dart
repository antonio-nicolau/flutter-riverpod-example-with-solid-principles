import 'dart:convert';
import 'dart:io';
import 'package:giphy_for_all/models/giphy.model.dart';
import 'package:giphy_for_all/repositories/giphy.repository.interface.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final giphyRepositoryProvider = Provider<IGiphyRepositoy>((ref) {
  return GiphyRepository();
});

class GiphyRepository implements IGiphyRepositoy {
  final apiKey = '1udPRUZGDkBj1Akd38yr2Efd3WcpQX30';

  @override
  Future<Giphy?> getTrending() async {
    final response = await http.get(
      Uri.parse('https://api.giphy.com/v1/gifs/trending?api_key=$apiKey'),
    );

    if (response.statusCode == HttpStatus.ok) {
      return Giphy.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error getting giphys ${response.body}');
    }
  }
}
