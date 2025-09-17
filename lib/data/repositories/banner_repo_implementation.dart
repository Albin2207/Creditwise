import '../../domain/entities/banner_entity.dart';
import '../../domain/repositories/banner_repo.dart';
import '../services/banner_services.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDataSource remoteDataSource;

  BannerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<BannerEntity>> getBanners() async {
    return await remoteDataSource.getBanners();
  }
}
