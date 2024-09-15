abstract class LayOutStates {}

class LayOutInitialState extends LayOutStates {}

class ChangeBottomNavBar extends LayOutStates {}

class GetMagazineLoading extends LayOutStates{}
class GetMagazineSuccess extends LayOutStates{}
class GetMagazineError extends LayOutStates
{
  final String e;

  GetMagazineError(this.e);
}

class GetBlogLoading extends LayOutStates{}
class GetBlogSuccess extends LayOutStates{}
class GetBlogError extends LayOutStates
{
  final String e;

  GetBlogError(this.e);
}

class GetTeamLoading extends LayOutStates{}
class GetTeamSuccess extends LayOutStates{}
class GetTeamError extends LayOutStates
{
  final String e;

  GetTeamError(this.e);
}

class GetEventsLoading extends LayOutStates{}
class GetEventsSuccess extends LayOutStates{}
class GetEventsError extends LayOutStates
{
  final String e;

  GetEventsError(this.e);
}
