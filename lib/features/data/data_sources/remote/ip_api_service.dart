import 'package:dio/dio.dart';
import 'package:ernyka/core/constants/constants.dart';
import 'package:ernyka/features/data/model/myip.dart';
import 'package:retrofit/retrofit.dart';

part 'ip_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class IpApiService {
  factory IpApiService(Dio dio) = _IpApiService;

  @GET('')
  Future<HttpResponse<MyIpModel>> getMyIp({@Query("format") String? format});
}
