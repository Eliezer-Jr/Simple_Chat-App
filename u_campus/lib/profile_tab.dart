// profile_tab.dart

import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/avatar.jpg'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Eliezer Ahorlu Mawuli Jr.',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'ahorlueliezer@gmail.com', // Replace with your email
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          const Text(
            'Frontend Developer',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Replace this with your logic to edit the profile
              print('Thank you for trying');
            },
            child: const Text('Edit Profile'),
          ),
          const SizedBox(height: 20),
          const Text(
            'About Me', // Section heading
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Hello! I am a passionate software engineer with a love for Flutter development.'
                ' In my free time, I enjoy reading, playing with computer codes, and exploring new technologies.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Contact Information', // Section heading
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Phone: 233 53 271 3417', // Replace with your phone number
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            'Address: Kasoa Ghana', // Replace with your address
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Social Media', // Section heading
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.facebook, () {
                // Replace with your logic to open Facebook profile
                print('Facebook icon tapped');
              }),

              _buildSocialIcon(Icons.link, () {
                // Replace with your logic to open LinkedIn profile
                print('LinkedIn icon tapped');
              }),
              _buildSocialIcon(Icons.code, () {
                // Replace with your logic to open GitHub profile
                print('GitHub icon tapped');
              }),
            ],
          ),
        ],
      ),
    );

  }

  Widget _buildSocialIcon(IconData iconData, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(iconData),
    );
  }
}
