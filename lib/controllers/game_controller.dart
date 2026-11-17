import 'package:get/get.dart';
import '../api/api_service.dart';
import '../models/game_model.dart';

class GameController extends GetxController {
  final RxList<Game> games = <Game>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchGames();
  }

  void fetchGames() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final result = await ApiService.fetchGames();
      games.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}

