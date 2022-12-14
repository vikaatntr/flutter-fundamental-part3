import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental_3/basic_widget/forms.dart';
import 'package:flutter_fundamental_3/basic_widget/image_widget.dart';
import 'package:flutter_fundamental_3/basic_widget/input_fields.dart';

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
      home: const MyHomePage(title: 'Praktikum 18'),
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
  final TextEditingController _controller = TextEditingController.fromValue(
      const TextEditingValue(text: "isi angka saja"));

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: GestureDetector(
        onLongPress: _incrementCounter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
     child: Column(
     mainAxisSize: MainAxisSize.min,
     children: <Widget>[
              VerificationCodeFormField(controller: _controller),
               Builder(
                builder: (BuildContext subContext) => ElevatedButton(
                  onPressed: () {
                     final valid = Form.of(subContext)?.validate();
                        if (kDebugMode) {
                          print("valid: $valid");
                        }
                      },
                  child: const Text("validate"),
                ),
              )
           ],
        ),
),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
