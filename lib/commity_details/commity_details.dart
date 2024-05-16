import 'dart:math' show pi;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:masusc/home/cubit/cubit.dart';
import 'package:masusc/home/cubit/states.dart';
import 'package:masusc/home/home_screen.dart';
import 'package:masusc/models/team_model.dart';
import 'package:masusc/shared/shared_component/component.dart';
import 'package:masusc/team_screen/show_profile_detail.dart';
import 'package:shimmer/shimmer.dart';

class CommitteeDetail extends StatefulWidget {
  const CommitteeDetail({super.key, required this.commitItem});

  final CommitItem commitItem;

  @override
  State<CommitteeDetail> createState() => _CommitteeDetailState();
}

class _CommitteeDetailState extends State<CommitteeDetail> {
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

  @override
  Widget build(BuildContext context) {
    Widget buildItem(Data? item) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Text(
              item?.position!.toUpperCase() ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: Colors.red),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MyCustomRoute(
                  builder: (context) => ProfileTeamScreen(
                    date: item!,
                    fromOther: true,
                  ),
                ),
              );
            },
            child: Hero(
              tag: '${item?.image}',
              child: Container(
                width:120.w,
                height: 120.h,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: CachedNetworkImage(
                  imageUrl:  'http://${item?.image}',
                  fit: BoxFit.cover,
                  placeholder:
                      (context, string) =>
                      Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor:
                        Colors.grey[700]!,
                        child: Container(
                          width:120.w,
                          height: 120.h,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Text(
              item?.name ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ),
        ],
      );
    }

    return BlocConsumer<LayOutCubit, LayOutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        Data? manager;
        List<Data> heads = [];
        for (int x = 0;
            x < LayOutCubit.get(context).teamItem!.data!.length;
            x++) {
          if (LayOutCubit.get(context).teamItem!.data![x].position ==
              "manager") {
            if (LayOutCubit.get(context).teamItem!.data![x].filter ==
                widget.commitItem.commitName) {
              manager = LayOutCubit.get(context).teamItem!.data![x];
            }
          } else if (LayOutCubit.get(context).teamItem!.data![x].position ==
              "head") {
            if (LayOutCubit.get(context).teamItem!.data![x].filter ==
                widget.commitItem.commitName) {
              heads.add(LayOutCubit.get(context).teamItem!.data![x]);
            }
          }
        }
        return Scaffold(
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
              CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    elevation: 0.0,
                    snap: false,
                    pinned: true,
                    floating: false,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        IconBroken.Arrow___Left_2,
                        color: isShrink ? HexColor('ca0000') : Colors.white,
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      background: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.r),
                                bottomLeft: Radius.circular(20.r),
                              ),
                            ),
                            child: Image.asset(
                              widget.commitItem.commitImage,
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.0),
                                  Colors.black.withOpacity(0.7),
                                ],
                                begin: AlignmentDirectional.topCenter,
                                end: AlignmentDirectional.bottomCenter,
                                stops: const [0.0, 1.0],
                                tileMode: TileMode.clamp,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.r),
                                bottomLeft: Radius.circular(20.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                      titlePadding: isShrink
                          ? EdgeInsetsDirectional.only(
                              start: 50.w, bottom: 15.w)
                          : EdgeInsetsDirectional.only(
                              start: 10.w, bottom: 10.w),
                      title: isShrink
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width / 1.4,
                              child: Text(
                                widget.commitItem.commitName,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('ca0000'),
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${widget.commitItem.commitName} ${widget.commitItem.description ?? ''}',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                    ),
                    backgroundColor:
                        isShrink ? Colors.white : Colors.white.withOpacity(0.0),
                    expandedHeight: MediaQuery.of(context).size.height / 3.5,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(20.r),
                                  right: Radius.circular(20.r),
                                ),
                              ),
                              child: Text(
                                widget.commitItem.detail,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    height: 1.4.h,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.8,
                              ),
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return buildItem(manager);
                                } else {
                                  return buildItem(heads[index - 1]);
                                }
                              },
                              itemCount: heads.length + 1,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}