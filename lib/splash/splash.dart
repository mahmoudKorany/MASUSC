import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masusc/home/cubit/cubit.dart';
import 'package:masusc/home/cubit/states.dart';
import 'package:masusc/main.dart';
import 'package:masusc/sessions_screen/cubit/sessions_cubit.dart';
import 'package:masusc/sessions_screen/cubit/sessions_states.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late double currentOpacity;
  late int milliseconds = 500;

  @override
  void initState() {
    super.initState();
    currentOpacity = 0;
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        currentOpacity = 0;
      });
    }).then((value) async {
      setState(() {
        currentOpacity = 1;
        milliseconds = 1000;
      });
      await Future.delayed(const Duration(milliseconds: 2000), () {})
          .then((value) async {
        setState(() {
          currentOpacity = 0.2;
        });
        await Future.delayed(const Duration(milliseconds: 1000), () {})
            .then((value) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => startScreen!));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayOutCubit, LayOutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<SessionsCubit, SessionsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return AnimatedOpacity(
              opacity: currentOpacity,
              duration: Duration(milliseconds: milliseconds),
              child: Container(
                  height: 400,
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/SplashScreen.jpg',
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )),
            );
          },
        );
      },
    );
  }
}
