import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_demo/models/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/room.dart';
import 'auth.dart';

part 'rooms.g.dart';

class RoomState {
  final Room room;
  final Project project;

  RoomState({required this.room, required this.project});
}

@riverpod
class Rooms extends _$Rooms {
  @override
  Future<List<RoomState>> build() async {
    final user = await ref.watch(authProvider.future);
    if (user == null) return [];

    final snapshot = await FirebaseFirestore.instance
        .collection('rooms')
        .where('participants.${user.id}', isNull: false)
        .get();

    List<RoomState> roomStates = [];
    for (var doc in snapshot.docs) {
      Room room = Room.fromFirestore(doc);
      Project? project;
      if (room.linkedProjectId != null) {
        DocumentSnapshot projectDoc = await FirebaseFirestore.instance
            .collection('projects')
            .doc(room.linkedProjectId)
            .get();
        if (projectDoc.exists) {
          project = Project.fromJson(projectDoc.data() as Map<String, dynamic>);
        }
      }
      roomStates.add(RoomState(room: room, project: project!));
    }

    return roomStates;
  }
}
