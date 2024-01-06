import 'package:kublet/data/enum/data_response_enum.dart';

class DataResponseModel<T> {
  final DataResponseType type;
  final T? dataResponse;
  final String? message;

  DataResponseModel(this.type, {this.dataResponse, this.message});

  bool get isLoading => type == DataResponseType.loading;
  bool get hasData => type == DataResponseType.data;
  bool get isEmpty => type == DataResponseType.empty;
  bool get isError => type == DataResponseType.error;

  R when<R>({
    required R Function() loading,
    required R Function(T data) data,
    required R Function() empty,
    required R Function(String message) error,
  }) {
    switch (type) {
      case DataResponseType.loading:
        return loading();
      case DataResponseType.data:
        if (data != null) {
          return data(dataResponse!);
        } else {
          throw AssertionError("Data cannot be null in 'data' state");
        }
      case DataResponseType.empty:
        return empty();
      case DataResponseType.error:
        if (message != null) {
          return error(message!);
        } else {
          throw AssertionError("Message cannot be null in 'error' state");
        }
    }
  }
}
