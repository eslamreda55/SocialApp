import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';
import 'package:udemy_flutter/shared/styles/icons_broken.dart';


Widget defaultButton({
  double width = double.infinity,
  Color background = socialColor,
  @required Function onPressed,
  @required String text,
  bool isUpperCase = false,
  double raduis = 0.0,
  Null Function() function,
}) =>
    Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );


Widget defaultTextButton({
  @required Function onPressed,
  @required String text,
})
=>TextButton(
  onPressed: onPressed,
  child: Text(text.toUpperCase()),
          // style: TextStyle(
          //   color:defaultColor,
          // ),
  );

  void showToast({
      @required String text,
      @required toastState state,
      
    })=>
     Fluttertoast.showToast(
      msg:text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM_LEFT,
      timeInSecForIosWeb: 4,
      backgroundColor: chooseToastColor(state) ,
      textColor: Colors.white,
      fontSize: 16.0
      );


  enum toastState{SUCCESS,ERROR,WARNING}

  
  Color chooseToastColor(toastState state)
  {
    Color color;

    switch(state)
    {
      case toastState.SUCCESS:
      color= Colors.green;
      break;
      case toastState.ERROR:
        color= Colors.red;
        break;
      case toastState.WARNING:
        color= Colors.yellowAccent;
        break;
    }
    return color;

  }
      
Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required Function validate,
  @required IconData prefixIcon,
  @required String label,
  bool isPassword = false,
  //bool isClickable = false,
  IconData sufix,
  String hintText,
  Function onsubmited,
  Function onchange,
  Function onTab,
  Function sufixOnPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      obscureText: isPassword,
      //enabled:isClickable,
      onFieldSubmitted: onsubmited,
      onChanged: onchange,
      onTap: onTab,
      decoration: InputDecoration(
        suffixIcon: sufix != null
            ? IconButton(
                onPressed: sufixOnPressed,
                icon: Icon(sufix),
              )
            : null,
        prefixIcon: Icon(prefixIcon),
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

Widget defaultAppBar({
  @required BuildContext context,
  String title,
  List<Widget> actions,
})
{
  return AppBar(
    leading:IconButton(
      onPressed: ()
      {
        Navigator.pop(context);
      }, 
      icon: Icon(IconBroken.Arrow___Left_2),
      ) ,
    title: Text(
      title,  
     ),
    titleSpacing: 5.0,
    actions: actions,
    );
}

Widget myDivider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        color: Colors.grey[300],
        height: 1.0,
      ),
    );





void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
   MaterialPageRoute(
        builder: (context) => widget,
      ), 
   (route) => false,

   );


