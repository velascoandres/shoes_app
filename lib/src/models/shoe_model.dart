import 'package:flutter/foundation.dart';

class ShoeModel with ChangeNotifier {
  String _assetImage = 'asset/image/azul.png';
  double _size = 9.0;

  String get assetImage => this._assetImage;

  set assetImage(String newAsset) {
    this._assetImage = newAsset;
    notifyListeners();
  }

  double get size => this._size;

  set size(double newSize) {
    this._size = newSize;
    notifyListeners();
  }

}
