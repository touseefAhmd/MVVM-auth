import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_r_a_p_i_p/utils/routes_name.dart';

import '../repositories/auth_repository.dart';

class AuthViewModel with ChangeNotifier{
  final myRepository= AuthRepository();
   bool loading = false;
   bool signUploading = false;
   bool get loadingM =>loading;
  bool get signUploadingM =>loading;
   setLoading(bool val){
     loading=val;
     notifyListeners();
   }
  setSignUpLoading(bool val){
    loading=val;
    notifyListeners();
  }
  Future<void> loginApi(dynamic data,BuildContext context) async{
     setLoading(true);
    myRepository.logInApi(data).then((value){
      setLoading(false);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }
      
    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode){
        print('failed');
      }

    });

  }

  Future<void> signUpApi(dynamic data,BuildContext context) async{
    setSignUpLoading(true);
    myRepository.signUpApi(data).then((value){
      setSignUpLoading(false);
      Navigator.pushNamed(context, RoutesName.login);
      if(kDebugMode){
        print(value.toString());
      }

    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if(kDebugMode){
        print('failed');
      }

    });

  }
}