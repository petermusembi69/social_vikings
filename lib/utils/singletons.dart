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
      ),
    )
    ..registerLazySingleton<SignUpCubit>(
      () => SignUpCubit(
        authService: locator(),
      ),
    )
    ..registerLazySingleton<LogOutCubit>(
      () => LogOutCubit(
        authService: locator(),
      ),
    );
}
