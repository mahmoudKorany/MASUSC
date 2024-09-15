import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

void navigateAndFinish(context, widget) {
  if(Platform.isIOS){
    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => widget));
  }else{
    Navigator.of(context).pushReplacement(SlideRight(page: widget));
  }
}

Widget button(
    {required double width,
    required double height,
    required Color backGroundColor,
    required Function onTap,
    required String text,
    Color textColor = Colors.white}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Container(
      width: width.w,
      height: height.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20.sp, fontFamily: 'Montserrat', color: textColor),
        ),
      ),
    ),
  );
}

Widget loading() {
  return const Center(
    child: SizedBox(
      height: 80,
      width: 80,
      child: LoadingIndicator(
        indicatorType: Indicator.ballClipRotateMultiple,
        colors: [Colors.black],
        strokeWidth: 2,
      ),
    ),
  );
}
class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({ required WidgetBuilder builder, RouteSettings? settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // if (settings.isInitialRoute) {
    //   return child;
    // }
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}
class SlideRight extends PageRouteBuilder {
  // ignore: prefer_typing_uninitialized_variables
  final page;

  SlideRight({this.page})
      : super(
          pageBuilder: (context, animation, animationTwo) => page,
          transitionsBuilder: (context, animation, animationTwo, child) {
            var tween = Tween(
              begin: const Offset(0, 1),
              end: Offset.zero,
            );
            var curvesAnimation = CurvedAnimation(
                parent: animation, curve: Curves.linearToEaseOut);
            return SlideTransition(
              position: tween.animate(curvesAnimation),
              child: child,
            );
          },
        );
}

void navigateTo ({
  required BuildContext context ,
  required Widget widget
})
{
  if(Platform.isIOS){
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => widget));
  }else{
    Navigator.push(context, MyCustomRoute(builder: (context) => widget));
  }
}

void showToast({
  required String msg,
  required MsgState state,
})
{
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseColor(state: state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum MsgState {success,warning ,error,information}

Color chooseColor({
  required MsgState state,
})
{
  if(state == MsgState.success)
  {
    return Colors.green;
  }else if(state == MsgState.warning)
  {
    return Colors.amber;
  }else if(state == MsgState.information)
  {
    return HexColor('0450e9');
  }else

  {
    return Colors.red;
  }
}
