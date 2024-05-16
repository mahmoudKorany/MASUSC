import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:masusc/home/cubit/cubit.dart';
import 'package:masusc/home/cubit/states.dart';
import 'package:masusc/models/team_model.dart';
import 'package:masusc/price_screen/show_prize_image.dart';
import 'package:masusc/shared/shared_component/component.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/link.dart';
import 'package:user_social_profile/user_social_profile.dart';

class ProfileTeamScreen extends StatefulWidget {
  const ProfileTeamScreen({super.key, required this.date,required this.fromOther});

  final Data date;
  final bool fromOther;

  @override
  State<ProfileTeamScreen> createState() => _ProfileTeamScreenState();
}

class _ProfileTeamScreenState extends State<ProfileTeamScreen> {
  var facultyController = TextEditingController();
  var departmentController = TextEditingController();
  var academicYearController = TextEditingController();
  var governorateController = TextEditingController();
  var bioController = TextEditingController();
  var gmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    governorateController.text = widget.date.governorate ?? 'null';
    facultyController.text = widget.date.faculty ?? '';
    departmentController.text = widget.date.department ?? '';
    academicYearController.text = widget.date.academicYear ?? 'null';
    bioController.text = widget.date.bio ?? '';
    gmailController.text = widget.date.gmail ?? '';
    return BlocConsumer<LayOutCubit, LayOutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: HexColor('0438a2'),
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(IconBroken.Arrow___Left_2),
            ),
          ),
          body: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: Stack(
              children: [
                Transform.rotate(
                  angle: pi / 4,
                  child: Transform.translate(
                    offset: Offset(-19.w, -19.h),
                    child: Container(
                      height: 400.h,
                      width: 400.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 4,
                  child: Transform.translate(
                    offset: Offset(-20.w, -20.h),
                    child: Container(
                      height: 400.h,
                      width: 400.w,
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
                  angle: pi / 4,
                  child: Transform.translate(
                    offset: Offset(-59.w, -59.h),
                    child: Container(
                      height: 400.h,
                      width: 400.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 4,
                  child: Transform.translate(
                    offset: Offset(-60.w, -60.h),
                    child: Container(
                      height: 400.h,
                      width: 400.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Transform.rotate(
                      angle: pi / 4,
                      child: Transform.translate(
                        offset: Offset(-100.w, -100.h),
                        child: Container(
                          height: 400.h,
                          width: 400.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: HexColor('0438a2'),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(150),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Hero(
                              tag: '${widget.date.image}',
                              child: Container(
                                height: 160.h,
                                width: 160.w,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54, //New
                                        blurRadius: 25.0,
                                        offset: Offset(0, 30))
                                  ],
                                ),
                                child: CachedNetworkImage(
                                  placeholder: (context, string) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.grey[700]!,
                                    child: Container(
                                      height: 160.h,
                                      width: 160.w,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  imageUrl: 'http://${widget.date.image}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MyCustomRoute(
                                    builder: (context) => ShowPrizeScreen(
                                        image: 'https://${widget.date.image!}'),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: HexColor('cecece'),
                                radius: 25,
                                child: Icon(
                                  IconBroken.Image,
                                  size: 30.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: Text(
                            '${widget.date.name}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 18.sp,
                              shadows: const [
                                BoxShadow(
                                    color: Colors.black54, //New
                                    blurRadius: 25.0,
                                    offset: Offset(0, 10))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: Text(
                            '${widget.fromOther ==true ?widget.date.committee:widget.date.position}',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              shadows: const [
                                BoxShadow(
                                    color: Colors.black54, //New
                                    blurRadius: 25.0,
                                    offset: Offset(0, 10))
                              ],
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 15.w,
                    left: 15.w,
                    top: 300.h,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Faculty',
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
                            cursorColor: HexColor('cb0000'),
                            controller: facultyController,
                            enabled: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.sp,
                                  color: Colors.black),
                              prefixIcon: Icon(
                                Icons.account_balance,
                                color: Colors.black,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Department',
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
                            controller: departmentController,
                            keyboardType: TextInputType.phone,
                            enabled: false,
                            cursorColor: HexColor('cb0000'),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.badge_outlined,
                                color: Colors.black,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Academic Year',
                                  style: TextStyle(
                                    fontSize: 18.0.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('ca0000'),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: TextFormField(
                                    controller: academicYearController,
                                    enabled: false,
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: HexColor('cb0000'),
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.black,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Governorate',
                                    style: TextStyle(
                                      fontSize: 18.0.sp,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('ca0000'),
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
                                      controller: governorateController,
                                      enabled: false,
                                      keyboardType: TextInputType.emailAddress,
                                      cursorColor: HexColor('cb0000'),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.home_outlined,
                                          color: Colors.black,
                                          size: 20.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Bio',
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
                          decoration: BoxDecoration(
                            color: HexColor('cecece'),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: TextFormField(
                            maxLines: null,
                            controller: bioController,
                            enabled: false,
                            keyboardType: TextInputType.text,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.0, color: Colors.grey),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.0, color: Colors.grey),
                              ),
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                IconBroken.Profile,
                              ),
                              helperStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
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
                          height: 20.h,
                        ),
                        if (widget.date.linkedIn != null)
                          Link(
                            uri: Uri.parse(widget.date.linkedIn ?? ''),
                            builder: (context, followLink) => InkWell(
                              onTap: followLink,
                              child: Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: HexColor('2867b2'),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 30.h,
                                        width: 30.w,
                                        child: SocialIcon(
                                          name: Platform.linkedin,
                                          link: widget.date.linkedIn ?? '',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        'Linkedin',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
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
}
