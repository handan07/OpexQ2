import 'package:flutter/material.dart';
import 'package:opexq/utils/configuration.dart';

class SettingsWiew extends StatelessWidget {
  const SettingsWiew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "title",
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset(
                  "assets/icons/bell.png",
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/login.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text(
                    "Rebecca Lucas",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                settingItem(
                  title: "Contact Information",
                  icon: Icons.person_pin,
                ),
                settingItem(
                  title: "Change Password",
                  icon: Icons.lock_open,
                ),
                settingItem(
                  title: "Security",
                  icon: Icons.security,
                ),
                settingItem(
                  title: "Payment Privacy",
                  icon: Icons.payment,
                ),
                settingItem(
                  title: "Fees",
                  icon: Icons.attach_money,
                ),
                settingItem(
                  title: "Notifications",
                  icon: Icons.notifications_none,
                ),
                settingItem(
                  title: "Technical Support",
                  icon: Icons.headset,
                ),
              ],
            ),
          ),
        ));
  }

  Widget settingItem({String? title, IconData? icon}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 40,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            title ?? "",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
