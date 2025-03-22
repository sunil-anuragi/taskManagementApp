abstract class BaseApiResponse<T> {
  String? status;
  T? data;
  String? message;

  void fromJson(Map<String, dynamic> data) {
    status = data['responseCode'];
    data = data['data'];
    message = data['responseMsg'];
  }
}
