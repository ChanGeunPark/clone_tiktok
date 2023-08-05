import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1, // 부모의 크기를 기준으로 자식의 크기를 정한다. %로 정한다.

      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size20,
        ), // padding y-16
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size4),
          border: Border.all(
            color: Colors.grey[200]!,
            width: Sizes.size1,
          ),
        ),
        child: Stack(
          // 자식 위젯을 겹쳐서 배치한다. 모든 자식들 absolute

          alignment: Alignment.center,

          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: icon,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
