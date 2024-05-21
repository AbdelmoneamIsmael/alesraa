import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';

abstract class UseCase<Type, Params, Params2> {
  Future<Either<FailuerClass, Type>> call(Params params, [Params2 params2]);
}
