import 'package:flutter/material.dart';
import 'package:mvvm_r_a_p_i_p/utils/routes_name.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../view_model/auth_view_model.dart';
class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.alternate_email),

                  ),
                ),
                TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      hintText: 'Password',
                      label: Text('Password'),
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      suffixIcon: Icon(Icons.visibility_off)
                  ),
                ),
                SizedBox(height: 30,),
                Center(
                  child: RoundButton(title: 'Press',
                      loading:authViewModel.signUploading,
                      callBack: (){
                        Map data = {
                          'email':emailcontroller.text.toString(),
                          'password':passwordcontroller.text.toString(),
                        };
                        authViewModel.signUpApi(data,context);
                      }),
                ),
                SizedBox(height: 30,),
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RoutesName.login);
                    },
                    child: Text('Already have an acount? SignIn'))
              ],
            ))
    );
  }
}
