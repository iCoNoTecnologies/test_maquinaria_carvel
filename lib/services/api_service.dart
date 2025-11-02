import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://hp-api.onrender.com/api';

  Future<http.Response> fetchCharactersRaw() async {
    final uri = Uri.parse('$baseUrl/characters');
    final response = await http.get(uri);
    return response;
  }
}
