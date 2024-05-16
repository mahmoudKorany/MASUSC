import 'dart:math'show pi;

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masusc/home/cubit/cubit.dart';
import 'package:masusc/home/cubit/states.dart';
import 'package:masusc/shared/shared_component/component.dart';
import 'package:masusc/team_screen/team_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late double currentOpacity;
  @override
  void initState() {
    currentOpacity = 0;
    Future.delayed(const Duration(milliseconds: 100), () {})
        .then((value) async {
      setState(() {
        currentOpacity = 1;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayOutCubit,LayOutStates>(
      listener: (context,state) {},
      builder:(context,state) {
        var cubit = LayOutCubit.get(context);
        return AnimatedOpacity(
          opacity: currentOpacity,
          duration: const Duration(milliseconds: 3000),
          child: Scaffold(
            body: cubit.screens[cubit.currentIndex],
            backgroundColor: Colors.white,
            floatingActionButton: GestureDetector(
            onTap: ()
            {
              Navigator.of(context)
                  .push(SlideRight(page: const TeamScreen()));
            },
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 8.0.h, vertical: 8.0.h),
              child: Transform.rotate(
                angle: pi / 4,
                child: Container(
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.r),
                    color: HexColor('0438a1'),
                  ),
                  child: Center(
                    child: Transform.rotate(
                      angle: -pi / 4,
                      child: const Icon(
                        IconBroken.User1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: const [
              IconBroken.Home,
              Icons.event,
              IconBroken.Paper,
              Iconsax.edit_2,
            ],
            backgroundColor: Colors.white,
            activeIndex: cubit.currentIndex,
            height: 70.h,
            activeColor: HexColor('ca0000'),
            gapLocation: GapLocation.center,
            elevation: 50,
            notchSmoothness: NotchSmoothness.smoothEdge,
            leftCornerRadius: 10.r,
            rightCornerRadius: 10.r,
            inactiveColor: Colors.grey,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index, context);
            },
          ),
      ),
        );
      },
    );
  }
}
