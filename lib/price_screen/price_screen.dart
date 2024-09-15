import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:masusc/home/cubit/cubit.dart';
import 'package:masusc/home/cubit/states.dart';
import 'package:masusc/models/pricesModel.dart';
import 'package:masusc/price_screen/show_prize_image.dart';
import 'package:masusc/shared/shared_component/component.dart';

class PriceScreen extends StatelessWidget {
  const PriceScreen({super.key, required this.title, required this.prices});

  final String title;
  final Prices prices;

  @override
  Widget build(BuildContext context) {
    String image;
    Color background;
    List<String> titlePrice = [];
    return BlocConsumer<LayOutCubit, LayOutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (title == 'Chapter of excellence') {
          image = 'assets/images/Star.png';
          background = Colors.deepOrange;
          for (int x = 0;
              x < LayOutCubit.get(context).chapter!.data!.length;
              x++) {
            titlePrice.add(
                '${LayOutCubit.get(context).chapter!.data![x].date} for being once of MA\'s international chapter of excellence');
          }
        } else {
          image = 'assets/images/Heart.png';
          background = Colors.deepPurpleAccent;
          //'2018/2019 for being the most outstanding MA\'s international chapter',
          for (int x = 0; x < LayOutCubit.get(context).out!.data!.length; x++) {
            titlePrice.add(
                '${LayOutCubit.get(context).out!.data![x].date} for being the most outstanding MA\'s international chapter');
          }
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                IconBroken.Arrow___Left_2,
                color: Colors.black,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height - 282,
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Transform.translate(
                    offset: Offset(-380.w, -20.h),
                    child: Container(
                      height: 900.h,
                      width: 900.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height - 280,
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Transform.translate(
                    offset: Offset(-380.w, -20.h),
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
              ),
              Positioned(
                top: MediaQuery.of(context).size.height - 242,
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Transform.translate(
                    offset: Offset(-380.w, -20.h),
                    child: Container(
                      height: 900.h,
                      width: 900.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height - 240,
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Transform.translate(
                    offset: Offset(-380.w, -20.h),
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
              ),
              Positioned(
                top: MediaQuery.of(context).size.height - 200,
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Transform.translate(
                    offset: Offset(-380.w, -20.h),
                    child: Container(
                      height: 900.h,
                      width: 900.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: HexColor('0438a2'),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ),
                ),
              ),
              ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      navigateTo(context: context, widget: ShowPrizeScreen(
                        image:prices.data?[index].image !=null ?'https://${prices.data?[index].image}' :'https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg',
                      ),);
                    },
                    child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0.r),
                        ),
                        color: Colors.white.withOpacity(0.8),
                        clipBehavior: Clip.antiAlias,
                        borderOnForeground: true,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0.w, vertical: 8.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: background,
                                radius: 50.r,
                                child: Center(
                                  child: Image.asset(
                                    image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.2,
                                    child: Text(
                                      title,
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
                                    width:
                                        MediaQuery.of(context).size.width / 2.2,
                                    child: Text(
                                      titlePrice[index],
                                      maxLines: 3,
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
                        )),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.w,
                  );
                },
                itemCount: titlePrice.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
              ),
            ],
          ),
        );
      },
    );
  }
}
