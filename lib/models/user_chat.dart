import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_chat.freezed.dart';
part 'user_chat.g.dart';

enum UserRole { admin, worker, agent }
@freezed
class UserChat with _$UserChat {
  // ignore: invalid_annotation_target
  const factory UserChat({
      required String id,
      required String photoUrl,
      required String nickname,
      required String? aboutMe,
      required UserRole role,
  }) = _UserChat;

  factory UserChat.fromJson(Map<String, Object?> json) => _$UserChatFromJson(json);
  factory UserChat.fromDocument(DocumentSnapshot doc) {
    return UserChat(
      id: doc.id,
      photoUrl: doc.get('photoUrl') as String? ?? '',
      nickname: doc.get('nickname') as String? ?? '',
      aboutMe: doc.get('aboutMe') as String?,
      role: UserRole.values.byName(doc.get('role') as String? ?? 'worker'),
    );
  }
}

/** 
class UserChat {
  final String id;
  final String photoUrl;
  final String nickname;
  final String aboutMe;
  final String role;

  const UserChat(
      {required this.id,
      required this.photoUrl,
      required this.nickname,
      required this.aboutMe});

  Map<String, String> toJson() {
    return {
      FirestoreConstants.nickname: nickname,
      FirestoreConstants.aboutMe: aboutMe,
      FirestoreConstants.photoUrl: photoUrl,
    };
  }

  factory UserChat.fromDocument(DocumentSnapshot doc) {
    String aboutMe = "";
    String photoUrl = "";
    String nickname = "";
    try {
      aboutMe = doc.get(FirestoreConstants.aboutMe);
    } catch (_) {}
    try {
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    } catch (_) {}
    try {
      nickname = doc.get(FirestoreConstants.nickname);
    } catch (_) {}
    return UserChat(
      id: doc.id,
      photoUrl: photoUrl,
      nickname: nickname,
      aboutMe: aboutMe,
    );
  }
}
*/