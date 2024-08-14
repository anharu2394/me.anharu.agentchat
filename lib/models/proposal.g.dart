// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProposalImpl _$$ProposalImplFromJson(Map<String, dynamic> json) =>
    _$ProposalImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String,
      description: json['description'] as String,
      estimatedDuration: (json['estimatedDuration'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$ProposalImplToJson(_$ProposalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
      'estimatedDuration': instance.estimatedDuration,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
    };
