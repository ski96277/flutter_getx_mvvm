import 'package:resono/data/network/AuthApiService.dart';

import '../../core/domain/api_service/api_service.dart';

class UserInformation extends AuthApiService{
  @override
  getUserInformation(String url)  async{
    dynamic response  = await ApiService().get(url);

    return  response;
  }

}