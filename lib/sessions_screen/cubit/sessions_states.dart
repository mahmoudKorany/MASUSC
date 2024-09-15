abstract class SessionsStates {}

class SessionsInitialState extends SessionsStates {}
class ChangeSuffixIcon extends SessionsStates {}


class GetSessionsLoading extends SessionsStates {}

class GetSessionsSuccess extends SessionsStates {}

class GetSessionsError extends SessionsStates {
  final String error;

  GetSessionsError(this.error);
}

class SubmitSessionsLoading extends SessionsStates {}

class SubmitSessionsSuccess extends SessionsStates {}

class SubmitSessionsError extends SessionsStates {
  final String error;

  SubmitSessionsError(this.error);
}

class DeleteSessionsLoading extends SessionsStates {}

class DeleteSessionsSuccess extends SessionsStates {}

class DeleteSessionsError extends SessionsStates {
  final String error;

  DeleteSessionsError(this.error);
}

class UpdateSessionLoading extends SessionsStates {}

class UpdateSessionSuccess extends SessionsStates {}

class UpdateSessionError extends SessionsStates {
  final String error;

  UpdateSessionError(this.error);
}

class CheckPasswordLoading extends SessionsStates {}

class CheckPasswordSuccess extends SessionsStates {}

class CheckPasswordError extends SessionsStates {
  final String error;

  CheckPasswordError(this.error);
}

