import 'dart:math' show pi;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masusc/home/home_screen.dart';
import 'package:masusc/layout_screen/layout_screen.dart';
import 'package:masusc/login_screen/login_screen/login.dart';
import 'package:masusc/shared/cache-helper/cache-helper.dart';
import 'package:masusc/shared/shared_component/component.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.body,
    required this.title,
    required this.image,
  });
}

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  var boardController = PageController();
  bool isLast = false;
  List<BoardingModel> boarding = [
    BoardingModel(
      body:
      'Join our team To achieve your \ndream',
      title: 'Hi,MAian',
      image: 'assets/images/logo.png',
    ),
    BoardingModel(
      body: 'Events,Sessions,Courses,Magazines,\nTrainings,Blogs,Competitions and Fun Activities',
      title: 'Our products',
      image: 'assets/images/logo.png',
    ),
    BoardingModel(
      body:
      'Don\'t Worry About Studying, now you can find all your data in one place',
      title: 'Your material in one place',
      image: 'assets/images/logo.png',
    ),
  ];
  late double currentOpacity;
  @override
  void initState() {
    super.initState();
    currentOpacity = 0;
    Future.delayed(const Duration(milliseconds: 100), () {})
        .then((value) async {
      setState(() {
        currentOpacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        opacity: currentOpacity,
        duration: const Duration(milliseconds: 3000),
        child: Stack(
          children: [
            Transform.rotate(
              angle: pi / 4,
              child: Transform.translate(
                offset: Offset(-240.w, 80.h),
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
            Column(
              children: [
                SizedBox(
                  height: 529.h,
                  width: double.infinity.w,
                  child: PageView.builder(
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    controller: boardController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return boardingItemBuilder(boarding[index]);
                    },
                    itemCount: boarding.length,
                  ),
                ),
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: HexColor('e03a3e'),
                    dotHeight: 10.0.h,
                    dotWidth: 10.0.w,
                    expansionFactor: 4,
                    spacing: 5.0,
                  ),
                ),
                Transform.translate(
                  offset: Offset(80.w, 100.h),
                  child: Transform.rotate(
                    angle: pi / 4,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 291.h,
                          width: 291.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(90.r),
                          ),
                        ),
                        Container(
                          height: 290.h,
                          width: 290.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(90.r),
                          ),
                        ),
                        GestureDetector(
                          onTap: ()async {
                            if (isLast) {
                              await CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
                                navigateAndFinish(context, const LoginScreen());
                              });
                            } else {
                              boardController
                                  .nextPage(
                                duration: const Duration(
                                  milliseconds: 250,
                                ),
                                curve: Curves.easeInCirc,
                              )
                                  .then((value) {});
                            }
                          },
                          child: Container(
                            height: 280.h,
                            width: 280.w,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    HexColor('cc0000'),
                                    HexColor('c20000'),
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(1.0, 0.0),
                                  stops: const [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(90.r),
                            ),
                            child: Transform.rotate(
                              angle: -pi / 4,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        DefaultTextStyle(
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.white,
                                          ),
                                          child: AnimatedTextKit(
                                            animatedTexts: [
                                              TyperAnimatedText(
                                                'Next',
                                              ),
                                            ],
                                            totalRepeatCount: 30,
                                            onTap: () {
                                              if (isLast) {

                                              } else {
                                                boardController
                                                    .nextPage(
                                                  duration:
                                                  const Duration(
                                                    milliseconds:
                                                    250,
                                                  ),
                                                  curve: Curves
                                                      .easeInCirc,
                                                )
                                                    .then((value) {});
                                              }
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 20.w),
                                        const Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40.h,
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget boardingItemBuilder(BoardingModel model) => Padding(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100.h,
        ),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.white,
            fontFamily: 'Montserrat'
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                model.title,
              ),
            ],
            totalRepeatCount: 1,
            onTap: () {},
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 300.w,
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
                fontFamily: 'Montserrat'
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(model.body),
              ],
              totalRepeatCount: 1,
              onTap: () {},
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 5)],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(
              model.image,
            ),
            radius: 100,
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
      ],
    ),
  );
}