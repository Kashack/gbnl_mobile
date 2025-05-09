// import 'package:flutter_test/flutter_test.dart';
// import 'package:gbnl_mobile/features/auth/data/model/user.dart';
// import 'package:gbnl_mobile/features/dashboard/cubit/dashboard_cubit.dart';
// import 'package:gbnl_mobile/features/dashboard/domain/repositories/dashboard_repository.dart';
// import 'package:mocktail/mocktail.dart';
//
// class MockDashboardRepository extends Mock implements DashboardRepository {}
//
// void main() {
//   late DashboardCubit cubit;
//   late MockDashboardRepository mockDashRepo;
//
//   setUp(() {
//     mockDashRepo = MockDashboardRepository();
//     cubit = DashboardCubit();
//   });
//
//   test('should emit user loaded state', () async {
//     final user = UserModel(firstName: 'Jane', lastName: 'Bidemi');
//
//     when(() => mockDashRepo.getUser()).thenAnswer((_) async => user);
//
//     await cubit.loadUserName();
//
//     expect(cubit.state.user?.firstName, 'Jane');
//     verify(() => mockDashRepo.getUser()).called(1);
//   });
//
//   test('should emit news loaded state', () async {
//     final newsList = [
//       NewsEntity(headline: 'Sample News', datetime: 123456, url: '', image: '', summary: '', category: '', source: '')
//     ];
//
//     when(() => mockNewsRepo.getGeneralNews()).thenAnswer((_) async => newsList);
//
//     await cubit.loadNews();
//
//     expect(cubit.state.newsList.length, 1);
//     expect(cubit.state.newsList.first.headline, 'Sample News');
//     verify(() => mockNewsRepo.getGeneralNews()).called(1);
//   });
// }
