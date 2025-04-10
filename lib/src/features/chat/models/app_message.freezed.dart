// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppMessage {

 String? get content; Sender? get sender; DateTime? get timestamp;
/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppMessageCopyWith<AppMessage> get copyWith => _$AppMessageCopyWithImpl<AppMessage>(this as AppMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppMessage&&(identical(other.content, content) || other.content == content)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,content,sender,timestamp);

@override
String toString() {
  return 'AppMessage(content: $content, sender: $sender, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $AppMessageCopyWith<$Res>  {
  factory $AppMessageCopyWith(AppMessage value, $Res Function(AppMessage) _then) = _$AppMessageCopyWithImpl;
@useResult
$Res call({
 String? content, Sender? sender, DateTime? timestamp
});




}
/// @nodoc
class _$AppMessageCopyWithImpl<$Res>
    implements $AppMessageCopyWith<$Res> {
  _$AppMessageCopyWithImpl(this._self, this._then);

  final AppMessage _self;
  final $Res Function(AppMessage) _then;

/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = freezed,Object? sender = freezed,Object? timestamp = freezed,}) {
  return _then(_self.copyWith(
content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as Sender?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc


class _AppMessage implements AppMessage {
   _AppMessage({this.content, this.sender, this.timestamp});
  

@override final  String? content;
@override final  Sender? sender;
@override final  DateTime? timestamp;

/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppMessageCopyWith<_AppMessage> get copyWith => __$AppMessageCopyWithImpl<_AppMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppMessage&&(identical(other.content, content) || other.content == content)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,content,sender,timestamp);

@override
String toString() {
  return 'AppMessage(content: $content, sender: $sender, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$AppMessageCopyWith<$Res> implements $AppMessageCopyWith<$Res> {
  factory _$AppMessageCopyWith(_AppMessage value, $Res Function(_AppMessage) _then) = __$AppMessageCopyWithImpl;
@override @useResult
$Res call({
 String? content, Sender? sender, DateTime? timestamp
});




}
/// @nodoc
class __$AppMessageCopyWithImpl<$Res>
    implements _$AppMessageCopyWith<$Res> {
  __$AppMessageCopyWithImpl(this._self, this._then);

  final _AppMessage _self;
  final $Res Function(_AppMessage) _then;

/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = freezed,Object? sender = freezed,Object? timestamp = freezed,}) {
  return _then(_AppMessage(
content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as Sender?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

AppMessageState _$AppMessageStateFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'sent':
          return Sent.fromJson(
            json
          );
                case 'received':
          return Received.fromJson(
            json
          );
                case 'failed':
          return Failed.fromJson(
            json
          );
                case 'read':
          return Read.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'AppMessageState',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$AppMessageState {



  /// Serializes this AppMessageState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppMessageState);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppMessageState()';
}


}

/// @nodoc
class $AppMessageStateCopyWith<$Res>  {
$AppMessageStateCopyWith(AppMessageState _, $Res Function(AppMessageState) __);
}


/// @nodoc
@JsonSerializable()

class Sent implements AppMessageState {
  const Sent(this.content, {final  String? $type}): $type = $type ?? 'sent';
  factory Sent.fromJson(Map<String, dynamic> json) => _$SentFromJson(json);

 final  String content;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AppMessageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SentCopyWith<Sent> get copyWith => _$SentCopyWithImpl<Sent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sent&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'AppMessageState.sent(content: $content)';
}


}

/// @nodoc
abstract mixin class $SentCopyWith<$Res> implements $AppMessageStateCopyWith<$Res> {
  factory $SentCopyWith(Sent value, $Res Function(Sent) _then) = _$SentCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$SentCopyWithImpl<$Res>
    implements $SentCopyWith<$Res> {
  _$SentCopyWithImpl(this._self, this._then);

  final Sent _self;
  final $Res Function(Sent) _then;

/// Create a copy of AppMessageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(Sent(
null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Received implements AppMessageState {
  const Received(this.content, {final  String? $type}): $type = $type ?? 'received';
  factory Received.fromJson(Map<String, dynamic> json) => _$ReceivedFromJson(json);

 final  String content;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AppMessageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceivedCopyWith<Received> get copyWith => _$ReceivedCopyWithImpl<Received>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceivedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Received&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'AppMessageState.received(content: $content)';
}


}

/// @nodoc
abstract mixin class $ReceivedCopyWith<$Res> implements $AppMessageStateCopyWith<$Res> {
  factory $ReceivedCopyWith(Received value, $Res Function(Received) _then) = _$ReceivedCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$ReceivedCopyWithImpl<$Res>
    implements $ReceivedCopyWith<$Res> {
  _$ReceivedCopyWithImpl(this._self, this._then);

  final Received _self;
  final $Res Function(Received) _then;

/// Create a copy of AppMessageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(Received(
null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Failed implements AppMessageState {
  const Failed([this.errorMessage, final  String? $type]): $type = $type ?? 'failed';
  factory Failed.fromJson(Map<String, dynamic> json) => _$FailedFromJson(json);

 final  String? errorMessage;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AppMessageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedCopyWith<Failed> get copyWith => _$FailedCopyWithImpl<Failed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FailedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failed&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'AppMessageState.failed(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $FailedCopyWith<$Res> implements $AppMessageStateCopyWith<$Res> {
  factory $FailedCopyWith(Failed value, $Res Function(Failed) _then) = _$FailedCopyWithImpl;
@useResult
$Res call({
 String? errorMessage
});




}
/// @nodoc
class _$FailedCopyWithImpl<$Res>
    implements $FailedCopyWith<$Res> {
  _$FailedCopyWithImpl(this._self, this._then);

  final Failed _self;
  final $Res Function(Failed) _then;

/// Create a copy of AppMessageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = freezed,}) {
  return _then(Failed(
freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Read implements AppMessageState {
  const Read(this.content, {final  String? $type}): $type = $type ?? 'read';
  factory Read.fromJson(Map<String, dynamic> json) => _$ReadFromJson(json);

 final  String content;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AppMessageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadCopyWith<Read> get copyWith => _$ReadCopyWithImpl<Read>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Read&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'AppMessageState.read(content: $content)';
}


}

/// @nodoc
abstract mixin class $ReadCopyWith<$Res> implements $AppMessageStateCopyWith<$Res> {
  factory $ReadCopyWith(Read value, $Res Function(Read) _then) = _$ReadCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$ReadCopyWithImpl<$Res>
    implements $ReadCopyWith<$Res> {
  _$ReadCopyWithImpl(this._self, this._then);

  final Read _self;
  final $Res Function(Read) _then;

/// Create a copy of AppMessageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(Read(
null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
