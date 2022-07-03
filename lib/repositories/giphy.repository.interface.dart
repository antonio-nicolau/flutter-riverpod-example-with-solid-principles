import 'package:giphy_for_all/models/giphy.model.dart';

abstract class IGiphyRepositoy {
  Future<Giphy?> getTrending();
}
