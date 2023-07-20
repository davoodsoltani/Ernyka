import 'package:ernyka/core/resources/data_state.dart';
import 'package:ernyka/features/domain/entities/myip.dart';

abstract class MyIpRepository {
  Future<DataState<MyIpEntity>> getMyIp();
}
