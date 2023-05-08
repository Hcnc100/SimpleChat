

class ServerException implements Exception {
  final String message;
  final String explaint;

  ServerException({message  ,required this.explaint}) : message = message ?? 'Server Error, Please try again later';

  @override
  String toString() => 'ServerException(message: $message, explaint: $explaint)';

}