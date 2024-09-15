import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:masusc/home/cubit/cubit.dart';
import 'package:url_launcher/link.dart';

class ChooseGradeScreen extends StatefulWidget {
  const ChooseGradeScreen({super.key, required this.isFirstTerm});

  final bool isFirstTerm;

  @override
  State<ChooseGradeScreen> createState() => _ChooseGradeScreenState();
}

class _ChooseGradeScreenState extends State<ChooseGradeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> firstTerm = [
      LayOutCubit.get(context).dataDrive?.data?[0].link11 ?? '',
      LayOutCubit.get(context).dataDrive?.data?[0].link21 ?? '',
      LayOutCubit.get(context).dataDrive?.data?[0].link31 ?? '',
      LayOutCubit.get(context).dataDrive?.data?[0].link41 ?? '',
    ];

    List<String> secondTerm = [
      LayOutCubit.get(context).dataDrive?.data?[0].link12 ?? '',
      LayOutCubit.get(context).dataDrive?.data?[0].link22 ?? '',
      LayOutCubit.get(context).dataDrive?.data?[0].link32 ?? '',
      LayOutCubit.get(context).dataDrive?.data?[0].link42 ?? '',
    ];
    List<String> data;
    if (widget.isFirstTerm) {
      data = firstTerm;
    } else {
      data = secondTerm;
    }
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/6abac75ba087b5ac9d49206cf0aa00a8.jpg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.2),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                vertical: 30.h, horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      IconBroken.Arrow___Left_2,
                      color: Colors.white,
                    )),
                Text(
                  'Alpert Einstein once siad :',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'I\'m only passionately curious',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                const Spacer(),
                Center(
                  child: Text(
                    'Please select your grade',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontFamily: 'Montserrat'),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Link(
                        uri: Uri.parse(data[0]),
                        target: LinkTarget.blank,
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: Container(
                            height: 45.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Text(
                                'First year',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Link(
                        uri: Uri.parse(data[1]),
                        target: LinkTarget.blank,
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: Container(
                            height: 45.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Text(
                                'Second year',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Link(
                        uri: Uri.parse(data[2]),
                        target: LinkTarget.blank,
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: Container(
                            height: 45.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Text(
                                'Third year',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Link(
                        uri: Uri.parse(data[3]),
                        target: LinkTarget.blank,
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: Container(
                            height: 45.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Text(
                                'Fourth year',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
