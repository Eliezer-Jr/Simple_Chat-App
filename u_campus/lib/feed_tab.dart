import 'package:flutter/material.dart';
import 'upsa_feed.dart';
import 'ug_feed.dart';
import 'knust_feed.dart';
import 'gimpa_feed.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';


class FeedTab extends StatelessWidget {
  final List<String> tweets = [
    'Just had a great time at the park!',
    'Loving the weather today ☀️',
    'Excited about the upcoming Flutter update!',
    'Having a wonderful day with friends!',
    'Enjoying the new features of Flutter 2.2!',
  ];

  void _navigateToCampusFeed(BuildContext context, String campus) {
    Navigator.pop(context); // Close the dialog first
    switch (campus) {
      case 'UPSA':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UPSAFeedScreen(),
          ),
        );
        break;
      case 'UG':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UGFeedScreen(),
          ),
        );
        break;
      case 'KNUST':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KNUSTFeedScreen(),
          ),
        );
        break;
      case 'GIMPA':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GIMPAFeedScreen(),
          ),
        );
        break;
      default:
      // Handle the case if the campus is not recognized
        break;
    }
  }
  void _showAddPostDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        // Open the camera and get the image
                        final image = await ImagePicker().getImage(source: ImageSource.camera);
                        // Do something with the image (e.g., upload to a server)
                      },
                      icon: Icon(Icons.camera_alt, color: Colors.white),
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      onPressed: () async {
                        // Open file picker to select a document
                        final result = await FilePicker.platform.pickFiles();
                        if (result != null) {
                          // Do something with the selected document (e.g., upload to a server)
                        }
                      },
                      icon: Icon(Icons.attach_file, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'What\'s on your mind?',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                _buildDialogOption(context, 'Post', () {
                  // Implement logic for posting the feed
                  Navigator.pop(context);
                }),
              ],
            ),
          ),
        );
      },
    );
  }


  Widget _buildDialogOption(BuildContext context, String title, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        primary: Colors.blue,
      ),
    );
  }

  // ... (previous code)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed Tab'),
      ),
      body: ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (context, index) {
          return _buildTweetCard(tweets[index]);
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildCampusOption(context, 'UPSA'),
                          _buildCampusOption(context, 'UG'),
                          _buildCampusOption(context, 'KNUST'),
                          _buildCampusOption(context, 'GIMPA'),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.school),
          ),
          SizedBox(width: 16), // Add spacing between the floating action buttons
          FloatingActionButton(
            onPressed: () {
              _showAddPostDialog(context);
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

// ... (previous code)


  Widget _buildTweetCard(String tweet) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(
          'Username',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(tweet),
        trailing: Icon(Icons.favorite_border),
      ),
    );
  }

  Widget _buildCampusOption(BuildContext context, String campus) {
    return InkWell(
      onTap: () {
        _navigateToCampusFeed(context, campus);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            campus,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
