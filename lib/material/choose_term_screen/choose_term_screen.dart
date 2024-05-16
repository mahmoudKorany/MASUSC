import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:masusc/material/choose_year_screen/choose_year_screen.dart';
import 'package:masusc/shared/shared_component/component.dart';

class ChooseTermScreen extends StatelessWidget {
  const ChooseTermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/b51009d08481f712d74f7af1d5925c02.jpg',
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
                  'Study Anywhere!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Access Materials of your class',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                const Spacer(),
                Center(
                  child: Text(
                    'Please select your current term',
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
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MyCustomRoute(
                                  builder: (context) =>
                                      const ChooseGradeScreen(isFirstTerm: true)));
                        },
                        child: Container(
                          height: 45.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              'First term',
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
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MyCustomRoute(
                                  builder: (context) =>
                                      const ChooseGradeScreen(isFirstTerm: false)));
                        },
                        child: Container(
                          height: 45.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              'Second term',
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
