import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/password_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  // 상태를 가지는 위젯(변경할 수 있음)
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController =
      TextEditingController(); // 입력한 값을 가져올 수 있음

  String _email = "";

  @override
  void initState() {
    super.initState();

    // 기본값 설정
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  // addListener는 메모리 누수를 방지하기 위해 dispose 에서 제거해줘야 함
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;

    // perform same val
    final regExp = RegExp(
      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (!regExp.hasMatch(_email)) {
      return "email not valid";
    }
    return null;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus(); // 포커스 해제
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
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
                "What's your email?",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress, // 디바이스 키보드 이메일 형식
                autocorrect: false, // 자동 수정 기능
                onEditingComplete: _onSubmit, // 디바이스 키보드에서 완료 버튼 눌렀을 때
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: "Email address",
                  errorText: _isEmailValid(),
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
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                    disabled: _email.isEmpty || _isEmailValid() != null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
