import 'package:dio/dio.dart';
import 'package:ernyka/features/domain/entities/myip.dart';

abstract class RemoteIpState {
  final MyIpEntity? myIp;
  final DioException? error;

  const RemoteIpState({this.myIp, this.error});
}

class RemoteIpLoading extends RemoteIpState {
  const RemoteIpLoading();
}

class RemoteIpDone extends RemoteIpState {
  const RemoteIpDone(MyIpEntity myip) : super(myIp: myip);
}

class RemoteIpError extends RemoteIpState {
  const RemoteIpError(DioException error) : super(error: error);
}
