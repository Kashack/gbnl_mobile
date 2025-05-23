
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbnl_mobile/core/database/database_helper.dart';
import 'package:gbnl_mobile/core/di/injection.dart';
import 'package:gbnl_mobile/features/dashboard/data/repositories/dashboard_repository_impl.dart';

import '../../auth/data/model/user.dart';
import '../data/models/news_model.dart';
import '../domain/repositories/dashboard_repository.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository _repository = DashboardRepositoryImpl();

  DashboardCubit() : super(DashboardState());

  Future<void> loadUserName() async {
    final user = await getIt<DatabaseHelper>().getUser();
    emit(state.copyWith(user: user));
  }

  Future<void> loadDashboard() async {
    emit(state.copyWith(status: DashboardStatus.loading, errorMessage: null));
    try {
      final news = await _repository.getNews();
      emit(state.copyWith(
        status: DashboardStatus.success,
        news: news,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DashboardStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
