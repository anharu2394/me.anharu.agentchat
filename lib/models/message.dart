import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String senderId,
    required String text,
    required DateTime timestamp,
    required String type,
    required bool isDeleted,
    DateTime? deletedAt,
    String? deletedBy,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  factory Message.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Message.fromJson({
      'id': doc.id,
      ...data,
      'timestamp': (data['timestamp'] as Timestamp).toDate().toIso8601String(),
      'deletedAt': data['deletedAt'] != null ? (data['deletedAt'] as Timestamp).toDate().toIso8601String() : null,
    });
  }
}
