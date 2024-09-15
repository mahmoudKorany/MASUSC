import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masusc/sessions_screen/cubit/sessions_states.dart';
import 'package:masusc/sessions_screen/session_model.dart';
import 'package:masusc/shared/shared_component/component.dart';

class SessionsCubit extends Cubit<SessionsStates> {
  static SessionsCubit get(context) => BlocProvider.of(context);

  SessionsCubit() : super(SessionsInitialState());
  bool isObscure = true;
  IconData suffixIcon = Iconsax.eye;

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

  Sessions? sessions;

  Future<void> getAllSessions() async {
    emit(GetSessionsLoading());
    var dio = Dio();
    await dio
        .request(
      'https://www.masusc.com/api/v2/sessions/read.php',
      options: Options(
        method: 'GET',
      ),
    ).then((value) {
      sessions = Sessions.fromJson(value.data);
      emit(GetSessionsSuccess());
    }).catchError((e) {
      showToast(msg: 'Check Your internet', state: MsgState.error);
      emit(GetSessionsError(e.toString()));
    });
  }

  Future<void> updateSession({
    required String sessionName,
    required String presentedBy,
    required String meetingLink,
    required String sessionTime,
    required String sessionDate,
    required String sessionPlace,
    required String sessionId,
    required String day,
    required String committeeName
  }) async {
    emit(UpdateSessionLoading());
    var dio = Dio();
    await dio
        .request(
      'https://www.masusc.com/api/v2/sessions/update.php?session_name=$sessionName&time=$sessionTime&presented_by=$presentedBy&place=$sessionPlace&link=$meetingLink&id=$sessionId&date=$sessionDate&day=$day&committee_name=$committeeName',
      options: Options(
        method: 'GET',
      ),
    ).then((value) async {
      await getAllSessions();
      emit(UpdateSessionSuccess());
    }).catchError((e) {
      emit(UpdateSessionError(e.toString()));
      showToast(msg: 'Check Your Internet', state: MsgState.error);
    });
  }

  Future<void> submitSession({
    required String sessionName,
    required String presentedBy,
    required String meetingLink,
    required String sessionTime,
    required String sessionDate,
    required String sessionPlace,
    required String day,
    required String committeeName
  }) async {
    emit(SubmitSessionsLoading());
    var dio = Dio();
    await dio
        .request(
      'https://www.masusc.com/api/v2/sessions/post.php?session_name=$sessionName&time=$sessionTime&date=$sessionDate&presented_by=$presentedBy&place=$sessionPlace&link=$meetingLink&day=$day&committee_name=$committeeName',
      options: Options(
        method: 'GET',
      ),
    ).then((value)async {
          await getAllSessions();
      emit(SubmitSessionsSuccess());
    }).catchError((e) {
      showToast(msg: 'Check Your internet', state: MsgState.error);
      emit(SubmitSessionsError(e.toString()));
    });
  }

  Future<bool> checkPass({
    required String password,
  }) async {
    emit(CheckPasswordLoading());
    bool s = false;
    var dio = Dio();
    await dio.request(
      'https://www.masusc.com/api/v2/sessions/checkpassword.php?password=$password',
      options: Options(
        method: 'GET',
      ),
    ).then((value)
    {
      emit(CheckPasswordSuccess());
      if(value.data['status'] == 'ok')
      {
        s= true;
      }else
      {
        s= false;
      }
    }).catchError((e){
      showToast(msg: 'Check Your internet', state: MsgState.error);
      emit(CheckPasswordError(e.toString()));
      s= false;
    });
    return s;
  }

  Future<void> deleteSession({
    required String id,
  }) async {
    emit(DeleteSessionsLoading());
    var dio = Dio();
    await dio.request(
      'https://www.masusc.com/api/v2/sessions/delete.php?id=$id',
      options: Options(
        method: 'GET',
      ),
    ).then((value)async
    {
      await getAllSessions();
      emit(DeleteSessionsSuccess());
    }).catchError((e){
      showToast(msg: 'Check Your internet', state: MsgState.error);
      emit( DeleteSessionsError(e.toString()));
    });

  }
}
