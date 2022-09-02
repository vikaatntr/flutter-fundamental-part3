import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormContoh extends StatefulWidget {
  const FormContoh({Key? key}) : super(key: key);

  @override
  State<FormContoh> createState() => _FormContohState();
}

class _FormContohState extends State<FormContoh> {
  final _controller = TextEditingController.fromValue(
      const TextEditingValue(text: "Initial Value"));

  final _key = GlobalKey<FormFieldState<String>>();
  String _textValue = "";

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _textValue = _controller.text;
      });
    });

    super.initState();
  }

  Widget build(BuildContext topContext) {
    return Form(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text("Text: "),
        Text(
          _textValue,
          style: Theme.of(context).textTheme.headline3,
        ),
        TextFormField(
          controller: _controller,
          validator: (String? value) {
            return value == null || value.isEmpty ? "Tidak Boleh Kosong" : null;
          },
        ),
        TextFormField(),
        Builder(
            builder: (BuildContext subContext) => TextButton(
                onPressed: () {
                  final valid = Form.of(subContext)!.validate();
                  if (kDebugMode) {
                    print("valid : $valid");
                  }
                  if (valid) {
                    setState(() {
                      _textValue = _controller.text;
                    });
                  }
                },
                child: const Text("validate"))),
        
      ],
    ));
  }
}
