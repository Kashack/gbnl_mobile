import 'package:bloc/bloc.dart';
import 'package:gbnl_mobile/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:meta/meta.dart';

import '../../../core/database/app_database.dart';
import '../../auth/data/model/user.dart';
import '../data/models/news_model.dart';
import '../domain/repositories/dashboard_repository.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository _repository = DashboardRepositoryImpl();

  DashboardCubit() : super(DashboardInitial());

  Future<void> loadUserName() async {
    final user = await AppDatabase().getUser();
    emit(DashboardState(user: user));
  }

  void loadDashboard() async {
    emit(DashboardLoading());

    try {
      final news = await _repository.getNews();
      emit(DashboardLoaded(news: news));
    } catch (e) {
      emit(DashboardError("Failed to load dashboard: ${e.toString()}"));
    }
  }
}
