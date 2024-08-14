import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    required String? id,
    required String title,
    required String description,
    required String createdBy,
    required DateTime createdAt,
    required String status,
    required Budget budget,
    required DateTime deadline,
    required List<String> skills,
    required List<String> attachments,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
  
  factory Project.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Project(
      id: doc.id,
      title: data['title'] as String,
      description: data['description'] as String,
      createdBy: data['createdBy'] as String,
      createdAt: DateTime.parse(data['createdAt'] as String),
      status: data['status'] as String,
      budget: Budget.fromJson(data['budget'] as Map<String, dynamic>),
      deadline: DateTime.parse(data['deadline'] as String),
      skills: List<String>.from(data['skills'] as List),
      attachments: List<String>.from(data['attachments'] as List),
    );
  }
}

@freezed
class Budget with _$Budget {
  const factory Budget({
    required int min,
    required int max,
    required String currency,
  }) = _Budget;

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);
}

@freezed
class UserProjects with _$UserProjects {
  const factory UserProjects({
    required List<Project> created,
    required List<Project> proposed,
    required List<Project> accepted,
  }) = _UserProjects;

  factory UserProjects.fromJson(Map<String, dynamic> json) => _$UserProjectsFromJson(json);
}

@freezed
class UserProjectIds with _$UserProjectIds {
  const factory UserProjectIds({
    required List<String> created,
    required List<String> proposed,
    required List<String> accepted,
  }) = _UserProjectIds;

  factory UserProjectIds.fromJson(Map<String, dynamic> json) =>
      _$UserProjectIdsFromJson(json);
}
