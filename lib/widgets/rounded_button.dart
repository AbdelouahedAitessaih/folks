import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final Function onPressed;
  const RoundedButton(
      {Key key, this.title, this.height, this.width, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.25),
          color: Color.fromRGBO(0, 82, 218, 1.0)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
        ),
      ),
    );
  }
}
