import 'dart:math' show pi;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:masusc/home/cubit/cubit.dart';
import 'package:masusc/home/cubit/states.dart';
import 'package:masusc/models/blog_model.dart';
import 'package:masusc/shared/shared_component/component.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class BlogDetail extends StatefulWidget {
  const BlogDetail({super.key, required this.data});

  final Data data;

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
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
    return BlocConsumer<LayOutCubit, LayOutStates>(
        builder: (context, state) {
          List<Data> data = [];
          for(int x=0;x<LayOutCubit.get(context).blogItem!.data!.length;x++)
          {
            if(LayOutCubit.get(context).blogItem!.data![x].id != widget.data.id)
            {
              data.add(LayOutCubit.get(context).blogItem!.data![x]);
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
                        actions: [
                          IconButton(
                            onPressed: () async
                            {
                              final RenderBox box = context.findRenderObject() as RenderBox;
                              await Share.share(
                                  "${widget.data.title!}\nhttp://masusc.com/article.php?p=${widget.data.id!}",
                                  sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
                            },
                            icon: Icon(
                              Icons.share,
                              size: 30,
                              color:
                                  isShrink ? HexColor('ca0000') : Colors.white,
                            ),
                          ),
                        ],
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
                                child: CachedNetworkImage(
                                  imageUrl: 'http://${widget.data.image!}',
                                  fit: BoxFit.fill,
                                  placeholder: (context, string) => Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.grey[700]!,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height/2,
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
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  child: Text(
                                    widget.data.title!,
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
                                      widget.data.title!,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.collections_bookmark_sharp,
                                          color: Colors.white,
                                          size: 10.r,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          widget.data.category!,
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: isShrink
                                                ? Colors.black
                                                : Colors.grey[300],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Icon(
                                          Icons.calendar_today,
                                          color: Colors.white,
                                          size: 10.r,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          widget.data.addDate!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                        ),
                        backgroundColor: isShrink ? Colors.white : Colors.white.withOpacity(0.0),
                        expandedHeight:
                            MediaQuery.of(context).size.height / 3.5,
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
                                  child: SelectableText(
                                    widget.data.content!,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        height: 1.4.h,
                                        fontFamily: 'Montserrat'),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0.r),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        "More like this",
                                        style: TextStyle(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "more articles related to this topic that you may like",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.3,
                                        width: double.infinity,
                                        child: ListView.separated(
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MyCustomRoute(
                                                        builder: (context) =>
                                                            BlogDetail(data: data[index],)));
                                              },
                                              child: Card(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0.r),
                                                  ),
                                                  clipBehavior: Clip.antiAlias,
                                                  borderOnForeground: true,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.0.w,
                                                            vertical: 8.h),
                                                    child: Row(
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
                                                          child: CachedNetworkImage(
                                                            imageUrl: 'http://${data[index].image!}',
                                                            placeholder: (context, string) => Shimmer.fromColors(
                                                              baseColor: Colors.grey,
                                                              highlightColor: Colors.grey[700]!,
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .width /
                                                                    3,
                                                                height: 120.h,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.grey,
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                              ),
                                                            ),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                3,
                                                            height: 120.h,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 8.h,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2.2,
                                                              child: Text(
                                                                data[index].title!,
                                                                maxLines: 1,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      14.sp,
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
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2.2,
                                                              child: Text(
                                                                data[index].brief!,
                                                                maxLines: 4,
                                                                textDirection:
                                                                    TextDirection
                                                                        .rtl,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
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
                                          itemCount: 4,
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                        ),
                                      ),
                                    ],
                                  ),
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
        listener: (context, state) {});
  }
}
