import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {}; // 폼 데이터 state 설정

  void _onSubmitTap() {
    // 폼의 상태를 검증

    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
          // pushAndRemoveUntil -> 현재 화면을 제거하고 새로운 화면을 띄움
          MaterialPageRoute(
            builder: (context) => const InterestsScreen(),
          ),
          (route) => false, // false를 반환하면 현재 화면을 제거하고 새로운 화면을 띄움
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size28),
        child: Form(
          key: _formKey,
          // GlobalKey는 고유 식별자 역할을 하고, 폼의 state에도 접근할 수 있고, 폼의 메서드를 호출할 수 있음
          // GlobalKey<FormState>를 사용하면 Form의 상태를 얻을 수 있음

          child: Column(
            children: [
              Gaps.v28,
              TextFormField(
                decoration: const InputDecoration(hintText: "Email"),
                validator: (value) {
                  if (value == null) {
                    return "Please write your email";
                  }
                  return null;
                },
                onSaved: (value) {
                  // 폼 저장 함수 설정
                  if (value != null) {
                    formData["email"] = value;
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                decoration: const InputDecoration(hintText: "password"),
                validator: (value) {
                  if (value == null) {
                    return "Please write your password";
                  }
                  // 검증 함수 설정
                  return null;
                },
                onSaved: (value) {
                  // 폼 저장 함수 설정
                  if (value != null) {
                    formData["password"] = value;
                  }
                },
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmitTap,
                child: const FormButton(
                  disabled: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
