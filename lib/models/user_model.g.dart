// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['login'] as String,
      json['id'] as int,
      json['avatar_url'] as String,
      json['html_url'] as String,
      json['name'] as String?,
      json['location'] as String?,
      json['bio'] as String?,
      json['public_repos'] as int?,
      json['followers'] as int?,
      json['following'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
      'html_url': instance.htmlUrl,
      'name': instance.name,
      'location': instance.location,
      'bio': instance.bio,
      'public_repos': instance.publicRepos,
      'followers': instance.followers,
      'following': instance.following,
    };
