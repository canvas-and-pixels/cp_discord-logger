import 'package:cp_discord_logger/core/network_service.dart';
import 'package:cp_discord_logger/endpoints.dart';

abstract class CPDiscordLoggerService {
  Future sendMessage(String message);
}

class CPDiscordLoggerServiceImpl implements CPDiscordLoggerService {
  @override
  Future sendMessage(String message) async {
    try {
      NetworkService.post(EndPoints.sendMessage, body: {
        "content": message,
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
