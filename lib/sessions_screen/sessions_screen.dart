import 'dart:math' show pi;

import 'package:animated_stack/animated_stack.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:masusc/sessions_screen/add_session_screen.dart';
import 'package:masusc/sessions_screen/cubit/sessions_cubit.dart';
import 'package:masusc/sessions_screen/cubit/sessions_states.dart';
import 'package:masusc/sessions_screen/edit_sessions_screen.dart';
import 'package:url_launcher/link.dart';

import '../shared/shared_component/component.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  showOption(context) {
    var passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return showDialog(
      context: context,
      builder: (context) => BlocConsumer<SessionsCubit, SessionsStates>(
        listener: (context, state) {},
        builder: (context, state) => AlertDialog(
          backgroundColor: HexColor('ffffff'),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: Text(
            'Enter Password',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 15.sp,
            ),
          ),
          content: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: SessionsCubit.get(context).isObscure,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter Password to edit';
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
                          color: Colors.black,
                          onPressed: () {
                            SessionsCubit.get(context).changeSuffixIcon();
                          },
                          icon: Icon(
                            SessionsCubit.get(context).suffixIcon,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ConditionalBuilder(
                    condition: state is! CheckPasswordLoading,
                    fallback: (context) => Center(
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: loading(),
                      ),
                    ),
                    builder: (context) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.blueAccent,
                      ),
                      child: ListTile(
                        splashColor: HexColor('ffffff'),
                        leading: const Icon(
                          IconBroken.Login,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Go to add sessions',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            await SessionsCubit.get(context)
                                .checkPass(password: passwordController.text)
                                .then((value) {
                              if (value) {
                                Navigator.pop(context);
                              navigateTo(context: context, widget:     const AddSessionsScreen(),);
                              } else {
                                Navigator.pop(context);
                                showToast(
                                    msg: 'ask you president to know password',
                                    state: MsgState.error);
                              }
                            });
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
    );
  }

  showOption2(context) {
    var passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return showDialog(
      context: context,
      builder: (context) => BlocConsumer<SessionsCubit, SessionsStates>(
        listener: (context, state) {},
        builder: (context, state) => AlertDialog(
          backgroundColor: HexColor('ffffff'),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: Text(
            'Enter Password',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 15.sp,
            ),
          ),
          content: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: SessionsCubit.get(context).isObscure,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter Password to edit';
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
                          color: Colors.black,
                          onPressed: () {
                            SessionsCubit.get(context).changeSuffixIcon();
                          },
                          icon: Icon(
                            SessionsCubit.get(context).suffixIcon,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ConditionalBuilder(
                    condition: state is! CheckPasswordLoading,
                    fallback: (context) => Center(
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: loading(),
                      ),
                    ),
                    builder: (context) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.blueAccent,
                      ),
                      child: ListTile(
                        splashColor: HexColor('ffffff'),
                        leading: const Icon(
                          IconBroken.Login,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Go to edit sessions',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                        onTap: () async {
                          if (SessionsCubit.get(context).sessions?.data !=
                              null) {
                            if (formKey.currentState!.validate()) {
                              await SessionsCubit.get(context)
                                  .checkPass(password: passwordController.text)
                                  .then((value) {
                                if (value) {
                                  Navigator.pop(context);
                                navigateTo(context: context, widget:   const EditSessionsScreen(),);
                                } else {
                                  Navigator.pop(context);
                                  showToast(
                                      msg: 'ask you president to know password',
                                      state: MsgState.error);
                                }
                              });
                            }
                          } else {
                            Navigator.pop(context);
                            showToast(
                                msg: 'No Sessions To Edit',
                                state: MsgState.error);
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
    );
  }

  @override
  Widget build(BuildContext context) {
    var cubit = SessionsCubit.get(context);
    return BlocConsumer<SessionsCubit, SessionsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return AnimatedStack(
          columnWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onLongPress: () {
                  showToast(msg: 'Edit Sessions', state: MsgState.information);
                },
                child: FloatingActionButton(
                  heroTag: 'edit',
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    showOption2(context);
                  },
                  child: const Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                onLongPress: () {
                  showToast(msg: 'Add Sessions', state: MsgState.information);
                },
                child: FloatingActionButton(
                  heroTag: 'add',
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    showOption(context);
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          animateButton: true,
          fabIconColor: Colors.white,
          bottomWidget: const SizedBox(
            height: 0.0,
          ),
          backgroundColor: Colors.grey[400]!,
          foregroundWidget: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10.r),
            )),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(
                    IconBroken.Arrow___Left_2,
                    color: HexColor('c50000'),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  'Sessions',
                  style: TextStyle(
                    color: HexColor('c50000'),
                    fontSize: 18.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body: RefreshIndicator(
                onRefresh: () async {
                  await cubit.getAllSessions();
                },
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          top: MediaQuery.of(context).size.height - 282,
                          child: Transform.rotate(
                            angle: pi / 4,
                            child: Transform.translate(
                              offset: Offset(-380.w, -20.h),
                              child: Container(
                                height: 900.h,
                                width: 900.w,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(150),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height - 280,
                          child: Transform.rotate(
                            angle: pi / 4,
                            child: Transform.translate(
                              offset: Offset(-380.w, -20.h),
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
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height - 242,
                          child: Transform.rotate(
                            angle: pi / 4,
                            child: Transform.translate(
                              offset: Offset(-380.w, -20.h),
                              child: Container(
                                height: 900.h,
                                width: 900.w,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(150),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height - 240,
                          child: Transform.rotate(
                            angle: pi / 4,
                            child: Transform.translate(
                              offset: Offset(-380.w, -20.h),
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
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height - 200,
                          child: Transform.rotate(
                            angle: pi / 4,
                            child: Transform.translate(
                              offset: Offset(-380.w, -20.h),
                              child: Container(
                                height: 900.h,
                                width: 900.w,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: HexColor('0438a2'),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(150),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (cubit.sessions?.data != null &&
                        state is! GetSessionsLoading)
                      RefreshIndicator(
                        onRefresh: () async {
                          await SessionsCubit.get(context).getAllSessions();
                        },
                        child: ListView.separated(
                          padding: EdgeInsets.all(10.r),
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Center(
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0.r),
                                ),
                                clipBehavior: Clip.antiAlias,
                                borderOnForeground: true,
                                color: Colors.white.withOpacity(0.5),
                                child: Stack(
                                  children: [
                                    Opacity(
                                      opacity: 0.8,
                                      child: Image.asset(
                                        'assets/images/1.jpg',
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3.4,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.03,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(14.0.sp),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Session About :   ',
                                                style: TextStyle(
                                                  color: HexColor('c50000'),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.87,
                                                child: Text(
                                                  cubit.sessions?.data?[index]
                                                          .sessionName ??
                                                      '',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'date :   ',
                                                style: TextStyle(
                                                  color: HexColor('c50000'),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.8,
                                                child: Text(
                                                  cubit.sessions?.data?[index]
                                                          .date ??
                                                      '',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'time :   ',
                                                style: TextStyle(
                                                  color: HexColor('c50000'),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.8,
                                                child: Text(
                                                  cubit.sessions?.data?[index]
                                                          .time ??
                                                      '',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'day :   ',
                                                style: TextStyle(
                                                  color: HexColor('c50000'),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    1.8,
                                                child: Text(
                                                  cubit.sessions?.data?[index]
                                                      .day ??
                                                      'not yet',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'presented by :   ',
                                                style: TextStyle(
                                                  color: HexColor('c50000'),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.8,
                                                child: Text(
                                                  cubit.sessions?.data?[index]
                                                          .presentedBy ??
                                                      '',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'place :   ',
                                                style: TextStyle(
                                                  color: HexColor('c50000'),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.8,
                                                child: Text(
                                                  cubit.sessions?.data?[index]
                                                          .place ??
                                                      '',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Committee :   ',
                                                style: TextStyle(
                                                  color: HexColor('c50000'),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    1.8,
                                                child: Text(
                                                  cubit.sessions?.data?[index]
                                                      .committeeName ??
                                                      'not yet',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          if (cubit.sessions?.data?[index]
                                                  .link !=
                                              '')
                                            Link(
                                              uri: Uri.parse(cubit.sessions!
                                                  .data![index].link!),
                                              builder: (BuildContext context,
                                                  Future<void> Function()?
                                                      followLink) {
                                                return InkWell(
                                                  onTap: followLink,
                                                  child: Center(
                                                    child: Container(
                                                      height: 40.h,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white
                                                              .withOpacity(0.9),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Center(
                                                        child: Text(
                                                          'Tap to go',
                                                          style: TextStyle(
                                                            color: HexColor(
                                                                'c50000'),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          shrinkWrap: false,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10.0.h,
                            );
                          },
                          itemCount: cubit.sessions!.data!.length,
                        ),
                      )
                    else if (cubit.sessions?.data == null &&
                        state is GetSessionsLoading)
                      loading()
                    else if (cubit.sessions?.data == null &&
                        state is! GetSessionsLoading)
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 100.h,
                            ),
                            Text(
                              'No Sessions Prepared Yet !!!',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            button(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 50.h,
                              backGroundColor: HexColor('c50000'),
                              onTap: () async {
                                await cubit.getAllSessions();
                              },
                              text: 'Tap to refresh',
                            ),
                          ],
                        ),
                      )
                    else
                      loading(),
                  ],
                ),
              ),
            ),
          ),
          fabBackgroundColor: Colors.blue,
        );
      },
    );
  }
}
