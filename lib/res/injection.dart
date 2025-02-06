//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/features/chat/domain/cases/chat_cases.dart';
import 'package:abg/features/group/domain/cases/group_case.dart';
import 'package:abg/features/home/domain/cases/home_cases.dart';
import 'package:abg/features/notification/domain/cases/notification_cases.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../data/data_sources/get_storage.dart';
import '../data/remote_data/dio_helper.dart';
import '../data/remote_data/remote.dart';
import '../data/repositories/data_repositry.dart';
import '../domain_data/repositories/domain_repositry.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // * cases
  sl.registerLazySingleton(() => AuthCases(sl()));
  sl.registerLazySingleton(() => NotificationCases(sl()));
  sl.registerLazySingleton(() => HomeCases(sl()));
  sl.registerLazySingleton(() => GroupCase(sl()));
  sl.registerLazySingleton(() => ChatCases(sl()));
  // * repository
  sl.registerLazySingleton<DomainData>(
      () => DataRepository(storage: sl(), remote: sl() /*, remoteFire: sl()*/));

  //! external
//  sl.registerLazySingleton(() => RemoteFire(FirebaseFirestore.instance));
  sl.registerLazySingleton(() => Remote(DioHelper.init()));
  sl.registerLazySingleton(() => GetStorageData(sl()));
  // * database from local data source
  //sl.registerLazySingleton(() => DBHelper());
  // sl.registerLazySingleton(() => FirebaseFirestore.instance);
  await GetStorage.init();
  final getStorage = GetStorage();
  sl.registerLazySingleton<GetStorage>(() => getStorage);
}
