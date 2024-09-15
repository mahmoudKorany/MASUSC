import 'dart:math' show pi;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masusc/blog_screen/blog_detail.dart';
import 'package:masusc/home/cubit/cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../shared/shared_component/component.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0.0,
        title: Text(
          'Blog',
          style: TextStyle(
            color: HexColor('ca0000'),
            fontSize: 23.sp,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ConditionalBuilder(
        condition: LayOutCubit.get(context).blogItem != null,
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
              child: SizedBox(
                width : double.infinity,
                child: ListView.separated(
                  itemBuilder: (context, index)
                  {
                    return InkWell(
                      onTap: ()
                      {
                        navigateTo(context: context, widget: BlogDetail(data: LayOutCubit.get(context).blogItem!.data![index],));
                      },
                      child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0.r),
                          ),
                          clipBehavior: Clip.antiAlias,
                          borderOnForeground: true,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 8.h),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: 'http://${LayOutCubit.get(context).blogItem!.data![index].image!}',
                                    placeholder: (context, string) => Shimmer.fromColors(
                                      baseColor: Colors.grey,
                                      highlightColor: Colors.grey[700]!,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width/3,
                                        height: 120.h,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width/3,
                                    height: 120.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/2.2,
                                      child: Text(
                                        LayOutCubit.get(context).blogItem!.data![index].title!,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/2.2,
                                      child: Text(
                                        LayOutCubit.get(context).blogItem!.data![index].brief!,
                                        maxLines: 4,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.sp,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                      ),
                    );
                  },
                  separatorBuilder: (context, index)
                  {
                    return SizedBox(height: 10.w,);
                  },
                  itemCount: LayOutCubit.get(context).blogItem!.data!.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}