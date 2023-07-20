import 'package:ernyka/core/resources/data_state.dart';
import 'package:ernyka/features/domain/usecases/get_myip.dart';
import 'package:ernyka/features/presentation/bloc/remote/remote_ip_event.dart';
import 'package:ernyka/features/presentation/bloc/remote/remote_ip_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteIpBloc extends Bloc<RemoteIpEvent, RemoteIpState> {
  final GetMyIpUseCase _getMyIpUseCase;

  RemoteIpBloc(this._getMyIpUseCase) : super(const RemoteIpLoading()) {
    on<GetIp>(onGetIp);
  }

  Future<void> onGetIp(GetIp event, Emitter<RemoteIpState> emit) async {
    final dataState = await _getMyIpUseCase();

    if (dataState is DataSuccess) {
      emit(RemoteIpDone(dataState.data!));
    } else if (dataState is DataFailed) {
      print(dataState.error!);
      emit(RemoteIpError(dataState.error!));
    }
  }
}
