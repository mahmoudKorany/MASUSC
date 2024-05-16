
import 'dart:math' show pi;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masusc/price_screen/show_prize_image.dart';
import 'package:masusc/shared/shared_component/component.dart';
import 'package:shimmer/shimmer.dart';

class AppTeam extends StatelessWidget {
  const AppTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            size: 30,
            color: HexColor('c50000'),
          ),
        ),
        title: Text(
          'Application Team',
          style: TextStyle(
            color: HexColor('c50000'),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Supervisor',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0.r),
                              ),
                              clipBehavior: Clip.antiAlias,
                              borderOnForeground: true,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0.w, vertical: 8.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MyCustomRoute(
                                            builder: (context) =>
                                                const ShowPrizeScreen(
                                              image:
                                                  'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/photo_2024-02-25_11-39-28.jpg?alt=media&token=b71483d5-f619-4765-b2a0-a5bdd340699d',
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/photo_2024-02-25_11-39-28.jpg?alt=media&token=b71483d5-f619-4765-b2a0-a5bdd340699d',
                                          placeholder: (context, string) =>
                                              Shimmer.fromColors(
                                            baseColor: Colors.grey,
                                            highlightColor: Colors.grey[700]!,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0.r),
                                              ),
                                            ),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          height: 270.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      'Osama Ebrahim',
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Iconsax.information,
                                          size: 20.sp,
                                          color: HexColor('0438a1'),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.65,
                                          child: Text(
                                            'Graphic designer (Photoshop, Illustrator, Indesign)',
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: HexColor('0438a1'),
                                              fontSize: 13.sp,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          IconBroken.Call,
                                          size: 20.sp,
                                          color: HexColor('ca0000'),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          '01146319465',
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Designed And Programmed By :',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0.r),
                              ),
                              clipBehavior: Clip.antiAlias,
                              borderOnForeground: true,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0.w, vertical: 8.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MyCustomRoute(
                                                builder: (context) =>
                                                    const ShowPrizeScreen(
                                                        image:
                                                            'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/photo_2024-02-25_11-38-48.jpg?alt=media&token=4d4a16d1-4ec7-4d01-bcdd-85d882058c73')));
                                      },
                                      child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/photo_2024-02-25_11-38-48.jpg?alt=media&token=4d4a16d1-4ec7-4d01-bcdd-85d882058c73',
                                          placeholder: (context, string) =>
                                              Shimmer.fromColors(
                                            baseColor: Colors.grey,
                                            highlightColor: Colors.grey[700]!,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0.r),
                                              ),
                                            ),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          height: 270.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      'Mahmoud Mohamed',
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Iconsax.information,
                                          size: 20.sp,
                                          color: HexColor('0438a1'),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.65,
                                          child: Text(
                                            'Flutter And Mobile Application Developer',
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: HexColor('0438a1'),
                                              fontSize: 13.sp,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          IconBroken.Call,
                                          size: 20.sp,
                                          color: HexColor('ca0000'),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          '01090677934',
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'API Creators :',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children:
                              [
                                Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0.r),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    borderOnForeground: true,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0.w, vertical: 8.h),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MyCustomRoute(
                                                      builder: (context) =>
                                                      const ShowPrizeScreen(
                                                          image:
                                                          'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/photo_2024-02-25_11-37-30.jpg?alt=media&token=8277fd53-a680-4fcd-8ea3-df76142255d6')));
                                            },
                                            child: Container(
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10.r),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/photo_2024-02-25_11-37-30.jpg?alt=media&token=8277fd53-a680-4fcd-8ea3-df76142255d6',
                                                placeholder: (context, string) =>
                                                    Shimmer.fromColors(
                                                      baseColor: Colors.grey,
                                                      highlightColor: Colors.grey[700]!,
                                                      child: Container(
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                            1.5,
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10.0.r),
                                                        ),
                                                      ),
                                                    ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    1.5,
                                                height: 270.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Text(
                                            'Ahmed Gomaa',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Iconsax.information,
                                                size: 20.sp,
                                                color: HexColor('0438a1'),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    1.65,
                                                child: Text(
                                                  'Backend php laravel developer with 7 years freelancing experience',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: HexColor('0438a1'),
                                                    fontSize: 13.sp,
                                                    overflow: TextOverflow.ellipsis,
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                IconBroken.Call,
                                                size: 20.sp,
                                                color: HexColor('ca0000'),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                '01001659186',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0.r),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    borderOnForeground: true,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0.w, vertical: 8.h),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MyCustomRoute(
                                                      builder: (context) =>
                                                      const ShowPrizeScreen(
                                                          image:
                                                          'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/photo_2024-02-25_11-38-33.jpg?alt=media&token=33238cd6-bb83-4044-8655-39e49d61622f')));
                                            },
                                            child: Container(
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10.r),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/photo_2024-02-25_11-38-33.jpg?alt=media&token=33238cd6-bb83-4044-8655-39e49d61622f',
                                                placeholder: (context, string) =>
                                                    Shimmer.fromColors(
                                                      baseColor: Colors.grey,
                                                      highlightColor: Colors.grey[700]!,
                                                      child: Container(
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                            1.5,
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10.0.r),
                                                        ),
                                                      ),
                                                    ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    1.5,
                                                height: 270.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Text(
                                            'Ahmed ELshaar',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Iconsax.information,
                                                size: 20.sp,
                                                color: HexColor('0438a1'),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    1.65,
                                                child: Text(
                                                  'Backend Developer',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: HexColor('0438a1'),
                                                    fontSize: 13.sp,
                                                    overflow: TextOverflow.ellipsis,
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                IconBroken.Call,
                                                size: 20.sp,
                                                color: HexColor('ca0000'),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                '01222988691',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0.r),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    borderOnForeground: true,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0.w, vertical: 8.h),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MyCustomRoute(
                                                      builder: (context) =>
                                                      const ShowPrizeScreen(
                                                          image:
                                                          'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/Screenshot_%D9%A2%D9%A0%D9%A2%D9%A4%D9%A0%D9%A2%D9%A2%D9%A4-%D9%A1%D9%A8%D9%A4%D9%A6%D9%A4%D9%A7.jpg?alt=media&token=d2ccfff3-6234-4620-b511-6fb30341a4c2')));
                                            },
                                            child: Container(
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10.r),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/Screenshot_%D9%A2%D9%A0%D9%A2%D9%A4%D9%A0%D9%A2%D9%A2%D9%A4-%D9%A1%D9%A8%D9%A4%D9%A6%D9%A4%D9%A7.jpg?alt=media&token=d2ccfff3-6234-4620-b511-6fb30341a4c2',
                                                placeholder: (context, string) =>
                                                    Shimmer.fromColors(
                                                      baseColor: Colors.grey,
                                                      highlightColor: Colors.grey[700]!,
                                                      child: Container(
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                            1.5,
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10.0.r),
                                                        ),
                                                      ),
                                                    ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    1.5,
                                                height: 270.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Text(
                                            'Amr Ahmed',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Iconsax.information,
                                                size: 20.sp,
                                                color: HexColor('0438a1'),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    1.65,
                                                child: Text(
                                                  'Web Developer and UX/UI Designer',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: HexColor('0438a1'),
                                                    fontSize: 13.sp,
                                                    overflow: TextOverflow.ellipsis,
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                IconBroken.Call,
                                                size: 20.sp,
                                                color: HexColor('ca0000'),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                '01033677906',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Data',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children:
                              [
                                Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0.r),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    borderOnForeground: true,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0.w, vertical: 8.h),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MyCustomRoute(
                                                      builder: (context) =>
                                                      const ShowPrizeScreen(
                                                          image:
                                                          'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/photo_2024-02-25_11-35-27.jpg?alt=media&token=71a08fe4-0e23-43b6-bd0d-f69bd4fa294b')));
                                            },
                                            child: Container(
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10.r),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/photo_2024-02-25_11-35-27.jpg?alt=media&token=71a08fe4-0e23-43b6-bd0d-f69bd4fa294b',
                                                placeholder: (context, string) =>
                                                    Shimmer.fromColors(
                                                      baseColor: Colors.grey,
                                                      highlightColor: Colors.grey[700]!,
                                                      child: Container(
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                            1.5,
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10.0.r),
                                                        ),
                                                      ),
                                                    ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    1.5,
                                                height: 270.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Text(
                                            'Mohamed Amr',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Iconsax.information,
                                                size: 20.sp,
                                                color: HexColor('0438a1'),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    1.65,
                                                child: Text(
                                                  'Data reviewer',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: HexColor('0438a1'),
                                                    fontSize: 13.sp,
                                                    overflow: TextOverflow.ellipsis,
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                IconBroken.Call,
                                                size: 20.sp,
                                                color: HexColor('ca0000'),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                '01096915567',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0.r),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    borderOnForeground: true,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0.w, vertical: 8.h),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MyCustomRoute(
                                                      builder: (context) =>
                                                      const ShowPrizeScreen(
                                                          image:
                                                          'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/IMG_20231215_144318_859.jpg?alt=media&token=21c5b1c2-6b7e-4028-969a-074b9df83457')));
                                            },
                                            child: Container(
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10.r),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                'https://firebasestorage.googleapis.com/v0/b/masusc-bd020.appspot.com/o/IMG_20231215_144318_859.jpg?alt=media&token=21c5b1c2-6b7e-4028-969a-074b9df83457',
                                                placeholder: (context, string) =>
                                                    Shimmer.fromColors(
                                                      baseColor: Colors.grey,
                                                      highlightColor: Colors.grey[700]!,
                                                      child: Container(
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                            1.5,
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10.0.r),
                                                        ),
                                                      ),
                                                    ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    1.5,
                                                height: 270.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Text(
                                            'Omar ELbarbary',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Iconsax.information,
                                                size: 20.sp,
                                                color: HexColor('0438a1'),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    1.65,
                                                child: Text(
                                                  'Data reviewer',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: HexColor('0438a1'),
                                                    fontSize: 13.sp,
                                                    overflow: TextOverflow.ellipsis,
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                IconBroken.Call,
                                                size: 20.sp,
                                                color: HexColor('ca0000'),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                '01024192178',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
