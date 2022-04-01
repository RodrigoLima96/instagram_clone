import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;
  // ignore: prefer_typing_uninitialized_variables
  final likes;

  const Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'uid': uid,
      'username': username,
      'postId': postId,
      'datePublished': datePublished,
      'postUrl': postUrl,
      'profImage': profImage,
      'likes': likes,
    };
  }

  factory Post.fromMap(DocumentSnapshot snap) {
    var map = snap.data() as Map<String, dynamic>;
    return Post(
      description: map['description'] ?? '',
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      postId: map['postId'] ?? '',
      datePublished: map['datePublished'] ?? '',
      postUrl: map['postUrl'],
      profImage: map['profImage'],
      likes: map['likes'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));
}
