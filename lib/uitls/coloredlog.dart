// main.dart
import 'dart:developer' as developer;

class ColoredLog {
  static void blue(String msg, [String? name]) {
    developer.log('\x1B[34m$msg\x1B[0m', name: name ?? "");
  }

  static void green(String msg, [String? name]) {
    developer.log('\x1B[32m$msg\x1B[0m', name: name ?? "");
  }

  static void yellow(String msg, [String? name]) {
    developer.log('\x1B[33m$msg\x1B[0m', name: name ?? "");
  }

  static void red(String msg, [String? name]) {
    developer.log('\x1B[31m$msg\x1B[0m', name: name ?? "");
  }
}
