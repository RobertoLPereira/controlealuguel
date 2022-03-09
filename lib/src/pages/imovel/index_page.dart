// ignore_for_file: unused_import

import 'dart:convert';

import 'package:controlealuguel/src/models/pessoas/pessoas_wrap.dart';
import 'package:controlealuguel/src/utils/consultas_genericas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final uriREST = Uri.parse(
      'https://apialugueis.herokuapp.com/Consultar/' + vw_listacontatosWrap);
  var primary = Color(0xff4f359b);
  var white = Color(0xffffffff);
  var listPessoasWrap;
  var url;
  List users = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    this.fetchUser();
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    print(uriREST);
    var response = await http.get(uriREST);
    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        users = items;
        listPessoasWrap = items;
        isLoading = false;
      });
    } else {
      users = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listing Users"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (users.contains(null) || users.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(primary),
      ));
    }
    return ListView.builder(
        itemCount: listPessoasWrap.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

  Widget getCard(item) {
    var profileUrl;
    var fullName = item['nome'];
    var email = item['enddereco'];
    if (item['url_avatar'] == null) {
      profileUrl =
          'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png';
    } else {
      profileUrl = item['url_avatar'];
    }
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(60 / 2),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(profileUrl))),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text(
                        fullName,
                        style: TextStyle(fontSize: 17),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    email.toString(),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
