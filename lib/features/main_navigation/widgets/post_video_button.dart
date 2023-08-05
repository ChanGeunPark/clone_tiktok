import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatefulWidget {
  const PostVideoButton({super.key});

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Stack의 자식들이 Stack 밖으로 나갈 수 있게 해준다.
      children: [
        // position은 기준점이 있어야 한다.
        Positioned(
          right: 20,
          child: Container(
            height: 30,
            width: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            height: 30,
            width: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ),
        Container(
          height: 30,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
              child: FaIcon(
            FontAwesomeIcons.plus,
            color: Colors.black,
          )),
        )
      ],
    );
  }
}
