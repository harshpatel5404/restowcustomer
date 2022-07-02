import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restowcustomer/Constants/colors.dart';

class MyButton extends StatefulWidget {
  final VoidCallback onpress;
  final widths;
  final btnfontsize;
  final String btntext;
  MyButton(
      {Key? key, this.widths, required this.onpress, required this.btntext, this.btnfontsize})
      : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.3),
            blurRadius: 5.0,
            offset: Offset(0.0, 8.0),
          ),
        ],
      ),
      width: widget.widths ?? double.infinity,
      height: Get.height * 0.08,
      child: ElevatedButton(
        onPressed: widget.onpress,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        child: Text(
          widget.btntext,
          style: TextStyle(fontSize: widget.btnfontsize ?? 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
