import 'package:resono/data/network/AuthApiService.dart';
import 'package:resono/services/api_service/api_service.dart';


class UserInformation extends AuthApiService{
  @override
  getUserInformation(String url)  async{
    dynamic response  = await ApiService().get(url);

    return  response;
  }

}