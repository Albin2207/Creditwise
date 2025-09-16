import '../entities/banner_entity.dart';
import '../repositories/banner_repo.dart';

class GetBannersUseCase {
  final BannerRepository repository;

  GetBannersUseCase(this.repository);

  Future<List<BannerEntity>> call() async {
    return await repository.getBanners();
  }
}