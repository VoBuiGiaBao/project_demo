import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String login;
  final int id;
  @JsonKey(name: "avatar_url")
  final String avatarUrl;
  @JsonKey(name: "html_url")
  final String htmlUrl;
  String? name = "";
  String? location = "";
  String? bio = "";
  @JsonKey(name: "public_repos")
  int? publicRepos = 0;
  int? followers = 0;
  int? following = 0;

  User(
    this.login,
    this.id,
    this.avatarUrl,
    this.htmlUrl,
    this.name,
    this.location,
    this.bio,
    this.publicRepos,
    this.followers,
    this.following,
  );

  static User fromResult(dynamic map) => User.fromJson(map);

  static List<User> fromList(dynamic data) {
    return (data as List).map((obj) => User.fromJson(obj)).toList();
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  Map<String, dynamic> toProfileJson() => <String, dynamic>{
        'name': name,
        'location': location,
        'bio': bio,
        'public_repos': publicRepos,
        'followers': followers,
        'following': following,
      };
}
