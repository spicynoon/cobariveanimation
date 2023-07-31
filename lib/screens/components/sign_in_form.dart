import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email",
            style: TextStyle(color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset("assets/icons/email.svg")),
            ),
          ),
          const Text(
            "Password",
            style: TextStyle(color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: SvgPicture.asset("assets/icons/password.svg"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 24),
            child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: pinkAccent,
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ))),
                icon: const Icon(
                  CupertinoIcons.arrow_right,
                  color: pinkAccentDark,
                ),
                label: const Text("Sign In")),
          )
        ],
      ),
    );
  }
}
