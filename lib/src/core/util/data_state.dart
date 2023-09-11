import 'enum_classes.dart';

abstract class DataState<T> {
  final BaseState state;
  final T? data;
  final String? error;

  DataState({
    required this.state,
    this.data,
    this.error,
  });
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data)
      : super(
          state: BaseState.success,
          data: data,
        );
}

class DataFailed<T> extends DataState<T> {
  DataFailed(String error)
      : super(
          state: BaseState.failure,
          error: error,
        );
}
