import 'package:giphy_for_all/models/giphy.model.dart';

abstract class IGiphyService {
  Future<Giphy?> getTrending();
}
