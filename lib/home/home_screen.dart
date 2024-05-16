import 'dart:math' show pi;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masusc/app_team/app_Team.dart';
import 'package:masusc/blog_screen/blog_detail.dart';
import 'package:masusc/commity_details/commity_details.dart';
import 'package:masusc/events_screen/event_details.dart';
import 'package:masusc/home/cubit/cubit.dart';
import 'package:masusc/home/cubit/states.dart';
import 'package:masusc/material/choose_term_screen/choose_term_screen.dart';
import 'package:masusc/price_screen/price_screen.dart';
import 'package:masusc/sessions_screen/sessions_screen.dart';
import 'package:masusc/setting_screen/setting_screen.dart';
import 'package:masusc/shared/shared_component/component.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/link.dart';
import 'package:user_social_profile/user_social_profile.dart';

class CommitItem {
  final String commitName;
  final String commitImage;
  final String commitImage1;
  final String? description;
  final String detail;

  CommitItem(
      {required this.detail,
      required this.commitName,
      required this.commitImage,
      required this.commitImage1,
      this.description});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  showOption(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: HexColor('ffffff'),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Options',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: HexColor('c50000'),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 10.0.h,
              ),
              Container(
                width: double.infinity,
                height: 2,
                color: Colors.black,
              ),
            ],
          ),
          content: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MyCustomRoute(
                        builder: (context) => const SessionsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: HexColor('0539a4'),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: ListTile(
                      leading: Icon(
                        IconBroken.Time_Square,
                        size: 30.0.sp,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Sessions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MyCustomRoute(
                        builder: (context) => const SettingScreen(),
                      ),
                    );
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: HexColor('0539a4'),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: ListTile(
                      leading: Icon(
                        IconBroken.Setting,
                        size: 30.0.sp,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MyCustomRoute(
                        builder: (context) => const AppTeam(),
                      ),
                    );
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: HexColor('0539a4'),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: ListTile(
                      leading: Icon(
                        IconBroken.Info_Square,
                        size: 30.0.sp,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Info',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<CommitItem> commitItems = [
      CommitItem(
        commitName: 'IT',
        detail:
            'INFORMATION TECHNOLOGY TEAM\nBuilding and maintaining chapter website & Marketing or events through our website and MA application',
        commitImage: 'assets/images/IT1.jpg',
        commitImage1: 'assets/images/IT.jpg',
        description: ' (Information technology)',
      ),
      CommitItem(
        commitName: 'PR',
        detail:
            'PUBLIC RELATION TEAM\nManage our chapter relations with Companies and Potential Sponsors Provide our chapter trainings, sessions, courses and field trips. Provide speakers and is responsible for mega events.',
        commitImage: 'assets/images/BR1.jpg',
        commitImage1: 'assets/images/BR.jpg',
        description: '(Public Relation)',
      ),
      CommitItem(
        commitName: 'HR',
        detail:
            'HUMAN RESOURCE MANAGEMENT\nHuman Resources Management is defined as the management of the workforce of members in the different committees of the chapter. It is specialized in attracting members, selecting them, conducting work interviews, training, evaluating and rewarding them, and ensuring compliance with the labor laws set by the chapter\'s leaders.\n\nHUMAN RESOURCE DEVELOPMENT\nMeet members’ need through sessions and workshops. Make competitions among members. create effective development program for all members.',
        commitImage: 'assets/images/HR1.jpg',
        commitImage1: 'assets/images/HR.jpg',
        description: '(Human Resource)',
      ),
      CommitItem(
        commitName: 'Marketing',
        detail:
            'MARKETING \nAny new event the marketing committee is the one who make the propaganda for it and it is divided into:\n\nSOCIAL MEDIA TEAM\nManage and develop our social media accounts and create their content.Online marketing for our projects and events\n\nMULTI MEDIA TEAM\nDesign for chapter\'s events and facebook pages Creating videos for marketing our products\n\nVOICE OVER TEAM\nPresenting the events and performing voice over for the videos posted on the pages of the chapter',
        commitImage: 'assets/images/Marketing1.jpg',
        commitImage1: 'assets/images/Marketing.jpg',
      ),
      CommitItem(
        commitName: 'OC',
        detail:
            'OPERATION TEAM\nPlanning for chapter events and implementing them. Preparing for outings, fun days, and sports events. Evaluating events and take attendees feedbacks.Creating a database for all halls at faculty, centers, and suppliers of',
        commitImage: 'assets/images/OC-11.jpg',
        commitImage1: 'assets/images/OC-1.jpg',
        description: '(Operation)',
      ),
      CommitItem(
        commitName: 'Technical',
        detail:
            'TECHNICAL TEAM \nAchieving real technical support for students to achieve academic excellence Providing technical articles and reports for publicity. Provide members metallurgy references',
        commitImage: 'assets/images/Technical1.jpg',
        commitImage1: 'assets/images/Technical.jpg',
      ),
    ];
    Widget commitItem({required CommitItem commitItem}) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MyCustomRoute(
                  builder: (context) => CommitteeDetail(
                        commitItem: commitItem,
                      )));
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Image.asset(
                commitItem.commitImage1,
                height: 120.h,
                width: 200.w,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              height: 120.h,
              width: 200.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    const Color(0xff475DEB).withOpacity(0.5),
                    const Color(0xffE11A1A).withOpacity(0.5),
                  ], //// red to yellow
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  commitItem.commitName,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                if (commitItem.description != null)
                  Text(
                    commitItem.description ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ],
        ),
      );
    }

    var gmailController = TextEditingController();
    gmailController.text = 'materialadvantagesu@gmail.com';
    var cubit = LayOutCubit.get(context);
    return BlocConsumer<LayOutCubit, LayOutStates>(
      listener: (context, state) => {},
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: ConditionalBuilder(
          condition: cubit.teamItem != null,
          fallback: (context) => Stack(
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
              loading(),
            ],
          ),
          builder: (context) => Stack(
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
              CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    elevation: 0.0,
                    snap: false,
                    pinned: true,
                    floating: false,
                    systemOverlayStyle: isShrink
                        ? SystemUiOverlayStyle.dark
                        : SystemUiOverlayStyle.light,
                    leading: !isShrink
                        ? IconButton(
                            onPressed: () {
                              showOption(context);
                            },
                            icon: Icon(
                              Iconsax.menu_1,
                              size: 30,
                              color: isShrink
                                  ? Colors.black.withOpacity(0.0)
                                  : Colors.white,
                            ),
                          )
                        : null,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      background: Image.asset(
                        'assets/images/aerial-view-business-team.jpg',
                        fit: BoxFit.cover,
                      ),
                      titlePadding:
                          EdgeInsetsDirectional.only(start: 10.w, bottom: 10.w),
                      title: isShrink
                          ? null
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'MASUSC',
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  cubit.slogan ?? '',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: isShrink
                                        ? Colors.black
                                        : Colors.grey[300],
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ],
                            ),
                    ),
                    backgroundColor: Colors.white.withOpacity(0.0),
                    expandedHeight: MediaQuery.of(context).size.height / 3.5,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MyCustomRoute(
                                                builder: (context) =>
                                                    PriceScreen(
                                                      title:
                                                          'Chapter of excellence',
                                                      prices: (cubit.chapter)!,
                                                    )));
                                      },
                                      child: Container(
                                        height: 110.h,
                                        decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                'assets/images/Star.png',
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text(
                                                'Chapter of excellence',
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 15.sp,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
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
                                                    PriceScreen(
                                                      title:
                                                          'Outstanding chapter',
                                                      prices: (cubit.out)!,
                                                    )));
                                      },
                                      child: Container(
                                        height: 110.h,
                                        decoration: BoxDecoration(
                                          color: Colors.deepPurpleAccent,
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                'assets/images/Heart.png',
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text(
                                                'Outstanding chapter',
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 15.sp,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.fromLTRB(15, 30, 15, 30),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2.r,
                                      blurRadius: 4.r,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Don't Worry About Studying",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            "we've got your back and all the materials you need to study material science.",
                                            style: TextStyle(height: 1.5.h),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MyCustomRoute(
                                                      builder: (context) =>
                                                          const ChooseTermScreen()));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff6C63FF),
                                              shadowColor:
                                                  const Color(0xff6C63FF),
                                              elevation: 5,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w,
                                                  vertical: 10.h),
                                            ),
                                            child: const Text(
                                              "Get Material",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child: Image.asset(
                                            "assets/images/blogging.png"))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "read on our blog".toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    InkWell(
                                      child: Row(
                                        children: [
                                          Text(
                                            "Read More",
                                            style: TextStyle(
                                                color: const Color(0xff6C63FF),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: const Color(0xff6C63FF),
                                            size: 15.sp,
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        LayOutCubit.get(context)
                                            .changeBottomNavBar(3, context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 220.h,
                                width: double.infinity,
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MyCustomRoute(
                                                builder: (context) =>
                                                    BlogDetail(
                                                      data: cubit.blogItem!
                                                          .data![index],
                                                    )));
                                      },
                                      child: Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0.r),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          borderOnForeground: true,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0.w,
                                                vertical: 8.h),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                  ),
                                                  child: CachedNetworkImage(
                                                    placeholder:
                                                        (context, string) =>
                                                            Shimmer.fromColors(
                                                      baseColor: Colors.grey,
                                                      highlightColor:
                                                          Colors.grey[700]!,
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.2,
                                                        height: 100.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                        ),
                                                      ),
                                                    ),
                                                    imageUrl:
                                                        'http://${cubit.blogItem!.data![index].image!}',
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.2,
                                                    height: 100.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.2,
                                                  child: Text(
                                                    cubit.blogItem!.data![index]
                                                        .title!,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.sp,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontFamily: 'Montserrat',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.2,
                                                  child: Text(
                                                    cubit.blogItem!.data![index]
                                                        .brief!,
                                                    maxLines: 2,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13.sp,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontFamily: 'Montserrat',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: 10.w,
                                    );
                                  },
                                  itemCount: 3,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "MASUSC Events".toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    InkWell(
                                      child: Row(
                                        children: [
                                          Text(
                                            "View More",
                                            style: TextStyle(
                                                color: const Color(0xff6C63FF),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: const Color(0xff6C63FF),
                                            size: 15.sp,
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        LayOutCubit.get(context)
                                            .changeBottomNavBar(1, context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              ListView.separated(
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MyCustomRoute(
                                              builder: (context) => EventDetail(
                                                    data: cubit.eventItem!
                                                        .data![index],
                                                  )));
                                    },
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0.r),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      borderOnForeground: true,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0.w, vertical: 8.h),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'http://${cubit.eventItem!.data![index].image!}',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                placeholder:
                                                    (context, string) =>
                                                        Shimmer.fromColors(
                                                  baseColor: Colors.grey,
                                                  highlightColor:
                                                      Colors.grey[700]!,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3,
                                                    height: 100.h,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                height: 100.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8.h,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.2,
                                                  child: Text(
                                                    cubit.eventItem!
                                                        .data![index].title!,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.sp,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontFamily: 'Montserrat',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.2,
                                                  child: Text(
                                                    cubit.eventItem!
                                                        .data![index].brief!,
                                                    maxLines: 2,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13.sp,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontFamily: 'Montserrat',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Icon(
                                                      Iconsax.location,
                                                      size: 15.sp,
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Text(
                                                      cubit
                                                          .eventItem!
                                                          .data![index]
                                                          .location!,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10.sp,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontFamily:
                                                            'Montserrat',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 10.w,
                                  );
                                },
                                itemCount: 3,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Chapter Committees",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 130.h,
                                width: double.infinity,
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return commitItem(
                                        commitItem: commitItems[index]);
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: 10.w,
                                    );
                                  },
                                  itemCount: commitItems.length,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SocialIcon(
                                      iconSize: 30.sp,
                                      name: Platform.meta,
                                      link:
                                          'https://www.facebook.com/masuscpage?mibextid=ZbWKwL',
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    SocialIcon(
                                      iconSize: 30.sp,
                                      name: Platform.instagram,
                                      link:
                                          'https://instagram.com/masuscpage?igshid=OGQ5ZDc2ODk2ZA==',
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    SocialIcon(
                                      iconSize: 30.sp,
                                      name: Platform.youtube,
                                      link:
                                          'https://youtube.com/@masuscpage?si=qRy5wdYiADO83I7_',
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    SocialIcon(
                                      iconSize: 30.sp,
                                      name: Platform.linkedin,
                                      link:
                                          'https://www.linkedin.com/company/masuscpage/',
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    SocialIcon(
                                      iconSize: 30.sp,
                                      name: Platform.twitter,
                                      link:
                                          'https://x.com/masuscpage?t=bcqE4L2WKxbvtPf_FjcogA&s=09',
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Link(
                                      builder: (context, followLink) => InkWell(
                                        onTap: followLink,
                                        child: Image.asset(
                                          'assets/images/web.png',
                                          height: 30,
                                          width: 30,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      uri: Uri.parse('https://www.masusc.com/'),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Gmail',
                                style: TextStyle(
                                  fontSize: 18.0.sp,
                                  fontFamily: 'Montserrat',
                                  color: HexColor('ca0000'),
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
                                  readOnly: true,
                                  cursorColor: HexColor('cb0000'),
                                  controller: gmailController,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.sp,
                                        color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: Colors.black,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                            ],
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
