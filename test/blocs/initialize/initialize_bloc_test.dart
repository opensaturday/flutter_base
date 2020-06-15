import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_base/blocs/initialize/initialize.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  InitializeBloc bloc;

  setUp() {
    bloc = InitializeBloc();
  }

  group('blocTest', () {
    setUp();

    blocTest(
      'emits [] when nothing is added',
      build: () => bloc,
      expect: [],
    );

  });
}