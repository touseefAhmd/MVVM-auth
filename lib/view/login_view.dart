import 'package:flutter/material.dart';
import 'package:mvvm_r_a_p_i_p/res/components/round_button.dart';
import 'package:mvvm_r_a_p_i_p/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/routes_name.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginView> {
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
                loading:authViewModel.loading,
                callBack: (){
              Map data = {
                'email':emailcontroller.text.toString(),
                'password':passwordcontroller.text.toString(),
              };
             authViewModel.loginApi(data,context);
            }),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.signup);
                },
                child: Text('Don` have an acount? SignUp',style: TextStyle(color: Colors.black),)),
          )
        ],
      ))
    );
  }
}
