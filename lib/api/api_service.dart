import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/game_model.dart';

class ApiService {
  static const String baseUrl = 'https://www.freetogame.com/api';

  // Fetch all games
  static Future<List<Game>> fetchGames() async {
    final response = await http.get(Uri.parse('$baseUrl/games'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Game.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Gagal memuat daftar game: ${response.statusCode}');
    }
  }

  // Fetch game detail by id
  static Future<GameDetail> fetchGameDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/game?id=$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return GameDetail.fromJson(data);
    } else {
      throw Exception('Gagal memuat detail game: ${response.statusCode}');
    }
  }
}
