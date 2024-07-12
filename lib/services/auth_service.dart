// lib/services/auth_service.dart
import 'package:flutter/material.dart';

class AuthService {
  // Simulação de autenticação
  Future<bool> login(String username, String password) async {
    // Simulando um atraso de rede
    await Future.delayed(Duration(seconds: 2));

    // Lógica fictícia de autenticação
    if (username == 'user' && password == 'password') {
      return true;
    } else {
      return false;
    }
  }
}
