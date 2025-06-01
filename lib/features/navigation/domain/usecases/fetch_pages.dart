import '../../../../core/services/get_it_service.dart';
import '../entities/navigation_page_type.dart';
import '../repositories/navigation_repository.dart';

class FetchPagesUseCase {
  List<NavigationPageType> call() => getIt<NavigationRepository>().pagesType;
}
