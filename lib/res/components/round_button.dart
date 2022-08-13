import 'package:flutter/material.dart';
import 'package:mvvm_r_a_p_i_p/res/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback callBack;
  const RoundButton(
      {required this.title,
      this.loading = false,
      required this.callBack,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: callBack,
        child: Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(color: AppColors.buttonColor),
          child: Center(child:loading? CircularProgressIndicator(color: Colors.white,): Text(title)),
        ));
  }
}
