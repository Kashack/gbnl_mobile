import '../../data/models/news_model.dart';

abstract class DashboardRepository {
  Future<List<NewsModel>> getNews();
}
