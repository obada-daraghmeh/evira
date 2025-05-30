import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.i('🟢 [CREATE] ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.w('🔴 [CLOSE] ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.d('🚀 [EVENT] ${bloc.runtimeType} → $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d(
      '🔁 [STATE CHANGE] ${bloc.runtimeType} → ${change.currentState} → ${change.nextState}',
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.i(
      '🔄 [TRANSITION] ${bloc.runtimeType} → '
      'From: ${transition.currentState} → '
      'To: ${transition.nextState} '
      'via ${transition.event}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e(
      '⚠️ [ERROR] ${bloc.runtimeType} → $error',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
