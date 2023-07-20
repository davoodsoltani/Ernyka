import 'package:dio/dio.dart';
import 'package:ernyka/features/data/data_sources/remote/ip_api_service.dart';
import 'package:ernyka/features/data/repository/myip_repository_impl.dart';
import 'package:ernyka/features/domain/repository/myip_repository.dart';
import 'package:ernyka/features/domain/usecases/get_myip.dart';
import 'package:ernyka/features/presentation/bloc/remote/remote_ip_bloc.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  s1.registerSingleton<Dio>(Dio());

  s1.registerSingleton(IpApiService(s1()));

  s1.registerSingleton<MyIpRepository>(MyIpRepositoryImpl(s1()));

  s1.registerSingleton<GetMyIpUseCase>(GetMyIpUseCase(s1()));

  s1.registerFactory<RemoteIpBloc>(() => RemoteIpBloc(s1()));
}
