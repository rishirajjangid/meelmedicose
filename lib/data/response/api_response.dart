import 'package:meelmedicose/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loadinng() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.erroe(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message: $message \n Data: $data";
  }
}
