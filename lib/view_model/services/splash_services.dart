import 'package:flutter/cupertino.dart';
import 'package:mvvm_r_a_p_i_p/model/user_model.dart';
import 'package:mvvm_r_a_p_i_p/utils/routes_name.dart';
import 'package:mvvm_r_a_p_i_p/view_model/user_view_viewModel.dart';

class SplashServices{
  Future<UserModel> getUserData()=> UserViewModel().getUser();
  void checkAuthentication(BuildContext context){
    getUserData().then((value) async{
      if(value.token=='null'||value.token==''){
       await Future.delayed(Duration(seconds: 3));
       Navigator.pushNamed(context, RoutesName.login);
      }
      else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    });
  }
}