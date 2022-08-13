import 'package:flutter/material.dart';
import 'package:mvvm_r_a_p_i_p/utils/routes.dart';
import 'package:mvvm_r_a_p_i_p/utils/routes_name.dart';
import 'package:mvvm_r_a_p_i_p/view/home_screen.dart';
import 'package:mvvm_r_a_p_i_p/view_model/auth_view_model.dart';
import 'package:mvvm_r_a_p_i_p/view_model/user_view_viewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthViewModel()),
      ChangeNotifierProvider(create: (_)=>UserViewModel()),
    ],
    child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    ),
    );
  }
}


