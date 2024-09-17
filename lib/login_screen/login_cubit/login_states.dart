abstract class LoginStates {}

class SocialLoginInitialState extends LoginStates {}

class ChangeSuffixIcon extends LoginStates {}

class RegisterLoading extends LoginStates {}

class RegisterSuccess extends LoginStates {}

class RegisterError extends LoginStates {
  final String error;

  RegisterError(this.error);
}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {}

class LoginError extends LoginStates {
  final String error;

  LoginError(this.error);
}

class CreateUserLoading extends LoginStates {}

class CreateUserSuccess extends LoginStates {}

class CreateUserError extends LoginStates {
  final String error;

  CreateUserError(this.error);
}

class GetUserDataLoading extends LoginStates {}

class GetUserDataSuccess extends LoginStates {}

class GetUserDataError extends LoginStates {
  final String error;

  GetUserDataError(this.error);
}

class LogoutLoading extends LoginStates {}

class LogoutSuccess extends LoginStates {}

class ChangePasswordLoading extends LoginStates {}

class ChangePasswordSuccess extends LoginStates {}

class ChangePasswordError extends LoginStates {
  final String error;

  ChangePasswordError(this.error);
}
class UpdateProfileLoading extends LoginStates {}

class UpdateProfileSuccess extends LoginStates {}

class UpdateProfileError extends LoginStates {
  final String error;

  UpdateProfileError(this.error);
}

class DeleteAccountLoading extends LoginStates {}

class DeleteAccountSuccess extends LoginStates {}

class DeleteAccountError extends LoginStates {
  final String error;

  DeleteAccountError(this.error);
}
