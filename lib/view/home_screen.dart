import 'package:flutter/material.dart';
import 'package:mvvm_r_a_p_i_p/data/response/status.dart';
import 'package:mvvm_r_a_p_i_p/utils/routes_name.dart';
import 'package:mvvm_r_a_p_i_p/view_model/home_view_view_model.dart';
import 'package:mvvm_r_a_p_i_p/view_model/user_view_viewModel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewViewModel.fetchMoviesList();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(actions: [
        GestureDetector(
            onTap: () {
              userPreferences.remove();
              Navigator.pushNamed(context, RoutesName.login);
            },
            child: Center(child: Text('Logout')))
      ], automaticallyImplyLeading: false),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
          switch(value.moviesList.status){
            case Status.LOADING:
            return  CircularProgressIndicator();
            case Status.ERROR:
            return  Text(value.moviesList.message.toString());
            case Status.COMPLETED:
             return ListView.builder(
               itemCount: value.moviesList.data!.movies!.length,
                 itemBuilder: (BuildContext context,int index){
                 return Card(child: ListTile(
                   leading: Image.network(value.moviesList.data!.movies![index].posterurl.toString(),
                   errorBuilder: (context,error,stack){
                     return Icon((Icons.error_outline),color: Colors.red,);
                   }),
                 ),);
                 });

          }
          return Container(
            child: Text(''),
          );
        }),
      ),
    );
  }
}
