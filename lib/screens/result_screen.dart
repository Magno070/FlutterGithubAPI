import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_application_6/models/user.dart';

class ResultScreen extends StatelessWidget {
  final String username;
  const ResultScreen({super.key, required this.username});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RESULTADOS')),
      body: Center(
        child: FutureBuilder(
          future: _pegarFetchUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final user = snapshot.data;
              return Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          user!.naoPrecisaSerIgualoJSONname,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 3),
                          ),
                          height: 100,
                          width: 100,
                          child: ClipOval(
                            child: Image.network(
                              user.avatarUrl,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('User: ${user.nickName}'),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16),
                        Text('Seguidores: ${user.followers}'),
                        Text('Seguindo: ${user.following}'),
                        SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            _abrirURL(user.htmlUrl);
                          },
                          child: Text(
                            user.htmlUrl,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text('Criado em: ${formatarData(user.createdAt)}'),
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(
                'Erro da Snapshot: ${snapshot.error}',
                textAlign: TextAlign.center,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<User> _pegarFetchUser() async {
    var url = Uri.parse('https://api.github.com/users/$username');
    var resposta = await http.get(url);
    if (resposta.statusCode == 200) {
      var minhaJsonVariavel = json.decode(resposta.body);
      return User.fromJson(minhaJsonVariavel);
    } else {
      throw Exception('Failed to load user: ${resposta.statusCode}');
    }
  }

  void _abrirURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Não foi possível abrir $url';
    }
  }
}
