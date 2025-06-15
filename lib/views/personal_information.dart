import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masaar/widgets/custom_button.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset('images/back_button.png'),
          ),
        ),
        title: const Text(
          'Personal Information',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    // Your form fields and images here
                    InkWell(
                      onTap: () => print('Image tapped'),
                      child: Image.asset(
                        'images/profile_upload.png',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Add a profile picture so drivers can recognize you',
                      style: TextStyle(
                        color: Color(0xFF919191),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: firstNameController,
                            decoration: const InputDecoration(
                              labelText: 'First name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: lastNameController,
                            decoration: const InputDecoration(
                              labelText: 'Last name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'username@example.com',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomButton(
                text: 'Save changes',
                onPressed: () => print('Save button pressed'),
                isActive: true,
              ),
            ),
            const SizedBox(height: 24), // Bottom padding
          ],
        ),
      ),
    );
  }
}
