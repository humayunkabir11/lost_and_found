import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,

    required this.opPressed,
    this.buttonText
  });
final VoidCallback opPressed;
final String ? buttonText;
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      onPressed: opPressed,
      color: Colors.red,
      child:  Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.login,
              color: Colors.green,
            ),
            SizedBox(
              width: 6,
            ),
            Text( buttonText!,
              style: TextStyle(
                  color: Colors.green, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
