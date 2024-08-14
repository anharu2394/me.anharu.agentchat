// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: json['id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
      budget: Budget.fromJson(json['budget'] as Map<String, dynamic>),
      deadline: DateTime.parse(json['deadline'] as String),
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
      'budget': instance.budget.toJson(),
      'deadline': instance.deadline.toIso8601String(),
      'skills': instance.skills,
      'attachments': instance.attachments,
    };

_$BudgetImpl _$$BudgetImplFromJson(Map<String, dynamic> json) => _$BudgetImpl(
      min: (json['min'] as num).toInt(),
      max: (json['max'] as num).toInt(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$BudgetImplToJson(_$BudgetImpl instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'currency': instance.currency,
    };

_$UserProjectsImpl _$$UserProjectsImplFromJson(Map<String, dynamic> json) =>
    _$UserProjectsImpl(
      created: (json['created'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      proposed: (json['proposed'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      accepted: (json['accepted'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserProjectsImplToJson(_$UserProjectsImpl instance) =>
    <String, dynamic>{
      'created': instance.created.map((e) => e.toJson()).toList(),
      'proposed': instance.proposed.map((e) => e.toJson()).toList(),
      'accepted': instance.accepted.map((e) => e.toJson()).toList(),
    };

_$UserProjectIdsImpl _$$UserProjectIdsImplFromJson(Map<String, dynamic> json) =>
    _$UserProjectIdsImpl(
      created:
          (json['created'] as List<dynamic>).map((e) => e as String).toList(),
      proposed:
          (json['proposed'] as List<dynamic>).map((e) => e as String).toList(),
      accepted:
          (json['accepted'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$UserProjectIdsImplToJson(
        _$UserProjectIdsImpl instance) =>
    <String, dynamic>{
      'created': instance.created,
      'proposed': instance.proposed,
      'accepted': instance.accepted,
    };
