import 'package:flutter/material.dart';
import '../../subScreens/refactoring/styles.dart';
import 'package:share_plus/share_plus.dart';
import 'about.dart';
import 'privacy.dart';
import 'reset.dart';
import 'terms.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: cardColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 200,
              color: bgColor,
              child: const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Image(image: AssetImage('assets/images/Logo.png')),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutScreen()));
              },
            ),
            const Divider(
              height: 2.0,
            ),
            ListTile(
              leading: const Icon(Icons.restart_alt),
              title: const Text('Reset'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: graphBlue,
                        title: const Row(
                          children: [
                            Text('Reset',
                                style: TextStyle(
                                    fontFamily: 'inder',
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        content: SizedBox(
                          height: 90,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Are you sure want to reset \nentire data?',
                                style: TextStyle(fontFamily: 'inder'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        resetMM(context);
                                      },
                                      child: const Text('Ok',
                                          style: TextStyle(fontSize: 15)))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
            const Divider(
              height: 2.0,
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: () {
                Share.share("https://play.google.com/store/apps/details?id=in.brototype.money_map");
              },
            ),
            const Divider(
              height: 2.0,
            ),
            ListTile(
              leading: const Icon(Icons.text_snippet),
              title: const Text('Terms & Conditions'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsScreen(),
                    ));
              },
            ),
            const Divider(
              height: 2.0,
            ),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyScreen(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
