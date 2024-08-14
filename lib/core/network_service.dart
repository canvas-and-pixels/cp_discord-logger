import 'dart:convert';

import 'package:http/http.dart' as http;

import 'cp_discord_logger.dart';

class NetworkService {
  static Future post(
    String url, {
    Object? body,
    Map<String, String>? headers,
  }) async {
    Uri uri = Uri.parse(url);
    final response = await http.post(
      uri,
      headers: {
        "Authorization": "Bot ${CPDiscordLogger.instance.botToken}",
        "Content-Type": "application/json",
        "Accept": "application/json",
        if (headers != null) ...headers,
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
