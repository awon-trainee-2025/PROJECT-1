import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masaar/views/Account/personal_information.dart';
import 'package:masaar/views/Account/saved_locations.dart';
import 'package:masaar/widgets/settings_widgets/settings_items.dart';
import 'package:masaar/widgets/settings_widgets/settings_header.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                // Profile Picture + Username
                Image(image: AssetImage('images/profile_placeholder.png')),
                SizedBox(height: 16),
                Text(
                  'Ahmad Sindi',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                SizedBox(height: 20),
                Text(
                  'Complete your profile',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Text(
                  'Add email & photo to get the best experience',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF69696B),
                  ),
                ),
                SizedBox(height: 36),
                // header
                SettingsHeader(title: 'Profile Settings'),
                // items
                SettingsItem(
                  image: Image.asset('images/user.png'),
                  title: 'Personal Information',
                  onTap: () {
                    Get.to(
                      PersonalInformation(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 300),
                    );
                  },
                ),
                SettingsItem(
                  image: Image.asset('images/earth.png'),
                  title: 'Language',
                  onTap: () {},
                ),
                SizedBox(height: 10),
                // header
                SettingsHeader(title: 'Payments & Activities'),
                // items
                SettingsItem(
                  image: Image.asset('images/wallet.png'),
                  title: 'Wallet',
                  onTap: () {},
                ),
                SettingsItem(
                  image: Image.asset('images/location.png'),
                  title: 'Saved Locations',
                  onTap: () {
                    Get.to(
                      SavedLocationsPage(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 300),
                    );
                  },
                ),
                SizedBox(height: 10),
                // header
                SettingsHeader(title: 'Account Management'),
                // items
                SettingsItem(
                  image: Image.asset('images/logout.png'),
                  title: 'Log out',
                  onTap: () {},
                ),
                SettingsItem(
                  image: Image.asset('images/delete.png'),
                  title: 'Delete Account',
                  color: Color(0xFFAC0404),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
