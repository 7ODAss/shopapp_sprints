import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Future<void> showMyDialog({required BuildContext context, required String msg, required String title, required Color color}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.center,
            child:  Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Suwannaphum",
                color: color,
                fontSize: 30,
              ),
            ),
          ),
          content:  SingleChildScrollView(
            child: Text(
              msg,
              style: TextStyle(
                fontFamily: "Suwannaphum",
                color: Colors.grey[600],
                fontSize: 18,
              ),
            ),
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Close",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "Suwannaphum",
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

}
