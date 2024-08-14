import 'package:cp_discord_logger/core/core.dart';

class CPDiscordLogger {
  static CPDiscordLogger? _instance;
  // Add this static getter to access the instance
  static CPDiscordLogger get instance {
    _checkInitialization();
    return _instance!;
  }

  bool _isInitialized = false;
  static String _botToken = '';
  String get botToken => _botToken;
  static String _channelID = '';
  String get channelID => _channelID;

  // Private constructor to prevent instantiation
  CPDiscordLogger._();

  // Initialize the singleton
  static void init({
    required String botToken,
    required String channelID,
  }) {
    _instance = CPDiscordLogger._();
    _instance!._isInitialized = true;
    _botToken = botToken;
    _channelID = channelID;
  }

  final CPDiscordLoggerService _discordLoggerService =
      CPDiscordLoggerServiceImpl();
// **********
  // Throw an error if not initialized
  static void _checkInitialization() {
    if (_instance == null || !_instance!._isInitialized) {
      throw Exception('CPDiscordLogger must be initialized before use');
    }
  }

  // Example method that requires initialization
  void doSomething() {
    _checkInitialization();
    // Your method implementation here
  }

  sendMessage(String message) {
    _checkInitialization();
    _discordLoggerService.sendMessage(message);
  }
}
