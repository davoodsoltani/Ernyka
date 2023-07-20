import 'package:ernyka/core/resources/data_state.dart';
import 'package:ernyka/core/usecases/usecase.dart';
import 'package:ernyka/features/domain/entities/myip.dart';
import 'package:ernyka/features/domain/repository/myip_repository.dart';

class GetMyIpUseCase implements UseCase<DataState<MyIpEntity>, void> {
  final MyIpRepository _myIpRepository;

  GetMyIpUseCase(this._myIpRepository);
  @override
  Future<DataState<MyIpEntity>> call({void params}) {
    return _myIpRepository.getMyIp();
  }
}
