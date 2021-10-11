part of social_utils;

GetIt locator = GetIt.instance;

void setUpServiceLocator() {
  // Services
  locator
    ..registerLazySingleton<HiveService>(
      () => HiveServiceImpl(),
    )
    ..registerLazySingleton<AuthService>(
      () => AuthServiceImpl(),
    )
    ..registerLazySingleton<SignInCubit>(
      () => SignInCubit(
        authService: locator(),
        hiveService: locator(),
      ),
    )
    ..registerLazySingleton<SignUpCubit>(
      () => SignUpCubit(
        authService: locator(),
        hiveService: locator(),
      ),
    )
    ..registerLazySingleton<LogOutCubit>(
      () => LogOutCubit(
        authService: locator(),
        hiveService: locator(),
      ),
    );
}
