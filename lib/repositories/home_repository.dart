import 'package:mvvm_r_a_p_i_p/model/movies_model.dart';

import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../res/app_url.dart';

class HomeRepository{
  BaseApiServices _baseApiServices = NetworkApiServices();
  Future<MoviesListModel> fetchMoviesList()async{
    try{
      var response = await _baseApiServices.getGetApiServices(AppUrl.moviesUrlEndPoint.toString());
      return response =MoviesListModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}