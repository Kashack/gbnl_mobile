part of 'dashboard_cubit.dart';

enum DashboardStatus { initial, loading, success, error }

class DashboardState extends Equatable{
  final DashboardStatus status;
  final UserModel? user;
  final List<NewsModel>? news;
  final String? errorMessage;

  const DashboardState({
    this.status = DashboardStatus.initial,
    this.user,
    this.news,
    this.errorMessage,
  });

  DashboardState copyWith({
    DashboardStatus? status,
    UserModel? user,
    List<NewsModel>? news,
    String? errorMessage,
  }) {
    return DashboardState(
      status: status ?? this.status,
      user: user ?? this.user,
      news: news ?? this.news,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, news, errorMessage];
}
