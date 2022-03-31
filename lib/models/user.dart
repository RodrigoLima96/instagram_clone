import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String bio;
  final List followers;
  final List following;
  final String photoUrl;

  User({
    required this.uid,
    required this.username,
    required this.email,
    required this.bio,
    required this.followers,
    required this.following,
    required this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'bio': bio,
      'followers': followers,
      'following': following,
      'photoUrl': photoUrl,
    };
  }

  factory User.fromMap(DocumentSnapshot snap) {
    var map = snap.data() as Map<String, dynamic>;
    return User(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      bio: map['bio'] ?? '',
      followers: List.from(map['followers']),
      following: List.from(map['following']),
      photoUrl: map['photoUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
