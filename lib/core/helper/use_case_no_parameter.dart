import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';

abstract class UseCase<Type> {
  Future<Either<FailuerClass, Type>> call();
}
