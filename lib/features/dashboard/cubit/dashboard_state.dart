part of 'dashboard_cubit.dart';

class DashboardState {
  final UserModel? user;

  const DashboardState({this.user});
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<NewsModel> news;

  const DashboardLoaded({required this.news});
}

class DashboardError extends DashboardState {
  final String message;
  const DashboardError(this.message);
}
