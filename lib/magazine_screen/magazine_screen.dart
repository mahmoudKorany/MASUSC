import 'dart:math' show pi;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masusc/home/cubit/cubit.dart';
import 'package:masusc/home/cubit/states.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/link.dart';

import '../shared/shared_component/component.dart';

class MagazineScreen extends StatefulWidget {
  const MagazineScreen({super.key});

  @override
  State<MagazineScreen> createState() => _MagazineScreenState();
}

class _MagazineScreenState extends State<MagazineScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayOutCubit,LayOutStates>(
      listener: (context,state) {},
      builder:(context,state) {
        return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0.0,
          title: Text(
            'Magazine',
            style: TextStyle(
              color: HexColor('ca0000'),
              fontSize: 23.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ConditionalBuilder(
          condition: LayOutCubit.get(context).magazineItem != null,
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
          builder:(context)=> Stack(
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
                padding: EdgeInsets.all(8.0.r),
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Card(
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: MediaQuery.of(context).size.height/3.5,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10.r),
                                ),
                                child: CachedNetworkImage(
                                  placeholder: (context, string) => Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.grey[700]!,
                                    child: Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width/1.1,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  imageUrl:'http://${LayOutCubit.get(context).magazineItem!.data![index].image!}',
                                  width: MediaQuery.of(context)
                                      .size
                                      .width/1.1,
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
                                  LayOutCubit.get(context).magazineItem!.data![index].name!,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
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
                                width: MediaQuery.of(context).size.width/1.2,
                                height: MediaQuery.of(context).size.height/12,
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Text(
                                    LayOutCubit.get(context).magazineItem!.data![index].description!,
                                    maxLines: 20,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Link(
                                uri: Uri.parse(LayOutCubit.get(context).magazineItem!.data![index].url!),
                                target: LinkTarget.blank,
                                builder: (builder, followLink) {
                                  return InkWell(
                                    onTap: followLink,
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xff6C63FF), width: 2),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: const Text(
                                        'Read More',
                                        style: TextStyle(
                                            color: Color(0xff6C63FF), fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                    itemCount: LayOutCubit.get(context).magazineItem!.data!.length),
              )
            ],
          ),
        ),
      );
      },
    );
  }
}