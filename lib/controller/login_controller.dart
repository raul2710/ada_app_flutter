import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import '../view/util.dart';

class LoginController {
  //
  // CRIAR CONTA de um usuário no serviço Firebase Authentication
  //
  createUserWithEmailAndPassword(context, firstName, lastName, birthDate, emailAddress, password) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    ).then(
      (resultado) {
        //Usuário criado com sucesso!

        //Armazenar o NOME e UID do usuário no Firestore
        FirebaseFirestore.instance.collection("users").add(
          {
            "uid": resultado.user!.uid,
          },
        );

        // sucesso(context, 'Usuário criado com sucesso!');
        Navigator.pop(context);
      },
    ).catchError((e) {
      //Erro durante a criação do usuário
      switch (e.code) {
        case 'email-already-in-use':
          // erro(context, 'O email já foi cadastrado.');
          break;
        case 'invalid-email':
          // erro(context, 'O formato do e-mail é inválido.');
          break;
        default:
          // erro(context, 'ERRO: ${e.toString()}');
      }
    });
  }

  //
  // LOGIN de usuário a partir do provedor Email/Senha
  //
  signInWithEmailAndPassword(context, emailAddress, password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
      ).then((result) {
          // sucesso(context, 'Usuário autenticado com sucesso!');
          Navigator.pushNamed(context, 'main');
        }
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    // FirebaseAuth.instance
    //     .signInWithEmailAndPassword(
    //       email: emailAddress, 
    //       password: password
    //     )
    //     .then((resultado) {
          
    //   // sucesso(context, 'Usuário autenticado com sucesso!');
    //   // Navigator.pushNamed(context, 'main');

    // }).catchError((e) {
    //   print(e);
    //   switch (e.code) {
    //     case 'invalid-email':
    //       // erro(context, 'O formato do e-mail é inválido.');
    //     case 'invalid-credential':
    //       // erro(context, 'Usuário e/ou senha inválida.');
    //     default:
    //       // erro(context, 'ERRO: ${e.code.toString()}');
    //   }
    // });
  }

  sendPasswordResetEmail(context, email) {
    if (email.isNotEmpty) {
      FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      // sucesso(context, 'Email enviado com sucesso.');
    } else {
      // erro(context, 'Informe o email para recuperar a conta.');
    }
  }

  //
  // Sign out logged user
  //
  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  //
  // Return the UID (User Identifier) of user logged
  //
  idUsuarioLogado() {
    return FirebaseAuth.instance.currentUser!.uid;
  }
}