import 'package:dart_joy/dart_joy.dart';
import 'package:test/test.dart';

void main() {
  // test('doing something always produces ReopOut', () async {
  //   SomehtingRepoImplementation repo = SomehtingRepoImplementation();

  //   final result = await repo.doSomethingElseWith(1);
  //   print(result.runtimeType);

  // });

  test('doing something with odd number produces success', () async {
    SomehtingRepoImplementation repo = SomehtingRepoImplementation();

    final result = await repo.doSomethingElseWith(1);
    expect(result.hasError, false);
  });

  test('doing something with even number produces error', () async {
    SomehtingRepoImplementation repo = SomehtingRepoImplementation();

    final result = await repo.doSomethingElseWith(2);
    expect(result.hasError, true);
  });
}
