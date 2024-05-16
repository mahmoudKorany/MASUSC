import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masusc/firebase_options.dart';
import 'package:masusc/home/cubit/cubit.dart';
import 'package:masusc/layout_screen/layout_screen.dart';
import 'package:masusc/login_screen/login_cubit/login_cubit.dart';
import 'package:masusc/login_screen/login_screen/login.dart';
import 'package:masusc/notification/notificarion.dart';
import 'package:masusc/sessions_screen/cubit/sessions_cubit.dart';
import 'package:masusc/shared/cache-helper/cache-helper.dart';
import 'package:masusc/shared/constants.dart';
import 'package:masusc/shared/dio/dio.dart';
import 'package:masusc/splash/splash.dart';
import 'package:permission_handler/permission_handler.dart';

import 'on_boarding_screen/on_boarding_screen.dart';

Widget? startScreen;

void checkPermission() async {
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  NotificationService().showNotification(
    title: message.notification?.title ?? '',
    body: message.notification?.body ?? '',
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onMessage.listen((message) {
    NotificationService().showNotification(
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
    );
  });
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    NotificationService().showNotification(
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
    );
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await CacheHelper.init();
  await DioHelper.init();
  bool? isOnBoardingDone = await CacheHelper.getData(key: 'onBoarding');
  uid = await CacheHelper.getData(key: 'userUid');
  checkPermission();
  if (isOnBoardingDone == null && uid == null) {
    startScreen = const StartScreen();
  } else if (isOnBoardingDone == true && uid == null) {
    startScreen = const LoginScreen();
  }
  else {
    startScreen = const LayoutScreen();
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp(startScreen: startScreen!));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startScreen});
  final Widget startScreen;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (state) => LoginCubit()..getUserData(uid: uid),
        ),
        BlocProvider(
          create: (state) => LayOutCubit()..getBlogData(),
        ),
        BlocProvider(
          create: (state) => SessionsCubit()..getAllSessions(),
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: ScreenUtilInit(
          designSize: const Size(393, 835),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                disabledColor: Colors.black,
              ),
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: child!,
                );
              },
              debugShowCheckedModeBanner: false,
              home: const Splash(),
            );
          },
        ),
      ),
    );
  }
}
