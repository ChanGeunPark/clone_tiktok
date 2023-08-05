import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.icon,
      required this.onTap,
      required this.selectIcon});

  final String text;
  final bool isSelected;
  final IconData icon;
  final Function onTap;
  final IconData selectIcon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Expanded는 가능한 만큼 확장시키는 widget
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: Colors.black,
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.6,
            duration: const Duration(milliseconds: 100),
            child: Column(
              // 컬럼은 세로공간을 다 차지하려면 경향이 있음.
              mainAxisSize: MainAxisSize.min, // 차지하려는 공간을 최소한으로 바꿔줌
              children: [
                FaIcon(
                  isSelected ? selectIcon : icon,
                  color: Colors.white,
                ),
                Gaps.v5,
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
