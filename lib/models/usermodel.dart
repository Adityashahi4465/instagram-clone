// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final String uid;
  final String fullName;
  final DateTime birthDay;
  final String email;
  final String userName;
  final List<String> followers;
  final List<String> following;
  final String profilePic;
  final String bio;
  final String link;
  final DateTime joinedAt;
  UserModel({
    required this.uid,
    required this.fullName,
    required this.birthDay,
    required this.email,
    required this.userName,
    required this.followers,
    required this.following,
    required this.profilePic,
    required this.bio,
    required this.link,
    required this.joinedAt,
  });

  UserModel copyWith({
    String? uid,
    String? fullName,
    DateTime? birthDay,
    String? email,
    String? userName,
    List<String>? followers,
    List<String>? following,
    String? profilePic,
    String? bio,
    String? link,
    DateTime? joinedAt,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      birthDay: birthDay ?? this.birthDay,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      profilePic: profilePic ?? this.profilePic,
      bio: bio ?? this.bio,
      link: link ?? this.link,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'fullName': fullName,
      'birthDay': birthDay.toUtc(),
      'email': email,
      'userName': userName,
      'followers': followers,
      'following': following,
      'profilePic': profilePic,
      'bio': bio,
      'link': link,
      'joinedAt': joinedAt.toUtc(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      fullName: map['fullName'] as String,
      birthDay: (map['birthDay'] as Timestamp).toDate(),
      email: map['email'] as String,
      userName: map['userName'] as String,
      followers: List<String>.from((map['followers'] as List<String>)),
      following: List<String>.from((map['following'] as List<String>)),
      profilePic: map['profilePic'] as String,
      bio: map['bio'] as String,
      link: map['link'] as String,
      joinedAt:(map['joinedAt'] as Timestamp).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, fullName: $fullName, birthDay: $birthDay, email: $email, userName: $userName, followers: $followers, following: $following, profilePic: $profilePic, bio: $bio, link: $link, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.fullName == fullName &&
      other.birthDay == birthDay &&
      other.email == email &&
      other.userName == userName &&
      listEquals(other.followers, followers) &&
      listEquals(other.following, following) &&
      other.profilePic == profilePic &&
      other.bio == bio &&
      other.link == link &&
      other.joinedAt == joinedAt;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      fullName.hashCode ^
      birthDay.hashCode ^
      email.hashCode ^
      userName.hashCode ^
      followers.hashCode ^
      following.hashCode ^
      profilePic.hashCode ^
      bio.hashCode ^
      link.hashCode ^
      joinedAt.hashCode;
  }
}
