// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sent _$SentFromJson(Map<String, dynamic> json) =>
    Sent(json['content'] as String, $type: json['runtimeType'] as String?);

Map<String, dynamic> _$SentToJson(Sent instance) => <String, dynamic>{
  'content': instance.content,
  'runtimeType': instance.$type,
};

Received _$ReceivedFromJson(Map<String, dynamic> json) =>
    Received(json['content'] as String, $type: json['runtimeType'] as String?);

Map<String, dynamic> _$ReceivedToJson(Received instance) => <String, dynamic>{
  'content': instance.content,
  'runtimeType': instance.$type,
};

Failed _$FailedFromJson(Map<String, dynamic> json) =>
    Failed(json['errorMessage'] as String?, json['runtimeType'] as String?);

Map<String, dynamic> _$FailedToJson(Failed instance) => <String, dynamic>{
  'errorMessage': instance.errorMessage,
  'runtimeType': instance.$type,
};

Read _$ReadFromJson(Map<String, dynamic> json) =>
    Read(json['content'] as String, $type: json['runtimeType'] as String?);

Map<String, dynamic> _$ReadToJson(Read instance) => <String, dynamic>{
  'content': instance.content,
  'runtimeType': instance.$type,
};
