import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

class StorageService {
  Future<void> init() async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );
  }
}
