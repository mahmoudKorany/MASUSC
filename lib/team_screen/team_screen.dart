import 'dart:math' show pi;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:masusc/home/cubit/cubit.dart';
import 'package:masusc/home/cubit/states.dart';
import 'package:masusc/models/team_model.dart';
import 'package:masusc/shared/shared_component/component.dart';
import 'package:masusc/team_screen/show_profile_detail.dart';
import 'package:shimmer/shimmer.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayOutCubit,LayOutStates>(
      listener: (context,state){},
      builder:(context,state) {
        var cubit = LayOutCubit.get(context);
        List<Data> presidency = [];
        List<Data> highBoard  = [];
        List<Data> board = [];
        if(cubit.teamItem != null)
        {
          for(int x=0;x<cubit.teamItem!.data!.length;x++)
          {
            if(cubit.teamItem!.data![x].committee =="Presidency")
            {
              presidency.add(cubit.teamItem!.data![x]);
            }else if(cubit.teamItem!.data![x].position =="manager")
            {
              highBoard.add(cubit.teamItem!.data![x]);
            }else
            {
              board.add(cubit.teamItem!.data![x]);
            }
          }
        }
        return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'Our Team',
            style: TextStyle(
              color: HexColor('ca0000'),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              IconBroken.Arrow___Left_2,
              color: HexColor('ca0000'),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Stack(
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
              ],
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConditionalBuilder(
                condition: LayOutCubit.get(context).teamItem != null,
                fallback:(context)=> Padding(
                  padding:EdgeInsets.only(top: MediaQuery.of(context).size.height/2.4),
                  child: loading(),
                ),
                builder:(context)=> Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width / 3,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          'Presidency',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GridView.builder(
                      primary: false,
                      padding: const EdgeInsets.all(5),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,

                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index)
                      {
                        return Card(
                          elevation: 50,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r),),
                          clipBehavior:
                          Clip.antiAlias,
                          borderOnForeground: true,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Hero(
                                  tag: '${presidency[index].image}',
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black54, //New
                                            blurRadius: 25.0,
                                            offset: Offset(0,10))
                                      ],
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      height: 130.h,
                                      width: MediaQuery.of(context).size.width / 2.9,
                                      imageUrl: 'http://${presidency[index].image}',
                                      placeholder: (context, string) => Shimmer.fromColors(
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
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(
                                    '${presidency[index].name}',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow : TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        const BoxShadow(
                                            color: Colors.black54, //New
                                            blurRadius: 25.0,
                                            offset: Offset(0,10))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h,),
                                Text(
                                  '${presidency[index].position}',
                                  textAlign: TextAlign.center,
                                  style:  GoogleFonts.montserrat(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                    shadows: [
                                      const BoxShadow(
                                          color: Colors.black54, //New
                                          blurRadius: 25.0,
                                          offset: Offset(0,10))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                GestureDetector(
                                  onTap: ()
                                  {
                                    navigateTo(context: context, widget: ProfileTeamScreen(date: presidency[index],fromOther: false,),);
                                  },
                                  child: Container(
                                    width: 140.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: HexColor('ca0000'),
                                        boxShadow: const [
                                        BoxShadow(
                                        color: Colors.black54, //New
                                        blurRadius: 10.0,
                                        offset: Offset(0,10))
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'show profile',
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount:presidency.length,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50.h,
                        width: MediaQuery.of(context).size.width /2.8,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            'High Board',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GridView.builder(
                      primary: false,
                      padding: const EdgeInsets.all(5),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,

                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index2)
                      {
                        return Card(
                          elevation: 50,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r),),
                          clipBehavior:
                          Clip.antiAlias,
                          borderOnForeground: true,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Hero(
                                  tag: '${highBoard[index2].image}',
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black54, //New
                                            blurRadius: 25.0,
                                            offset: Offset(0,10))
                                      ],
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      height: 130.h,
                                      width: MediaQuery.of(context).size.width / 2.9,
                                      imageUrl: 'http://${highBoard[index2].image}',
                                      placeholder: (context, string) => Shimmer.fromColors(
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
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(
                                    '${highBoard[index2].name}',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow : TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        const BoxShadow(
                                            color: Colors.black54, //New
                                            blurRadius: 25.0,
                                            offset: Offset(0,10))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h,),
                                Text(
                                  '${highBoard[index2].committee}',
                                  textAlign: TextAlign.center,
                                  style:  GoogleFonts.montserrat(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                    shadows: [
                                      const BoxShadow(
                                          color: Colors.black54, //New
                                          blurRadius: 25.0,
                                          offset: Offset(0,10))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                GestureDetector(
                                  onTap: ()
                                  {
                                    navigateTo(context: context, widget: ProfileTeamScreen(date: highBoard[index2],fromOther: true,),);
                                  },
                                  child: Container(
                                    width: 140.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: HexColor('ca0000'),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black54, //New
                                            blurRadius: 10.0,
                                            offset: Offset(0,10))
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'show profile',
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount:highBoard.length,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50.h,
                        width: MediaQuery.of(context).size.width / 3.5,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            'Board',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GridView.builder(
                      primary: false,
                      padding: const EdgeInsets.all(5),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,

                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index1)
                      {
                        return Card(
                          elevation: 50,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r),),
                          clipBehavior:
                          Clip.antiAlias,
                          borderOnForeground: true,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Hero(
                                  tag: '${board[index1].image}',
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black54, //New
                                            blurRadius: 25.0,
                                            offset: Offset(0,10))
                                      ],
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      height: 130.h,
                                      width: MediaQuery.of(context).size.width / 2.9,
                                      imageUrl: 'http://${board[index1].image}',
                                      placeholder: (context, string) => Shimmer.fromColors(
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
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(
                                    '${board[index1].name}',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow : TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        const BoxShadow(
                                            color: Colors.black54, //New
                                            blurRadius: 25.0,
                                            offset: Offset(0,10))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h,),
                                Text(
                                  '${board[index1].committee}',
                                  textAlign: TextAlign.center,
                                  style:  GoogleFonts.montserrat(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                    shadows: [
                                      const BoxShadow(
                                          color: Colors.black54, //New
                                          blurRadius: 25.0,
                                          offset: Offset(0,10))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                GestureDetector(
                                  onTap: ()
                                  {
                                    navigateTo(context: context, widget: ProfileTeamScreen(date: board[index1],fromOther: true,));
                                  },
                                  child: Container(
                                    width: 140.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: HexColor('ca0000'),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black54, //New
                                            blurRadius: 10.0,
                                            offset: Offset(0,10))
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'show profile',
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount:board.length,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
      },
    );
  }
}
