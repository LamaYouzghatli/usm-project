import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usm_mobile/Models/PostModel.dart';
import 'package:usm_mobile/View/components/PostCard.dart';
import 'package:usm_mobile/View/components/PostCardDivider.dart';

class PostCardsListView extends StatefulWidget {
  final List<Post> postsList;
  PostCardsListView({Key key, this.postsList}) : super(key: key);

  @override
  _PostCardsListViewState createState() => _PostCardsListViewState();
}

class _PostCardsListViewState extends State<PostCardsListView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, top: 2, bottom: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          height: Get.height * 0.3,
          child: ListView.separated(
            itemCount: this.widget.postsList.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  PostCard(
                    post: this.widget.postsList[index],
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return PostCardDivider();
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Positioned(
          top: Get.height * 0.125,
          left: 10,
          child: CircleAvatar(
            radius: 11,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 10,
                child: new IconButton(
                  padding: new EdgeInsets.all(0.0),
                  color: Colors.black,
                  icon: new Icon(Icons.keyboard_arrow_left, size: 18.0),
                  onPressed: () => {},
                )),
          ),
        ),
        Positioned(
          top: Get.height * 0.125,
          right: 10,
          child: CircleAvatar(
            radius: 11,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 10,
                child: new IconButton(
                  padding: new EdgeInsets.all(0.0),
                  color: Colors.black,
                  icon: new Icon(Icons.keyboard_arrow_right, size: 18.0),
                  onPressed: () => {},
                )),
          ),
        ),
      ],
    );
  }
}
