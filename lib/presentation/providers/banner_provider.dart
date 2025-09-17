import 'package:flutter/foundation.dart';

import '../../domain/entities/banner_entity.dart';
import '../../domain/usecases/get_banner_usecase.dart';


enum BannerState { initial, loading, loaded, error }

class BannerProvider extends ChangeNotifier {
  final GetBannersUseCase getBannersUseCase;

  BannerProvider({required this.getBannersUseCase});

  BannerState _state = BannerState.initial;
  List<BannerEntity> _banners = [];
  String _errorMessage = '';

  BannerState get state => _state;
  List<BannerEntity> get banners => _banners;
  String get errorMessage => _errorMessage;

  Future<void> loadBanners() async {
    _state = BannerState.loading;
    notifyListeners();

    try {
      _banners = await getBannersUseCase();
      _state = BannerState.loaded;
      _errorMessage = '';
    } catch (e) {
      _state = BannerState.error;
      _errorMessage = e.toString();
      _banners = [];
    }
    
    notifyListeners();
  }

  void retry() {
    loadBanners();
  }
}