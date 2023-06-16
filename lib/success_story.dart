import 'package:flutter/material.dart';
import 'api_service.dart';
import 'success_story_details.dart';

class SuccessStory {
  final String title;
  final String description;
  final String url;
  SuccessStory({required this.title, required this.description,required this.url,});

  get webViewController => null;
}

class SuccessStoryPage extends StatefulWidget {
  @override
  _SuccessStoryPageState createState() => _SuccessStoryPageState();
}

class _SuccessStoryPageState extends State<SuccessStoryPage> {
  ApiService _apiService = ApiService();
  List<SuccessStory> _successStories = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchSuccessStories();
  }

  void _fetchSuccessStories() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<SuccessStory> stories = await _apiService.fetchSuccessStories();
      setState(() {
        _successStories = stories;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success Stories'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _successStories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_successStories[index].title),
                  subtitle: Text(_successStories[index].description),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessStoryDetailsPage(
                          successStory: _successStories[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
