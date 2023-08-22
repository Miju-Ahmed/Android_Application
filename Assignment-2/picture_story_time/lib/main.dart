import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'story.dart';

void main() {
  runApp(PictureStoryApp());
}

class PictureStoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StoryProvider(),
      child: MaterialApp(
        title: 'Picture Story Time',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StoryListScreen(),
      ),
    );
  }
}

class StoryProvider extends ChangeNotifier {
  List<Story> _stories = [
    Story(
      title: 'Adventure Story',
      imageUrls: ['url1', 'url2', 'url3'],
    ),
    // Add more stories here
  ];

  List<Story> get stories => _stories;
}

class StoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storyProvider = Provider.of<StoryProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Picture Story Time')),
      body: ListView.builder(
        itemCount: storyProvider.stories.length,
        itemBuilder: (context, index) {
          final story = storyProvider.stories[index];
          return ListTile(
            title: Text(story.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryDetailScreen(story: story),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class StoryDetailScreen extends StatelessWidget {
  final Story story;

  StoryDetailScreen({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(story.title)),
      body: ListView.builder(
        itemCount: story.imageUrls.length,
        itemBuilder: (context, index) {
          final imageUrl = story.imageUrls[index];
          return Image.network(imageUrl);
        },
      ),
    );
  }
}
