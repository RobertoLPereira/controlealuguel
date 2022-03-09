// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widget_tree.dart';

part 'sign_in_http.g.dart';

@JsonSerializable()
class FormData {
  String email;
  String password;

  FormData({
    this.email,
    this.password,
  });

  factory FormData.fromJson(Map<String, dynamic> json) =>
      _$FormDataFromJson(json);

  Map<String, dynamic> toJson() => _$FormDataToJson(this);
}

class SignInHttpDemo extends StatefulWidget {
  final http.Client httpClient;

  const SignInHttpDemo({
    this.httpClient,
    Key key,
  }) : super(key: key);

  @override
  _SignInHttpDemoState createState() => _SignInHttpDemoState();
}

class _SignInHttpDemoState extends State<SignInHttpDemo> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var mask = MaskTextInputFormatter(mask: '##(##) # ####-####');
  FormData formData = FormData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autenticação'),
      ),
      body: Form(
        key: _formkey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...[
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Por favor informe um E-Mail válido';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_emailController.text)) {
                        return 'Por favor, digite um e-mail correto';
                      }
                      return null;
                    },
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: 'Seu endereço de E-Mail',
                      labelText: 'Email',
                    ),
                    onChanged: (value) {
                      formData.email = value;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [mask],
                    validator: (tel) {
                      if (tel == null || tel.isEmpty) {
                        return 'Por favor informe um E-Mainúmero de Celular válido';
                      } else if (tel.length < 14) {
                        return 'Por favor, digite um número correto';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Password',
                        hintText: '(99) 9 9999-9999'),
                    obscureText: true,
                    onChanged: (value) {
                      formData.password = value;
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Sign in'),
                    onPressed: () async {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      bool ok = await login();
                      if (_formkey.currentState.validate()) {
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }

                        if (ok) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WidgetTree(),
                              ));
                        } else {
                          _passwordController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                  ),
                ].expand(
                  (widget) => [
                    widget,
                    const SizedBox(
                      height: 24,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final snackBar = SnackBar(
    content: Text(
      'Senha incorreta',
      textAlign: TextAlign.center,
    ),
  );
  Future<bool> login() async {
    print('login');
    SharedPreferences shp = await SharedPreferences.getInstance();
    var tel = _passwordController.text
        .replaceAll(" ", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("-", "");
    var result = await http.get(
        Uri.parse('https://apialugueis.herokuapp.com/ValidarLogin/' + tel));
    if (result.statusCode == 204) {
      _showDialog('Successfully signed in.');
      await shp.setString('Token', tel);
      return true;
    } else if (result.statusCode == 412) {
      _showDialog('Login incorreto.');
    } else {
      _showDialog('Por favor. Digite os dados necessários.');
    }
    return false;
  }

  void _showDialog(String message) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
