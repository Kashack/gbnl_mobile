import 'package:flutter_test/flutter_test.dart';
import 'package:gbnl_mobile/features/dashboard/data/models/news_model.dart';
import 'package:gbnl_mobile/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'dashboard_repository_test.mocks.dart';


@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late DashboardRepositoryImpl repository;

  setUp(() {
    mockDio = MockDio();
    repository = DashboardRepositoryImpl()..dioClient.dio = mockDio;
  });

  test('returns a list of NewsModel when getNews is called', () async {
    final mockResponse = Response(
      data: [
        {
          "headline": "Market news",
          "source": "Bloomberg",
          "datetime": 1629792000,
          "summary": "Market summary here",
          "url": "https://news.com/article"
        },
      ],
      requestOptions: RequestOptions(path: ''),
      statusCode: 200,
    );

    when(mockDio.get(any)).thenAnswer((_) async => mockResponse);

    final result = await repository.getNews();

    expect(result, isA<List<NewsModel>>());
    expect(result.length, 1);
    expect(result.first.headline, "Market news");
  });
}
