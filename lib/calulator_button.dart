import 'package:flutter/material.dart';
import 'package:flutter_task1/colors/colors_claculator.dart';

typedef OnButtonClick = void Function(String);

class CalulatorButton extends StatelessWidget {
  String text;
  Color? backgroundColor ;
  Color? textColor;
  int? flex;
  bool isIcon;
  Widget? child;
  OnButtonClick onButtonClick;
  CalulatorButton({required this.text,this.backgroundColor,this.textColor,this.flex,this.child,this.isIcon =false,required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return
       Expanded(
      flex: flex ?? 1,
        
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: FloatingActionButton(
            backgroundColor: backgroundColor ?? ColorsClaculator.darkGreyColor,
            onPressed: () {
              onButtonClick(text);
            }, child:  isIcon ? child : Text(text,style: TextStyle(
            color: textColor ?? ColorsClaculator.lightBlueColor,
            fontSize: 24,
            fontWeight: FontWeight.w400
          ),),),
        ),
      );
    
  }
}
