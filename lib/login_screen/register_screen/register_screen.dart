import 'dart:math' show pi;
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masusc/login_screen/login_cubit/login_states.dart';
import 'package:masusc/shared/shared_component/component.dart';
import '../login_cubit/login_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var userNamedController = TextEditingController();
    var phoneController = TextEditingController();
    bool isEmailValid(String email) {
      RegExp emailRegex =
          RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
      return emailRegex.hasMatch(email) &&
          !email.contains(RegExp(r'[!#$%^&*(),?":{}|<>]'));
    }

    bool isPasswordValid(String password) {
      RegExp passwordRegex = RegExp(
          r'^(?=.*[A-Za-z])(?=.*[@#$%^&+=])(?=.*[0-9])[A-Za-z0-9@#$%^&+=]+$');
      return passwordRegex.hasMatch(password);
    }

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Transform.rotate(
              angle: pi / 6,
              child: Transform.translate(
                offset: Offset(-220.w, 80.h),
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
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 10.w, vertical: 100.h),
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 15.w, vertical: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register Now',
                          style: TextStyle(
                            fontSize: 30.0.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'User name',
                          style: TextStyle(
                            fontSize: 18.0.sp,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
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
                            controller: userNamedController,
                            keyboardType: TextInputType.name,
                            cursorColor: HexColor('cb0000'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your name';
                              } else {
                                return null;
                              }
                            },
                            autofillHints: const [AutofillHints.name],
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'user name',
                              hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.sp,
                                  color: Colors.white),
                              prefixIcon: Icon(
                                Iconsax.personalcard,
                                color: Colors.white,
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
                            color: Colors.white,
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
                            cursorColor: HexColor('cb0000'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your Phone';
                              } else {
                                return null;
                              }
                            },
                            autofillHints: const [
                              AutofillHints.telephoneNumber
                            ],
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'phone number',
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                              prefixIcon: Icon(
                                Iconsax.mobile,
                                color: Colors.white,
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
                            color: Colors.white,
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
                            autofillHints: const [AutofillHints.email],
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: HexColor('cb0000'),
                            validator: (value) {
                              if (isEmailValid(emailController.text)) {
                                if (value!.isEmpty) {
                                  return 'please enter your email address';
                                } else {
                                  return null;
                                }
                              } else {
                                return 'please enter a valid email address';
                              }
                            },
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.sp,
                                  color: Colors.white),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 18.0.sp,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
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
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: LoginCubit.get(context).isObscure,
                            validator: (value) {
                              if (!isPasswordValid(passwordController.text)) {
                                if (value!.isEmpty) {
                                  return 'please enter your password';
                                } else {
                                  return null;
                                }
                              } else {
                                return 'please enter password in english';
                              }
                            },
                            autofillHints: const [AutofillHints.password],
                            cursorColor: HexColor('cb0000'),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                              prefixIcon: Icon(
                                Iconsax.lock,
                                size: 15.sp,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
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
                        SizedBox(
                          height: 30.h,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoading,
                          builder: (context) => button(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                  name: userNamedController.text,
                                  context: context,
                                );
                              }
                            },
                            width: double.infinity,
                            height: 45,
                            backGroundColor: HexColor('ca0000'),
                            text: 'Register',
                          ),
                          fallback: (context) => loading(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already Have An Account?',
                              style: TextStyle(
                                fontSize: 15.0.sp,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 15.0.sp,
                                  fontFamily: 'Montserrat',
                                  color: HexColor('ca0000'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0),
                            backgroundImage: const AssetImage(
                              'assets/images/logo.png',
                            ),
                            radius: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
