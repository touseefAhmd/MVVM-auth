import 'package:flutter/material.dart';
import 'package:mvvm_r_a_p_i_p/utils/routes_name.dart';
import 'package:mvvm_r_a_p_i_p/view_model/user_view_viewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        GestureDetector(
            onTap: (){
              UserViewModel().remove();
              Navigator.pushNamed(context, RoutesName.login);
            },
            child: Center(child: Text('Logout')))
      ],
      automaticallyImplyLeading: false),
      body: Center(child: Column(
        children: [

        ],
      )),
    );
  }
}
