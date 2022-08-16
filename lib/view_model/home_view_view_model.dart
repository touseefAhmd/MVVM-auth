import 'package:flutter/cupertino.dart';
import 'package:mvvm_r_a_p_i_p/data/response/api_response.dart';
import 'package:mvvm_r_a_p_i_p/model/movies_model.dart';
import 'package:mvvm_r_a_p_i_p/repositories/home_repository.dart';

class HomeViewViewModel extends ChangeNotifier{
final myrepo = HomeRepository();
ApiResponse<MoviesListModel> moviesList = ApiResponse.loading();
Future <void> fetchMoviesList()async{
  myrepo.fetchMoviesList().then((value){

  }).onError((error, stackTrace) => null);

}

}