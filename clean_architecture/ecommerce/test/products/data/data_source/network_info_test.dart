import 'package:ecommerce/core/network/network.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';


class MockDataConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late NetworkInfoImple networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo =
        NetworkInfoImple(connectionChecker: mockDataConnectionChecker);
  });
  test('should forward the call to InternetConnectionChecker.hasConnection',
      () async {
        
    // arrange
    when(()=>mockDataConnectionChecker.hasConnection).thenAnswer((_) async => true);
    // act
    final result = await networkInfo.isConnected;
    // assert
    verify(()=>mockDataConnectionChecker.hasConnection);
    expect(result, true);
  });
}
