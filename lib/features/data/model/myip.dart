import 'package:ernyka/features/domain/entities/myip.dart';

class MyIpModel extends MyIpEntity {
  const MyIpModel({String? ip}) : super(ip: ip);

  factory MyIpModel.fromJson(Map<String, dynamic> map) {
    return MyIpModel(ip: map['ip']);
  }
}
