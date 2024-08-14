import 'package:cp_discord_logger/core/cp_discord_logger.dart';

class EndPoints {
  static const String baseUrl = 'https://discord.com/api';
  static String sendMessage =
      '$baseUrl/v10/channels/${CPDiscordLogger.instance.channelID}/messages';
}
