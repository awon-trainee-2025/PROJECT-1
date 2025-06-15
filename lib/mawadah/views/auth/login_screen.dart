import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController numberController = TextEditingController();
final FocusNode _phoneFocusNode = FocusNode();
bool _isPhoneFocused = false;

@override
void initState() {
  super.initState();
  _phoneFocusNode.addListener(() {
    setState(() {
      _isPhoneFocused = _phoneFocusNode.hasFocus;
    });
  });
}

@override
void dispose() {
  _phoneFocusNode.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6A42C2),
      body: Column(
        children: [
          // Top illustration
          Expanded(
            flex: 2,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: SvgPicture.asset(
                 'assets/images/loginPage.svg', // SVG asset
                 height: 283,
                 width: 439,
                ),
              ),
            ),
          ),
          // Bottom card
          SizedBox(
  height: 489, // Set your desired height
  child: Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter',
                          color: Colors.black
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Enter your number',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF69696B),
                        fontFamily: 'inter',
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          height: 45,
                          width: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: const Text(
                            '+966',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF69696b), fontFamily: 'inter'),
                          ),
                        ),
const SizedBox(width: 3),
SizedBox(
  height: 45, 
  width: 242,
  child: 
TextField(
  controller: numberController,
  focusNode: _phoneFocusNode,
  decoration: InputDecoration(
    hintText: 'Phone number',
    hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide.none,
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Color(0xFF6A42C2),
        width: 2,
      ),
    ),
    filled: true,
    fillColor: _isPhoneFocused ? Colors.white : const Color(0xFFF2F2F2),
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
    isDense: true,
  ),
  style: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontFamily: 'inter',
  ),
  keyboardType: TextInputType.number,
),
),
const SizedBox(width: 3),
                        SizedBox(
                          height: 45,
                          width: 95,
                          child: ElevatedButton(
                            onPressed: () {
  final phone = '+966${numberController.text.trim()}';
  Navigator.pushNamed(context, '/otp', arguments: phone);
},/*onPressed: () async {
  final phone = '+966${numberController.text.trim()}';
  try {
    await Supabase.instance.client.auth.signInWithOtp(
      phone: phone,
    );
    // Navigate to OTP screen or show success message
    // Example:
    Navigator.pushNamed(context, '/otp', arguments: phone);
  } catch (e) {
    // Show error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to send OTP: $e')),
    );
  }
},*/
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6A42C2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                            ),
child: const Text(
  'Send',
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'inter',
    letterSpacing: 1,
  ),
  

),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
  children: const [
    SizedBox(
      width: 189.85,
      child: Divider(
        color: Color(0xFFd6d6d6), // Set your desired color here
        thickness: 1,
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text('OR', style: TextStyle(color: Color(0xFF69696B))),
    ),
    SizedBox(
      width: 189.85,
      child: Divider(
        color: Color(0xFFd6d6d6), // Set your desired color here
        thickness: 1,
      ),
    ),
  ],
),
                    const SizedBox(height: 24),
                    Center(
                      child: SizedBox(
                        width: 374.85,
                        height: 60.25,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF6A42C2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'inter', letterSpacing: 1.2),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Center(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: SizedBox(
      width: double.infinity, // Makes it responsive to device width
      child: Text.rich(
        TextSpan(
          text: 'By signing up, you agree to our ',
          style: TextStyle(fontSize: 13, color: Color(0xff919191), fontWeight: FontWeight.w500, fontFamily: 'inter'),
          children: [
            TextSpan(
              text: 'Terms & Conditions',
              style: TextStyle(
                color: Color(0xff919191), // Same grey as the rest
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(text: ', acknowledge our '),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                color: Color(0xff919191), // Same grey as the rest
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(text: ', and confirm that you\'re over 18.'),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    ),
  ),
),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}