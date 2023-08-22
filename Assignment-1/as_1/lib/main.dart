import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair= appState.current;
    return Scaffold(
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width:300,
              decoration: BoxDecoration(
                  color: Colors.blueGrey, // Set the background color
                  borderRadius: BorderRadius.circular(8), // Add border radius if needed
                ),
            child: TextFormField(
              minLines: 2,
              maxLines: 5,
              decoration: InputDecoration(
                enabled: true,
                hintStyle: TextStyle(
                  color: Colors.greenAccent,
                 ),
                 border:OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                 ) 
          
              ),
            ),
            ),
            SizedBox(height: 15),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      fixedSize: Size(150, 60), // Increase width and height
                    ),
                    child: Text('+',  style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      fixedSize: Size(150, 60), // Increase width and height
                    ),
                    child: Text('-',  style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height:10),
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      fixedSize: Size(150, 60), // Increase width and height
                    ),
                    child: Text('x', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      fixedSize: Size(150, 60), // Increase width and height
                    ),
                    child: Text('=', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
      
          ],
        ),
      ),
    );
  }
}