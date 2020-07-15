import 'package:chopper/chopper.dart';
part 'ApiService.chopper.dart';
//flutter packages pub run build_runner build --delete-conflicting-outputs
final String apiUrl = 'http://192.168.101.8:3000';

@ChopperApi(baseUrl: '')
abstract class ApiService extends ChopperService {
  static ApiService create() {
    final client = ChopperClient(
      baseUrl: apiUrl,
      services: [
        _$ApiService(),
      ],
      converter: JsonConverter(),
    );
    return _$ApiService(client);
  }

  @Post(path:'/login')
  Future<Response> login(@Body() Map<String,dynamic> body);
}
