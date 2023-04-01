part of '../errors.dart';

/// Exception to forward messages
class MessageException implements Exception {
  final String message;

  const MessageException(this.message);
}
