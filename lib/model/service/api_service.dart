import 'package:http/http.dart' as http;
abstract class ApiService{
  final http.Client client;
  ApiService(this.client);
}