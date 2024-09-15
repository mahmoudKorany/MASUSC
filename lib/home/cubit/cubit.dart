import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masusc/blog_screen/blog_screen.dart';
import 'package:masusc/events_screen/events_screen.dart';
import 'package:masusc/home/cubit/states.dart';
import 'package:masusc/home/home_screen.dart';
import 'package:masusc/magazine_screen/magazine_screen.dart';
import 'package:masusc/models/blog_model.dart';
import 'package:masusc/models/data_drive_model.dart';
import 'package:masusc/models/event_model.dart';
import 'package:masusc/models/magazine_model.dart';
import 'package:masusc/models/pricesModel.dart';
import 'package:masusc/models/team_model.dart';
import 'package:masusc/shared/dio/dio.dart';
import 'package:masusc/shared/shared_component/component.dart';

class LayOutCubit extends Cubit<LayOutStates> {
  LayOutCubit() : super(LayOutInitialState());

  static LayOutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const EventScreen(),
    const MagazineScreen(),
    const BlogScreen(),
  ];

  void changeBottomNavBar(int index, context) {
    currentIndex = index;
    emit(ChangeBottomNavBar());
  }

  MagazineItem? magazineItem;
  Future<void> getMagazineData() async {
    emit(GetMagazineLoading());
    await DioHelper.getData(
      url: 'magazines/read.php',
      query: {},
    ).then((value)
    {
      magazineItem = MagazineItem.fromJson(value.data);
      emit(GetMagazineSuccess());
    }).catchError((e)
    {
      emit(GetMagazineError(e.toString()));
    });
  }

  BlogItem? blogItem;
  Future<void> getBlogData() async {
    emit(GetBlogLoading());
    await DioHelper.getData(
      url: 'blog/read.php',
      query: {},
    ).then((value)async
    {
      blogItem = BlogItem.fromJson(value.data);
      emit(GetBlogSuccess());
      Future.wait([
       getSlogan(),
       getPrices(),
       getMagazineData(),
       getEventData(),
       getTeamData(),
        getDataDrive(),
      ]);

    }).catchError((e)
    {
      showToast(msg: 'Check Your internet connection', state:MsgState.error);
      emit(GetBlogError(e.toString()));
    });
  }

  EventItem? eventItem;
  Future<void> getEventData() async {
    emit(GetEventsLoading());
    await DioHelper.getData(
      url: 'events/read.php',
      query: {},
    ).then((value)
    {
      eventItem = EventItem.fromJson(value.data);
      emit(GetEventsSuccess());
    }).catchError((e)
    {
      showToast(msg: 'Check Your internet connection', state:MsgState.error);
      emit(GetEventsError(e.toString()));
    });
  }

  TeamItem? teamItem;
  Future<void> getTeamData() async {
    emit(GetTeamLoading());
    await DioHelper.getData(
      url: 'team/read.php',
      query: {},
    ).then((value)
    {
      teamItem = TeamItem.fromJson(value.data);
      emit(GetTeamSuccess());
    }).catchError((e)
    {
      showToast(msg: 'Check Your internet connection', state:MsgState.error);
      emit(GetTeamError(e.toString()));
    });
  }

  Prices? chapter;
  Prices? out;
  Future<void> getPrices() async {
    await DioHelper.getData(
      url: 'prizes/read.php?type=0',
      query: {},
    ).then((value)
    {
      chapter = Prices.fromJson(value.data);
    }).catchError((e)
    {
      showToast(msg: 'Check Your internet connection', state:MsgState.error);
    });
    await DioHelper.getData(
      url: 'prizes/read.php?type=1',
      query: {},
    ).then((value)
    {
      out = Prices.fromJson(value.data);
    }).catchError((e)
    {
      showToast(msg: 'Check Your internet connection', state:MsgState.error);
    });
  }
  String? slogan;
  Future<void> getSlogan() async {
    await DioHelper.getData(
      url: 'slogan/read.php',
      query: {},
    ).then((value)
    {
      slogan = value.data['data'][0]['slogan'];
    }).catchError((e)
    {
      showToast(msg: 'Check Your internet connection', state:MsgState.error);
    });

  }

  DataDrive ? dataDrive;
  Future<void> getDataDrive() async {
    await DioHelper.getData(
      url: 'links/read.php',
      query: {},
    ).then((value)
    {
      dataDrive = DataDrive.fromJson(value.data);
    }).catchError((e)
    {
      showToast(msg: 'Check Your internet connection', state:MsgState.error);
    });

  }

}