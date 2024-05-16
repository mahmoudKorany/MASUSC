import 'dart:math' show pi;

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:masusc/login_screen/login_cubit/login_cubit.dart';
import 'package:masusc/login_screen/login_cubit/login_states.dart';
import 'package:masusc/shared/shared_component/component.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

showOption(context) {
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (context) => BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) => AlertDialog(
        backgroundColor: HexColor('ffffff'),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        title: Text(
          'Change Password',
          style: TextStyle(
            fontFamily: 'jannah1',
            color: Colors.black,
            fontSize: 15.sp,
          ),
        ),
        content: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: LoginCubit.get(context).isObscure,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your New Password';
                        } else {
                          return null;
                        }
                      },
                      cursorColor: Colors.black,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontFamily: 'Jannah1',
                          fontSize: 15.sp,
                        ),
                        prefixIcon: Icon(
                          Iconsax.lock,
                          size: 15.sp,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: IconButton(
                            color: Colors.black,
                            onPressed: () {
                              LoginCubit.get(context).changeSuffixIcon();
                            },
                            icon: Icon(
                              LoginCubit.get(context).suffixIcon,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ConditionalBuilder(
                    condition: State is! ChangePasswordLoading,
                    fallback: (context) => loading(),
                    builder: (context) => Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: HexColor('ca0000'),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: ListTile(
                        splashColor: HexColor('ca0000'),
                        leading: const Icon(
                          IconBroken.Lock,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Change Password',
                          style: TextStyle(
                            fontFamily: 'jannah1',
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                        onTap: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context)
                                  .changePassword(passwordController.text, context);
                            }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _SettingScreenState extends State<SettingScreen> {
  var userNamedController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      builder: (context, state) {
        emailController.text = LoginCubit.get(context).currentUser?.email??'';
        phoneController.text = LoginCubit.get(context).currentUser?.phone??'';
        userNamedController.text = LoginCubit.get(context).currentUser?.name??'';
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0.0),
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: Icon(
                IconBroken.Arrow___Left_2,
                color: HexColor('ca0000'),
              ),
            ),
            titleSpacing: 0,
            title: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    'Hello , ${LoginCubit.get(context).currentUser?.name??''}',
                    maxLines: 1,
                    style: TextStyle(
                      color: HexColor('ca0000'),
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Montserrat',
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                const Icon(
                  Icons.waving_hand_outlined,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              Transform.rotate(
                angle: pi / 6,
                child: Transform.translate(
                  offset: Offset(-300.w, 120.h),
                  child: Container(
                    height: 900.h,
                    width: 900.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            HexColor('002e8d'),
                            HexColor('063caa'),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: const [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(150),
                    ),
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi / 6,
                child: Transform.translate(
                  offset: Offset(-290.w, 130.h),
                  child: Container(
                    height: 900.h,
                    width: 900.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(150),
                    ),
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi / 6,
                child: Transform.translate(
                  offset: Offset(-289.w, 131.h),
                  child: Container(
                    height: 900.h,
                    width: 900.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            HexColor('002e8d'),
                            HexColor('063caa'),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: const [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(150),
                    ),
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi / 6,
                child: Transform.translate(
                  offset: Offset(-280.w, 140.h),
                  child: Container(
                    height: 900.h,
                    width: 900.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(150),
                    ),
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi / 6,
                child: Transform.translate(
                  offset: Offset(-279.w, 141.h),
                  child: Container(
                    height: 900.h,
                    width: 900.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            HexColor('002e8d'),
                            HexColor('063caa'),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: const [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(150),
                    ),
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi / 6,
                child: Transform.translate(
                  offset: Offset(-270.w, 150.h),
                  child: Container(
                    height: 900.h,
                    width: 900.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(150),
                    ),
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi / 6,
                child: Transform.translate(
                  offset: Offset(-269.w, 151.h),
                  child: Container(
                    height: 900.h,
                    width: 900.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            HexColor('002e8d'),
                            HexColor('063caa'),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: const [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(150),
                    ),
                  ),
                ),
              ),
              if(LoginCubit.get(context).currentUser != null)
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'User name',
                                  style: TextStyle(
                                    fontSize: 18.0.sp,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: TextFormField(
                                    cursorColor: HexColor('cb0000'),
                                    controller: userNamedController,
                                    enabled: false,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'user name',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.sp,
                                          color: Colors.black
                                      ),
                                      prefixIcon: Icon(
                                        Iconsax.personalcard,
                                        color: Colors.black,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'phone number',
                                  style: TextStyle(
                                    fontSize: 18.0.sp,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: TextFormField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    enabled: false,
                                    cursorColor: HexColor('cb0000'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your Phone';
                                      } else {
                                        return null;
                                      }
                                    },
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'phone number',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.sp,
                                        color: Colors.black,
                                      ),
                                      prefixIcon: Icon(
                                        Iconsax.mobile,
                                        color: Colors.black,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 18.0.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: TextFormField(
                                    controller: emailController,
                                    enabled: false,
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: HexColor('cb0000'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your email address';
                                      } else {
                                        return null;
                                      }
                                    },
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.sp,
                                          color: Colors.black
                                      ),
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.black,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    showOption(context);
                                  },
                                  child: Center(
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      height: 50.h,
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Colors.black,
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Change Password ?',
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            const Icon(
                                              IconBroken.Lock,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    ConditionalBuilder(
                      condition: state is! LogoutLoading,
                      fallback: (context) => loading(),
                      builder: (context) => InkWell(
                        onTap: () {
                          LoginCubit.get(context).logout(context);
                        },
                        child: Center(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 50.h,
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: HexColor('ca0000'),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  const Icon(
                                    IconBroken.Logout,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: const AssetImage(
                            'assets/images/logo.png',
                          ),
                          radius: 70.r,
                        ),
                      ),
                    ),
                  ],
                ),
              )
              else
                loading(),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
