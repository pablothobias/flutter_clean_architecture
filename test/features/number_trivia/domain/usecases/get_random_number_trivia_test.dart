import 'package:clean_arch/core/usecases/usecase.dart';
import 'package:clean_arch/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_arch/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_arch/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRandomNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia usecase;
  MockRandomNumberTriviaRepository mockRandomNumberTriviaRepository;

  setUp(() {
    mockRandomNumberTriviaRepository = MockRandomNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockRandomNumberTriviaRepository);
  });

  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test('should get trivia from a random number', () async {
    when(mockRandomNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((_) async => Right(tNumberTrivia));

    final result = await usecase(NoParams());

    expect(result, Right(tNumberTrivia));
    verify(mockRandomNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockRandomNumberTriviaRepository);
  });
}
