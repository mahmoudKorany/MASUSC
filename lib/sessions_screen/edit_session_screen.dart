import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:masusc/layout_screen/layout_screen.dart';
import 'package:masusc/sessions_screen/cubit/sessions_cubit.dart';
import 'package:masusc/sessions_screen/cubit/sessions_states.dart';
import 'package:masusc/sessions_screen/session_model.dart';

import '../shared/shared_component/component.dart';

class EditSessionScreen extends StatefulWidget {
  final  Data data;
  const EditSessionScreen({super.key,required this.data});
  @override
  State<EditSessionScreen> createState() =>
      _EditSessionScreenState();
}

class _EditSessionScreenState extends State<EditSessionScreen> {
  var sessionAboutController = TextEditingController();

  var dateController = TextEditingController();

  var timeController = TextEditingController();

  var presentedNameController = TextEditingController();

  var placeController = TextEditingController();

  var linkController = TextEditingController();

  var dayController = TextEditingController();

  var committeeNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String time = '';
  String date = '';
  go() {
  sessionAboutController.text = widget.data.sessionName!;
  dateController.text = widget.data.date!;
  timeController.text = widget.data.time!;
  presentedNameController.text = widget.data.presentedBy!;
  placeController.text = widget.data.place!;
  linkController.text = widget.data.link??'';
  dayController.text = widget.data.day??'';
  committeeNameController.text = widget.data.committeeName??'';
  var df = DateFormat("h:mm a");
  var dt = df.parse(widget.data.time!);
  var finalTime =
  DateFormat('HH:mm').format(dt);
  time = '$finalTime:00';
  date = widget.data.date!;
  }

  @override
  void initState() {
    super.initState();
    go();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SessionsCubit, SessionsStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0.0),
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(
                IconBroken.Arrow___Left_2,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Edit Session',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: HexColor('0438a2'),
          body: Form(
            key: formKey,
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 10.w, vertical: 20.h),
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 15.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'session about ?',
                            style: TextStyle(
                              fontSize: 20.0.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
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
                              controller: sessionAboutController,
                              keyboardType: TextInputType.text,
                              cursorColor: HexColor('cb0000'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please the session name';
                                } else {
                                  return null;
                                }
                              },
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'session name',
                                hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.sp,
                                    color: Colors.white),
                                prefixIcon: Icon(
                                  Iconsax.text,
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
                            'session committee ?',
                            style: TextStyle(
                              fontSize: 20.0.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
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
                              controller: committeeNameController,
                              keyboardType: TextInputType.text,
                              cursorColor: HexColor('cb0000'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please the session committee';
                                } else {
                                  return null;
                                }
                              },
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'session committee',
                                hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.sp,
                                    color: Colors.white),
                                prefixIcon: Icon(
                                  Iconsax.text,
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
                            'Date ?',
                            style: TextStyle(
                              fontSize: 20.0.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
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
                              controller: dateController,
                              cursorColor: HexColor('cb0000'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter the date';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.datetime,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'date',
                                hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                                prefixIcon: Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2023-19-30'),
                                ).then((value) {
                                  final DateFormat formatter =
                                  DateFormat('yyyy-MM-dd');
                                  date = formatter.format(value!);
                                  dateController.text = date;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'session day ?',
                            style: TextStyle(
                              fontSize: 20.0.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
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
                              controller: dayController,
                              keyboardType: TextInputType.text,
                              cursorColor: HexColor('cb0000'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please the session day';
                                } else {
                                  return null;
                                }
                              },
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'session day',
                                hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.sp,
                                    color: Colors.white),
                                prefixIcon: Icon(
                                  Iconsax.text,
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
                            'Time ?',
                            style: TextStyle(
                              fontSize: 20.0.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
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
                              controller: timeController,
                              keyboardType: TextInputType.datetime,
                              cursorColor: HexColor('cb0000'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter the time';
                                } else {
                                  return null;
                                }
                              },
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Time',
                                hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.sp,
                                    color: Colors.white),
                                prefixIcon: Icon(
                                  Icons.timer_sharp,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  var df = DateFormat("h:mm a");
                                  var dt = df.parse(value!.format(context));
                                  var finalTime =
                                  DateFormat('HH:mm').format(dt);
                                  time = '$finalTime:00';
                                  timeController.text = value.format(context);
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Presented by ?',
                            style: TextStyle(
                              fontSize: 20.0.sp,
                              fontWeight: FontWeight.bold,
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
                              controller: presentedNameController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your name';
                                } else {
                                  return null;
                                }
                              },
                              cursorColor: HexColor('cb0000'),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Name',
                                prefixIcon: const Icon(
                                  IconBroken.Profile,
                                  color: Colors.white,
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Place ?',
                            style: TextStyle(
                              fontSize: 20.0.sp,
                              fontWeight: FontWeight.bold,
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
                              controller: placeController,
                              keyboardType: TextInputType.text,
                              cursorColor: HexColor('cb0000'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter the place';
                                } else {
                                  return null;
                                }
                              },
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Place',
                                prefixIcon: const Icon(
                                  IconBroken.Location,
                                  color: Colors.white,
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Link of Session',
                            style: TextStyle(
                              fontSize: 20.0.sp,
                              fontWeight: FontWeight.bold,
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
                              controller: linkController,
                              keyboardType: TextInputType.text,
                              cursorColor: HexColor('cb0000'),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.link,
                                  color: Colors.white,
                                ),
                                hintText: '    Link of Session',
                                hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Please if the session is not online keep the link empty',
                            style: TextStyle(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          ConditionalBuilder(
                            condition: state is! UpdateSessionLoading && state is! GetSessionsLoading,
                            builder: (context) => button(
                              onTap: () async {
                                String link;
                                if (formKey.currentState!.validate()) {
                                  if(linkController.text !='')
                                  {
                                    if(linkController.text.contains('https://'))
                                    {
                                      link = linkController.text;
                                    }else
                                    {
                                      link = 'https://${linkController.text}';
                                    }
                                  }else
                                  {
                                    link ='';
                                  }
                                  await SessionsCubit.get(context)
                                      .updateSession(
                                    day: dayController.text,
                                    committeeName: committeeNameController.text,
                                    sessionName: sessionAboutController.text,
                                    presentedBy: presentedNameController.text,
                                    meetingLink: link,
                                    sessionTime: time,
                                    sessionDate: date,
                                    sessionPlace: placeController.text,
                                    sessionId: widget.data.id!,
                                  ).then((value)
                                  {
                                    navigateAndFinish(context, const LayoutScreen());
                                  });
                                }
                              },
                              width: double.infinity,
                              height: 45,
                              backGroundColor: HexColor('ca0000'),
                              text: 'Submit',
                            ),
                            fallback: (context) => loading(),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: const AssetImage(
                                'assets/images/logo.png',
                              ),
                              radius: 60.r,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
