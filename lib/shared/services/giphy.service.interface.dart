import 'package:giphy_for_all/shared/models/giphy.model.dart';

abstract class IGiphyService {
  Future<Giphy?> getTrendingGiphys();
  Future<Giphy?> searchGiphys(String search);
}
