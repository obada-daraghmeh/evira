import 'package:fpdart/fpdart.dart';

import '../../../errors/failures/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
