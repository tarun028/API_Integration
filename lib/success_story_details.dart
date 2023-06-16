import 'package:flutter/material.dart';
import 'package:flutter_matrimonial_task/success_story.dart';
import 'webview_page.dart';


class SuccessStoryDetailsPage extends StatelessWidget {
  final SuccessStory successStory;

  SuccessStoryDetailsPage({required this.successStory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(successStory.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              successStory.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              successStory.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewPage(url: successStory.title),
                  ),
                );
              },
              child: Text('Read More'),
            ),
          ],
        ),
      ),
    );
  }
}
