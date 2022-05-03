import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Inputs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _userInputs = "your first input";

  void _stringCounter(String userInput) {
    setState(() {
      _counter = userInput.length;
    });
  }

  void _setUserInputs(String userInput) {
    setState(() {
      _userInputs = userInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'TextField: TextInputType.text: $_userInputs',
                hintText: 'your input',
              ),
              onSubmitted: (userInput) {
                _setUserInputs(userInput);
              },
            ),
            TextField(
              keyboardType: TextInputType.text,
              style: Theme.of(context).textTheme.headline5,
              decoration:
                  InputDecoration(labelText: 'character counter: $_counter'),
              //onSubmitted: (userInput){_stringCounter(userInput);},
              onChanged: (userInput) {
                _stringCounter(userInput);
              },
            ),
          ],
        ),
      ),
    );
  }
}
