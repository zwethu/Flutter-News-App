import 'package:http/http.dart' as http;
abstract class ApiService{
  // require Client for testing purpose
  final http.Client client;
  ApiService(this.client);
}