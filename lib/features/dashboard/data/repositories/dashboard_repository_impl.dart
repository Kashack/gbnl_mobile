import 'package:gbnl_mobile/core/network/dio_client.dart';

import '../../domain/repositories/dashboard_repository.dart';
import '../models/news_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DioClient dioClient = DioClient();
  static const String token = "crals9pr01qhk4bqotb0crals9pr01qhk4bqotbg";
  static const String baseUrl = 'https://finnhub.io/api/v1';
  static const String news = '$baseUrl/news?category=general&token=$token';

  DashboardRepositoryImpl();
  @override
  Future<List<NewsModel>> getNews() async {
   final response = await dioClient.dio.get(news);
   final List data = response.data;
   return data.map((json) => NewsModel.fromJson(json)).toList();
  }
}
