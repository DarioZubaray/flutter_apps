import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  static const String idTokenKey = 'idToken';

  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyDjnDSXMROStCk_vKDR6FLJalj9wBOt-Dw';

  final storage = const FlutterSecureStorage();

  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken') ) {
      await storage.write(key: idTokenKey, value: decodedResp['idToken']);
      return null;
    }

    return decodedResp['error']['message'];
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken') ) {
      await storage.write(key: idTokenKey, value: decodedResp['idToken']);
      return null;
    }

    return decodedResp['error']['message'];
  }

  Future logout() async {
    await storage.delete(key: idTokenKey);
    return;
  }

  Future<String> verifyToken() async {
    return await storage.read(key: idTokenKey) ?? '';
  }

}
