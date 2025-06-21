import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/features/classes/usecase.dart';
import '../entities/brand.dart';
import '../repositories/brand_repository.dart';

class FetchBrandsUseCase implements UseCase<List<Brand>, NoParams> {
  @override
  Future<Either<Failure, List<Brand>>> call(NoParams params) async {
    return await getIt<BrandRepository>().fetchBrands;
  }
}
