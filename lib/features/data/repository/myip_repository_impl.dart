import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ernyka/core/resources/data_state.dart';
import 'package:ernyka/features/data/data_sources/remote/ip_api_service.dart';
import 'package:ernyka/features/data/model/myip.dart';
import 'package:ernyka/features/domain/repository/myip_repository.dart';

class MyIpRepositoryImpl extends MyIpRepository {
  final IpApiService _ipApiService;
  MyIpRepositoryImpl(this._ipApiService);

  @override
  Future<DataState<MyIpModel>> getMyIp() async {
    try {
      final httpResponse = await _ipApiService.getMyIp(format: "json");

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
