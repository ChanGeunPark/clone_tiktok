import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  // 상태를 가지는 위젯(변경할 수 있음)
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController =
      TextEditingController(); // 입력한 값을 가져올 수 있음

  String _password = "";
  bool _obscureText = true; // 어딘가에 이 값이 변경되지 않으면 vscode가 자동으로 final로 변경해줌

  @override
  void initState() {
    super.initState();

    // 기본값 설정
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  // addListener는 메모리 누수를 방지하기 위해 dispose 에서 제거해줘야 함
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length >= 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus(); // 포커스 해제
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void _onClearTap() {
    _passwordController.clear(); // 입력한 값 초기화
  }

  void toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0, // 그림자
          title: const Text(
            "Sign up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
            children: [
              Gaps.v40,
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,
                obscureText: _obscureText, // 비밀번호 입력 시 텍스트 숨김
                autocorrect: false, // 자동 수정 기능
                onEditingComplete: _onSubmit, // 디바이스 키보드에서 완료 버튼 눌렀을 때
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize:
                        MainAxisSize.min, // 최소한의 공간만 차지 (불필요한 공간 차지 방지)
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h8,
                      GestureDetector(
                        onTap: () => toggleObscureText(),
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Make it strong!",
                  enabledBorder: UnderlineInputBorder(
                    // 포커스 되지 않았을 때
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    // 포커스 되었을 때
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
              Gaps.v10,
              const Text("Your password must be at least 8 characters long.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.checkCircle,
                    size: Sizes.size20,
                    color: _isPasswordValid() ? Colors.green : Colors.grey,
                  ),
                  Gaps.h5,
                  Text(
                    "8 characters or longer",
                    style: TextStyle(
                      color: _isPasswordValid() ? Colors.green : Colors.grey,
                    ),
                  )
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(disabled: !_isPasswordValid()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
