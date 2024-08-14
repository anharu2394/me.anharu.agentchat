import 'package:flutter_chat_demo/models/project.dart';
import 'package:flutter_chat_demo/models/proposal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/room.dart';
import '../models/message.dart';

part 'room.g.dart';

class RoomState {
  final Room? room;
  final List<Message> messages;
  final Project? project;
  final Proposal? proposal;

  RoomState({required this.room, required this.messages, this.project, this.proposal});
}

@riverpod
class RoomDetail extends _$RoomDetail {
  @override
  FutureOr<RoomState> build(String roomId) async {
    return _fetchRoom(roomId);
  }

  Future<RoomState> _fetchRoom(String roomId) async {
    final firestore = FirebaseFirestore.instance;
    final roomSnapshot = await firestore
        .collection('rooms')
        .doc(roomId)
        .get();

    final messagesSnapshot = await firestore
        .collection('messages')
        .doc(roomId)
        .collection('roomMessages')
        .orderBy('timestamp', descending: true)
        .limit(50)
        .get();

    final room = roomSnapshot.exists
        ? Room.fromJson(roomSnapshot.data() as Map<String, dynamic>)
        : null;

    final messages = messagesSnapshot.docs
        .map((doc) => Message.fromFirestore(doc))
        .toList();

    Project? project;
    Proposal? proposal;

    if (room != null && room.linkedProjectId != null) {
      final projectSnapshot = await firestore
          .collection('projects')
          .doc(room.linkedProjectId)
          .get();
      if (projectSnapshot.exists) {
        project = Project.fromJson(projectSnapshot.data() as Map<String, dynamic>);

        final proposalSnapshot = await firestore
            .collection('proposals')
            .doc(room.linkedProjectId)
            .get();
        if (proposalSnapshot.exists) {
          proposal = Proposal.fromJson(proposalSnapshot.data() as Map<String, dynamic>);
        }
      }
    }

    return RoomState(room: room, messages: messages, project: project, proposal: proposal);
  }

  Future<void> sendMessage(String roomId, String senderId, String text, String type) async {
    final firestore = FirebaseFirestore.instance;
    final messageId = DateTime.now().millisecondsSinceEpoch.toString();
    final message = {
      'senderId': senderId,
      'text': text,
      'timestamp': FieldValue.serverTimestamp(),
      'type': type,
      'isDeleted': false,
      'deletedAt': null,
      'deletedBy': null
    };

    await firestore
        .collection('messages')
        .doc(roomId)
        .collection('roomMessages')
        .doc(messageId)
        .set(message);

    ref.invalidateSelf();
  }
}
