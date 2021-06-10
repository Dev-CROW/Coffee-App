import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//button
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  @required String text,
  @required Function function,
}) => Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(isUpperCase ? text.toUpperCase() : text),
      ),
    );

//form field

Widget defaultFormfield({
  @required TextEditingController controller,
  @required TextInputType type,
  Function submit,
  Function change,
  IconData suffix,
  bool isPassword = false,
  Function onTapped,
  bool clickable = true,
  Function suffixpress,
  TextStyle stylelabel,
  @required Function validate,
  @required String textlabel,
  @required IconData prefix,
}) => TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: submit,
      onChanged: change,
      enabled: clickable,
      onTap: onTapped,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelStyle: stylelabel,
        labelText: textlabel,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          onPressed: suffixpress,
          icon: Icon(
            suffix,
          ),
        ),
        border: OutlineInputBorder(),
      ),
    );
//text button
Widget defaultTextButton({@required Function function, @required String text}) => TextButton(
      onPressed: function,
      child: Text(text.toUpperCase()),
    );

//Navigation's

void navigateTo(context, widget) => Navigator.push(context, MaterialPageRoute(builder: (context) => widget));


void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (route) => false,
  );


//toast

void showToast({@required String text, @required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0
    );

enum ToastStates {SUCCESS, ERROR , WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;
  switch(state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}







Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

