import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'proposal.freezed.dart';
part 'proposal.g.dart';

@freezed
class Proposal with _$Proposal {
  const factory Proposal({
    required String id,
    required String userId,
    required int amount,
    required String currency,
    required String description,
    required int estimatedDuration,
    required DateTime createdAt,
    required String status,
  }) = _Proposal;

  factory Proposal.fromJson(Map<String, dynamic> json) =>
      _$ProposalFromJson(json);

  factory Proposal.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Proposal.fromJson({
      ...data,
      'id': doc.id,
    });
  }
}
