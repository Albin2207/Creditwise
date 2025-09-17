import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'data/repositories/banner_repo_implementation.dart';
import 'data/services/banner_services.dart';
import 'domain/repositories/banner_repo.dart';
import 'domain/usecases/get_banner_usecase.dart';
import 'presentation/providers/banner_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External dependencies
  sl.registerLazySingleton(() => http.Client());

  // Data sources
  sl.registerLazySingleton<BannerRemoteDataSource>(
    () => BannerRemoteDataSourceImpl(client: sl()),
  );

  // Repositories
  sl.registerLazySingleton<BannerRepository>(
    () => BannerRepositoryImpl(remoteDataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetBannersUseCase(sl()));

  // Providers - Use registerLazySingleton for ChangeNotifierProvider
  sl.registerLazySingleton(() => BannerProvider(getBannersUseCase: sl()));
}
