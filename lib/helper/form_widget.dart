import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// TextFieldを生成する
createTextField({
  required String label,
  required Stream stream,
  required Function(String) changed,
  String hint = '',
  bool obscureText = false,
  keyboardType = TextInputType.text,
}) => Column(
  children: <Widget>[
    StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return TextField(
          // フロートラベル自体は、入力済と勘違いされてしまって、微妙という意見もある
          maxLengthEnforcement: MaxLengthEnforcement.none, decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
          ),
          enabled: true,
          keyboardType: keyboardType,
          maxLines: 1,
          maxLength: 20,
          obscureText: obscureText,
          onChanged: changed,
          textAlign: TextAlign.center,
        );
      },
    ),
    Text(hint),
  ],
);