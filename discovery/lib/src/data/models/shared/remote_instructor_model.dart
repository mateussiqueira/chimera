import 'package:discovery/src/domain/domain.dart';

class RemoteInstructorModel extends InstructorEntity {
  const RemoteInstructorModel({
    super.avatar,
    super.bio,
    super.headline,
    super.name,
  });

  factory RemoteInstructorModel.fromJson(Map<String, dynamic> map) {
    return RemoteInstructorModel(
      avatar: map['avatar'],
      bio: map['bio'],
      headline: map['headline'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'bio': bio,
      'headline': headline,
      'name': name,
    };
  }
}
