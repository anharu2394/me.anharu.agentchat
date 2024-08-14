import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  const factory Room({
    required String id,
    required String type,
    required DateTime createdAt,
    required DateTime updatedAt,
    required Map<String, Participant> participants,
    required LastMessage lastMessage,
    required List<String> allowedRoles,
    String? linkedProjectId,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  factory Room.fromFirestore(DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data() ?? {};
    return Room.fromJson({
      ...data,
      'id': documentSnapshot.id,
    });
  }
}

@freezed
class Participant with _$Participant {
  const factory Participant({
    required DateTime joinedAt,
    required String role,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) => _$ParticipantFromJson(json);
}

@freezed
class LastMessage with _$LastMessage {
  const factory LastMessage({
    required String messageId,
    required String text,
    required String senderId,
    required DateTime timestamp,
    required bool isDeleted,
  }) = _LastMessage;

  factory LastMessage.fromJson(Map<String, dynamic> json) => _$LastMessageFromJson(json);
}

