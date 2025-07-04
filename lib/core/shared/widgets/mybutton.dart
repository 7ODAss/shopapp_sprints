import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyButton({super.key,required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.deepPurpleAccent,
      ),
      width: MediaQuery
          .of(context)
          .size
          .width * 0.8,
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "Suwannaphum",
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
