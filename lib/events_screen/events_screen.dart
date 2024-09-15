import 'dart:math' show pi;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masusc/events_screen/event_details.dart';
import 'package:masusc/home/cubit/cubit.dart';
import 'package:masusc/home/cubit/states.dart';
import 'package:masusc/models/event_model.dart';
import 'package:masusc/shared/shared_component/component.dart';
import 'package:shimmer/shimmer.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayOutCubit, LayOutStates>(
        builder: (context, state) {
          var cubit = LayOutCubit.get(context);
          List<Data> technicalEvent = [];
          List<Data> nonTechnicalEvent = [];
         if(cubit.eventItem != null){
           for(int x=0;x<cubit.eventItem!.data!.length;x++)
           {
             if(cubit.eventItem!.data![x].type == "0")
             {
               technicalEvent.add(cubit.eventItem!.data![x]);
             }else
             {
               nonTechnicalEvent.add(cubit.eventItem!.data![x]);
             }
           }
         }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white.withOpacity(0.0),
              elevation: 0.0,
              title: Text(
                'Events',
                style: TextStyle(
                  color: HexColor('ca0000'),
                  fontSize: 23.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottom: TabBar(
                indicatorColor: HexColor('ca0000'),
                splashBorderRadius: BorderRadius.circular(20),
                controller: _tabController,
                tabs: [
                  Text(
                    'All Events',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0.sp,
                    ),
                  ),
                  Text(
                    'Technical Events',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0.sp,
                    ),
                  ),
                  Text(
                    'Non Technical Events',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0.sp,
                    ),
                  ),
                ],
              ),
            ),
            body: ConditionalBuilder(
              condition: cubit.eventItem != null,
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
                  TabBarView(
                    controller: _tabController,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index1) {
                              return Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0.r),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cubit.eventItem!.data![index1]
                                            .category!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          navigateTo(context: context, widget:   EventDetail(
                                              data: cubit.eventItem!.data![
                                              index1]),);
                                        },
                                        child: Card(
                                            elevation: 5,
                                            shape:
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  18.0.r),
                                            ),
                                            clipBehavior:
                                            Clip.antiAlias,
                                            borderOnForeground: true,
                                            child: Padding(
                                              padding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 8.0.w,
                                                  vertical: 8.h),
                                              child: Column(
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Container(
                                                    clipBehavior:
                                                    Clip.antiAlias,
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          10.r),
                                                    ),
                                                    child:
                                                    CachedNetworkImage(
                                                      imageUrl:
                                                      'http://${cubit.eventItem!.data![index1].image!}',
                                                      placeholder: (context,
                                                          string) =>
                                                          Shimmer
                                                              .fromColors(
                                                            baseColor:
                                                            Colors.grey,
                                                            highlightColor:
                                                            Colors.grey[
                                                            700]!,
                                                            child:
                                                            Container(
                                                              width: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .width /
                                                                  2.2,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Colors
                                                                    .grey,
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    10.0.r),
                                                              ),
                                                            ),
                                                          ),
                                                      width: MediaQuery.of(
                                                          context)
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
                                                    width: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .width /
                                                        2.2,
                                                    child: Text(
                                                      cubit.eventItem!.data![index1]
                                                          .title!,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .black,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        fontSize: 14.sp,
                                                        overflow:
                                                        TextOverflow
                                                            .ellipsis,
                                                        fontFamily:
                                                        'Montserrat',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .end,
                                                    children: [
                                                      Icon(
                                                        Iconsax
                                                            .location,
                                                        size: 17.sp,
                                                        color: HexColor(
                                                            '0438a1'),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                            context)
                                                            .size
                                                            .width /
                                                            2.4,
                                                        child: Text(
                                                          cubit.eventItem!.data![index1]
                                                              .location!,
                                                          maxLines: 1,
                                                          style:
                                                          TextStyle(
                                                            color: HexColor(
                                                                '0438a1'),
                                                            fontSize:
                                                            13.sp,
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            fontFamily:
                                                            'Montserrat',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .end,
                                                    children: [
                                                      Icon(
                                                        Iconsax.play,
                                                        size: 15.sp,
                                                        color: HexColor(
                                                            'ca0000'),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text(
                                                        cubit.eventItem!.data![index1]
                                                            .date!,
                                                        maxLines: 1,
                                                        style:
                                                        TextStyle(
                                                          color: Colors
                                                              .grey[
                                                          800],
                                                          fontSize:
                                                          13.sp,
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.h,
                              );
                            },
                            itemCount: cubit.eventItem!.data!.length),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index1) {
                              return Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0.r),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        technicalEvent[index1]
                                            .category!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                        navigateTo(context: context, widget:  EventDetail(
                                            data: technicalEvent[
                                            index1]),);
                                        },
                                        child: Card(
                                            elevation: 5,
                                            shape:
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  18.0.r),
                                            ),
                                            clipBehavior:
                                            Clip.antiAlias,
                                            borderOnForeground: true,
                                            child: Padding(
                                              padding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 8.0.w,
                                                  vertical: 8.h),
                                              child: Column(
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Container(
                                                    clipBehavior:
                                                    Clip.antiAlias,
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          10.r),
                                                    ),
                                                    child:
                                                    CachedNetworkImage(
                                                      imageUrl:
                                                      'http://${technicalEvent[index1].image!}',
                                                      placeholder: (context,
                                                          string) =>
                                                          Shimmer
                                                              .fromColors(
                                                            baseColor:
                                                            Colors.grey,
                                                            highlightColor:
                                                            Colors.grey[
                                                            700]!,
                                                            child:
                                                            Container(
                                                              width: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .width /
                                                                  2.2,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Colors
                                                                    .grey,
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    10.0.r),
                                                              ),
                                                            ),
                                                          ),
                                                      width: MediaQuery.of(
                                                          context)
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
                                                    width: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .width /
                                                        2.2,
                                                    child: Text(
                                                      technicalEvent[index1]
                                                          .title!,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .black,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        fontSize: 14.sp,
                                                        overflow:
                                                        TextOverflow
                                                            .ellipsis,
                                                        fontFamily:
                                                        'Montserrat',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .end,
                                                    children: [
                                                      Icon(
                                                        Iconsax
                                                            .location,
                                                        size: 17.sp,
                                                        color: HexColor(
                                                            '0438a1'),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                            context)
                                                            .size
                                                            .width /
                                                            2.4,
                                                        child: Text(
                                                          technicalEvent[index1]
                                                              .location!,
                                                          maxLines: 1,
                                                          style:
                                                          TextStyle(
                                                            color: HexColor(
                                                                '0438a1'),
                                                            fontSize:
                                                            13.sp,
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            fontFamily:
                                                            'Montserrat',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .end,
                                                    children: [
                                                      Icon(
                                                        Iconsax.play,
                                                        size: 15.sp,
                                                        color: HexColor(
                                                            'ca0000'),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text(
                                                        technicalEvent[index1]
                                                            .date!,
                                                        maxLines: 1,
                                                        style:
                                                        TextStyle(
                                                          color: Colors
                                                              .grey[
                                                          800],
                                                          fontSize:
                                                          13.sp,
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.h,
                              );
                            },
                            itemCount: technicalEvent.length),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index1) {
                              return Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0.r),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        nonTechnicalEvent[index1]
                                            .category!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                        navigateTo(context: context, widget: EventDetail(
                                            data: nonTechnicalEvent[
                                            index1]));
                                        },
                                        child: Card(
                                            elevation: 5,
                                            shape:
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  18.0.r),
                                            ),
                                            clipBehavior:
                                            Clip.antiAlias,
                                            borderOnForeground: true,
                                            child: Padding(
                                              padding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 8.0.w,
                                                  vertical: 8.h),
                                              child: Column(
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Container(
                                                    clipBehavior:
                                                    Clip.antiAlias,
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          10.r),
                                                    ),
                                                    child:
                                                    CachedNetworkImage(
                                                      imageUrl:
                                                      'http://${nonTechnicalEvent[index1].image!}',
                                                      placeholder: (context,
                                                          string) =>
                                                          Shimmer
                                                              .fromColors(
                                                            baseColor:
                                                            Colors.grey,
                                                            highlightColor:
                                                            Colors.grey[
                                                            700]!,
                                                            child:
                                                            Container(
                                                              width: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .width /
                                                                  2.2,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Colors
                                                                    .grey,
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    10.0.r),
                                                              ),
                                                            ),
                                                          ),
                                                      width: MediaQuery.of(
                                                          context)
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
                                                    width: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .width /
                                                        2.2,
                                                    child: Text(
                                                      nonTechnicalEvent[index1]
                                                          .title!,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .black,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        fontSize: 14.sp,
                                                        overflow:
                                                        TextOverflow
                                                            .ellipsis,
                                                        fontFamily:
                                                        'Montserrat',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .end,
                                                    children: [
                                                      Icon(
                                                        Iconsax
                                                            .location,
                                                        size: 17.sp,
                                                        color: HexColor(
                                                            '0438a1'),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                            context)
                                                            .size
                                                            .width /
                                                            2.4,
                                                        child: Text(
                                                          nonTechnicalEvent[index1]
                                                              .location!,
                                                          maxLines: 1,
                                                          style:
                                                          TextStyle(
                                                            color: HexColor(
                                                                '0438a1'),
                                                            fontSize:
                                                            13.sp,
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            fontFamily:
                                                            'Montserrat',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .end,
                                                    children: [
                                                      Icon(
                                                        Iconsax.play,
                                                        size: 15.sp,
                                                        color: HexColor(
                                                            'ca0000'),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text(
                                                        nonTechnicalEvent[index1]
                                                            .date!,
                                                        maxLines: 1,
                                                        style:
                                                        TextStyle(
                                                          color: Colors
                                                              .grey[
                                                          800],
                                                          fontSize:
                                                          13.sp,
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.h,
                              );
                            },
                            itemCount: nonTechnicalEvent.length),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
