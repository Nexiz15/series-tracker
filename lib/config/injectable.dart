import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'database.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() {
  getIt.init();
  getIt.registerSingletonAsync(() async => $FloorAppDatabase.databaseBuilder(AppDatabase.APP_DATABASE_NAME).build());
  getIt.registerSingletonWithDependencies(() => GetIt.instance.get<AppDatabase>().seriesDao, dependsOn: [AppDatabase]);
  getIt.registerSingletonWithDependencies(() => GetIt.instance.get<AppDatabase>().seasonDao, dependsOn: [AppDatabase]);
  getIt.registerSingletonWithDependencies(() => GetIt.instance.get<AppDatabase>().episodeDao, dependsOn: [AppDatabase]);
}