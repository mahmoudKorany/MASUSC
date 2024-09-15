import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masusc/layout_screen/layout_screen.dart';
import 'package:masusc/models/current_user_model.dart';
import '../../home/cubit/cubit.dart';
import '../../models/models.dart';
import '../../shared/cache-helper/cache-helper.dart';
import '../../shared/constants.dart';
import '../../shared/shared_component/component.dart';
import '../login_screen/login.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(SocialLoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isObscure = true;
  IconData suffixIcon = Iconsax.eye;
  String? userImageUrl;
  void changeSuffixIcon() {
    if (isObscure) {
      isObscure = !isObscure;
      suffixIcon = Iconsax.eye_slash;
    } else {
      isObscure = !isObscure;
      suffixIcon = Iconsax.eye;
    }
    emit(ChangeSuffixIcon());
  }

  CurrentUser? currentUser;
  Future<void> getUserData({required String? uid}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) async {

      currentUser = CurrentUser.fromJson(value.data()!);
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> changePassword(String newPassword,context)async {
    emit(ChangePasswordLoading());
    await FirebaseAuth.instance.currentUser!.updatePassword(newPassword).then((value)
    {
      Navigator.pop(context);
      showToast(msg: 'Password Changed Successfully', state: MsgState.success);
      emit(ChangePasswordSuccess());
    }).catchError((e){
      Navigator.pop(context);
      String error = e.toString();
      String fire = '[firebase_auth/weak-password]';
      String message = error.replaceAll(fire, '').trim();
      if(error.toString().contains('[firebase_auth/network-request-failed]'))
      {
        message = 'Check you internet connection';
      }
      showToast(msg: message, state: MsgState.error);
      emit(ChangePasswordError(e.toString()));
    });
  }
  Future<void> userRegister(
      {required String email,
      required String password,
      required String phone,
      required String name,
      required BuildContext context})async {
    emit(RegisterLoading());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await userCreate(
        email: email,
        phone: phone,
        uid: value.user!.uid,
        name: name,
      );
      await getUserData(uid: value.user!.uid).then((value) {
        showToast(msg: 'Register done successfully', state: MsgState.success);
        navigateAndFinish(context, const LayoutScreen());
      });
      await CacheHelper.saveData(key: 'userUid', value: value.user!.uid);
      uid = await CacheHelper.getData(key: 'userUid');
    }).catchError((error) {
      String message;
      if(error.toString().contains('[firebase_auth/email-already-in-use]'))
      {
        message = 'This email already exist';
      }else if(error.toString().contains('[firebase_auth/weak-password]'))
      {
        message = error.toString().replaceAll('[firebase_auth/weak-password]', '').trim();
      }else if(error.toString().contains('[firebase_auth/network-request-failed]'))
      {
        message = 'Check your internet connection';
      }else
      {
        message = error.toString();
      }
      showToast(msg: message, state: MsgState.error);
      emit(RegisterError(error.toString()));
    });
  }

  Future<void> userCreate({
    required String name,
    required String email,
    required String phone,
    required String uid,
  })async {
    UserModel userModel = UserModel(
        phone: phone, email: email, name: name, uid: uid);
   await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(userModel.toMap())
        .then((value) {
      emit(CreateUserSuccess());
    }).catchError((error) {
      emit(CreateUserError(error.toString()));
    });
  }

  void userLogin(
      {required String email,
      required String password,
      required BuildContext context}) {
    emit(LoginLoading());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await getUserData(uid: value.user!.uid);
      await CacheHelper.saveData(key: 'userUid', value: value.user!.uid)
          .then((value) async {
            showToast(msg: 'Login done successfully', state: MsgState.success);
       navigateAndFinish(context,  const LayoutScreen(),);
        emit(LoginSuccess());
        uid = await CacheHelper.getData(key: 'userUid');
      });
    }).catchError((error) {
      final String message ;
      if(error.toString().contains('[firebase_auth/INVALID_LOGIN_CREDENTIALS]'))
      {
        message = 'Your email or password not correct';
      }
      else if(error.toString().contains('[firebase_auth/network-request-failed]'))
      {
        message = 'Check your internet connection';
      }else
      {
        message = error.toString();
      }
      showToast(msg: message, state: MsgState.error);
      emit(LoginError(error.toString()));
    });
  }

  void logout(context) async {
    emit(LogoutLoading());
    await CacheHelper.removeData(key: 'userUid').then((value) async {
      await CacheHelper.removeData(key: 'noOfRemoved');
      uid = '';
      emit(LogoutSuccess());
      navigateAndFinish(context, const LoginScreen());
      showToast(msg: 'Logout Done Successfully', state: MsgState.success);
      LayOutCubit.get(context).currentIndex = 0;
    });
  }
}
