import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yo_sugars/screens/profile/TabButton.dart';
import 'package:yo_sugars/screens/profile/TabLabel.dart';

// import '../packages_exporter.dart';
import 'profile_pic.dart';
// import 'sign_out_button.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({Key? key}) : super(key: key);
  @override
  _UserProfileBodyState createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  Future<String?> getInfor() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? personEmail = sharedPreferences.getString("email");
    return personEmail;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ProfilePic(),
          ),
          const Center(
            child: Text(
              "yosugar@gmail.com",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 30,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: Center(
          //     child: Text(
          //       "$getInfor()",
          //       textAlign: TextAlign.center,
          //       style: const TextStyle(
          //         color: Colors.white,
          //         fontSize: 17,
          //         letterSpacing: 0.5,
          //         fontWeight: FontWeight.w400,
          //         fontStyle: FontStyle.italic,
          //       ),
          //     ),
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                "+256 778 456783",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          // Spacer(flex: 2),
          // SignOutButton(),
          const SizedBox(height: 5.0),
          const TabLabel(
              label: 'Get Help',
              color: Colors.white,
              align: Alignment.centerLeft),
          const SizedBox(height: 10.0),
          TabButton(
            label: "Call Help Line",
            icon: Icons.phone_forwarded_outlined,
            page: () {
              launch("tel:+256789530574");
            },
          ),
          TabButton(
            label: "Report a problem",
            icon: Icons.mail,
            page: () {
              launch(
                  "mailto:arnoldrutanana@gmail.com.com?subject=Report%20Problem");
            },
          ),
          TabButton(
            label: 'Send Feedback',
            icon: Icons.feedback_outlined,
            page: () {
              launch(
                  "mailto:arnoldrutanana@gmail.com.com?subject=Report%20Problem");
            },
          ),
          const TabLabel(
            label: 'More',
            color: Colors.white,
            align: Alignment.centerLeft,
          ),
          const SizedBox(height: 10.0),
          ListButton(
            label: 'About',
            icon: Icons.help_outline,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
