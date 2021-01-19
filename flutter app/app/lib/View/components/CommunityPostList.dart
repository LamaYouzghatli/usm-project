import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usm_mobile/Controllers/PostController.dart';
import 'PostCardsListView.dart';

class CommunityPostsBuilder extends StatefulWidget {
  const CommunityPostsBuilder({
    Key key,
  }) : super(key: key);

  @override
  _CommunityPostsBuilderState createState() => _CommunityPostsBuilderState();
}

class _CommunityPostsBuilderState extends State<CommunityPostsBuilder> {
  PostController postController;
  @override
  void initState() {
    super.initState();
    Get.put(PostController());
    postController = Get.find<PostController>();
    postController.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<PostController>(
        init: PostController(),
        builder: (_) => postController.postsList.length > 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    PostCardsListView(
                      postsList: postController.postsList,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 30,
                          bottom: 10,
                          left: Get.height * 0.1,
                          right: Get.height * 0.1),
                      child: Divider(
                        color: Color(0xAAB39DD8),
                        thickness: 5,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(
                        'COMMUNITY POSTS',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xAA616161),
                        ),
                      ),
                    ),
                    PostCardsListView(
                      postsList: postController.postsList,
                    ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
