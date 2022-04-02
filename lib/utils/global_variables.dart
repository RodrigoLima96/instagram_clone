import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/addPost/add_post_page.dart';
import 'package:instagram_clone/pages/feed/feed_page.dart';

const webPageSize = 600;

List<Widget> homePageItems = [
  const FeedPage(),
  const Text('search'),
  const AddPostPage(),
  const Text('like'),
  const Text('profile'),
];
