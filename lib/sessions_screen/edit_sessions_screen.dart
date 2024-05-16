import 'dart:math' show pi;

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:masusc/layout_screen/layout_screen.dart';
import 'package:masusc/sessions_screen/cubit/sessions_cubit.dart';
import 'package:masusc/sessions_screen/cubit/sessions_states.dart';
import 'package:masusc/sessions_screen/edit_session_screen.dart';
import 'package:masusc/shared/shared_component/component.dart';

class EditSessionsScreen extends StatefulWidget {
  const EditSessionsScreen({super.key});

  @override
  State<EditSessionsScreen> createState() => _EditSessionsScreenState();
}

class _EditSessionsScreenState extends State<EditSessionsScreen> {
  showOption(context, int index) {
    return showDialog(
      context: context,
      builder: (context) =>
          BlocConsumer<SessionsCubit, SessionsStates>(
            listener: (context, state) {},
            builder: (context, state) =>
                AlertDialog(
                  backgroundColor: HexColor('ffffff'),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  title: Text(
                    'Are you sure to remove this session ??',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                  content: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ConditionalBuilder(
                          condition: state is! DeleteSessionsLoading && state is! GetSessionsLoading,
                          fallback: (context) =>
                              Center(
                                child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: loading(),
                                ),
                              ),
                          builder: (context) =>
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: HexColor('c50000'),
                                ),
                                child: ListTile(
                                  splashColor: HexColor('ffffff'),
                                  title: Center(
                                    child: Text(
                                      'Tap to confirm',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                  onTap: () async
                                  {
                                    await SessionsCubit.get(context).deleteSession(
                                      id: (SessionsCubit.get(context).sessions?.data?[index].id)!,
                                    ).then((value)
                                    {
                                      navigateAndFinish(context, const LayoutScreen());
                                    });
                                  },
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SessionsCubit, SessionsStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var cubit = SessionsCubit.get(context);
        return Scaffold(
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
              },
            ),
            title: Text(
              'Edit Sessions',
              style: TextStyle(
                color: HexColor('c50000'),
                fontSize: 18.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Stack(
                children: [
                  Positioned(
                    top: MediaQuery
                        .of(context)
                        .size
                        .height - 282,
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
                    top: MediaQuery
                        .of(context)
                        .size
                        .height - 280,
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
                    top: MediaQuery
                        .of(context)
                        .size
                        .height - 242,
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
                    top: MediaQuery
                        .of(context)
                        .size
                        .height - 240,
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
                    top: MediaQuery
                        .of(context)
                        .size
                        .height - 200,
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
              ListView.separated(
                physics: const BouncingScrollPhysics(),
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
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 4,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.03,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0.sp),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width /
                                          1.8,
                                      child: Text(
                                        cubit.sessions?.data?[index]
                                            .sessionName ?? '',
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
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width /
                                          1.8,
                                      child: Text(
                                        cubit.sessions?.data?[index].date ?? '',
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
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width /
                                          1.8,
                                      child: Text(
                                        cubit.sessions?.data?[index].day ?? 'not yet',
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
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width /
                                          1.8,
                                      child: Text(
                                        cubit.sessions?.data?[index].time ?? '',
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
                                      'committee :   ',
                                      style: TextStyle(
                                        color: HexColor('c50000'),
                                        fontSize: 14.sp,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width /
                                          1.8,
                                      child: Text(
                                        cubit.sessions?.data?[index].committeeName ?? 'not yet',
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
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width /
                                          1.8,
                                      child: Text(
                                        cubit.sessions?.data?[index]
                                            .presentedBy ?? '',
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
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width /
                                          1.8,
                                      child: Text(
                                        cubit.sessions?.data?[index].place ??
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MyCustomRoute(
                                                    builder: (context) =>
                                                        EditSessionScreen(
                                                          data: (cubit.sessions
                                                              ?.data![index])!,)));
                                          },
                                          child: Center(
                                            child: Container(
                                              height: 40.h,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width /
                                                  2,
                                              decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.9),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10.r)),
                                              child: Center(
                                                child: Text(
                                                  'Tap to edit',
                                                  style: TextStyle(
                                                    color: HexColor('c50000'),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            showOption(context,index);
                                          },
                                          child: Center(
                                            child: Container(
                                              height: 40.h,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width /
                                                  2,
                                              decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.9),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10.r)),
                                              child: Center(
                                                child: Text(
                                                  'Tap to remove',
                                                  style: TextStyle(
                                                    color: HexColor('c50000'),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                itemCount:(SessionsCubit.get(context).sessions?.data?.length)??0,
              ),
            ],
          ),
        );
      },
    );
  }
}
