import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../controller/login_google_controller.dart';

// import '../controller/login_google_controller.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({ super.key });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

// void validateEmail(){
//     final bool isValidate = EmailValidator.validate(txtEmail.text.trim());

//     if(isValidate){
//       loginLoad();
//     }else{
//       openDialogEmail();
//     }
//   }

//   void loginLoad(){  
//     if (formKey.currentState!.validate()) {
//       if(listUsers.any((u) => u.email == txtEmail.text && u.password == txtPassword.text)){
//         User user;
//         user = listUsers.singleWhere((u) => 
//           u.email == txtEmail.text && 
//           u.password == txtPassword.text
//         );
//         setState(() {
//           Navigator.pushNamed(
//             context, 
//             'screenListCategory', 
//             arguments: user.listTripCategory,
//           );
//         });
//       } else openDialog();
//     }
//   }



// ValueNotifier userCredential = ValueNotifier('');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text('Google SignIn Screen')),
//         body: ValueListenableBuilder(
//             valueListenable: userCredential,
//             builder: (context, value, child) {
//               return (userCredential.value == '' ||
//                       userCredential.value == null)
//                   ? Center(
//                       child: Card(
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         child: IconButton(
//                           iconSize: 40,
//                           icon: Icon(Icons.abc),
//                           onPressed: () async {
//                             userCredential.value = await signInWithGoogle();
//                             if (userCredential.value != null)
//                               print(userCredential.value.user!.email);
//                           },
//                         ),
//                       ),
//                     )
//                   : Center(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             clipBehavior: Clip.antiAlias,
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                     width: 1.5, color: Colors.black54)),
//                             child: Image.network(
//                                 userCredential.value.user!.photoURL.toString()),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Text(userCredential.value.user!.displayName
//                               .toString()),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Text(userCredential.value.user!.email.toString()),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           ElevatedButton(
//                               onPressed: () async {
//                                 // bool result = await signOutFromGoogle();
//                                 // if (result) userCredential.value = '';
//                               },
//                               child: const Text('Logout'))
//                         ],
//                       ),
//                     );
//             }));
   @override
   Widget build(BuildContext context) {
       return Scaffold(
          //  appBar: AppBar(title: const Text('Login Test'),),
           body: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 
                  // Icon
                  // 
                  const Icon(Icons.person),
                  // 
                  // Title
                  // 
                  const SizedBox(height: 25,),
                  const Text(
                    'First Step, lets create your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 15,),
                  // 
                  // Subtitle
                  // 
                  const Text(
                    'You can login with google, or create with another email address',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25,),
                  // 
                  // Button: Login with Google
                  // 
                  OutlinedButton.icon(
                    onPressed: () {
                      signInWithGoogle();

                      
                    }, 
                    label: const Text('Login with Google'),
                    // child: Text('Login with Google'),
                    icon: const Icon(Icons.face),
                    style: OutlinedButton.styleFrom(fixedSize: const Size.fromWidth(300.0)),
                    iconAlignment: IconAlignment.end,
                  ),
                  const SizedBox(height: 15,),
                  // 
                  // Button: Create an account with another email
                  // 
                  OutlinedButton.icon(
                    onPressed: ()=>{
                      Navigator.pushNamed(context, '/subscribe')
                    }, 
                    label: const Text('Create an account with another email'),
                    style: OutlinedButton.styleFrom(fixedSize: const Size.fromWidth(300.0)),
                    iconAlignment: IconAlignment.end,
                  ),
                  const SizedBox(height: 15,),
                  // 
                  // Button: Continue without login
                  // 
                  OutlinedButton.icon(
                    onPressed: ()=>{
                      Navigator.pushNamed(context, '/main')
                    }, 
                    label: const Text('Continue without login'),
                    // child: Text('Login with Google'),
                    style: OutlinedButton.styleFrom(fixedSize: const Size.fromWidth(300.0)),
                    iconAlignment: IconAlignment.end,
                  ),
                  const SizedBox(height: 15,),
                  // 
                  // Button: Continue without login
                  // 
                  OutlinedButton.icon(
                    onPressed: ()=>{
                      Navigator.pushNamed(context, '/loginwithemailandpassword')
                    }, 
                    label: const Text('Login with Email and Password'),
                    // child: Text('Login with Google'),
                    style: OutlinedButton.styleFrom(fixedSize: const Size.fromWidth(300.0)),
                    iconAlignment: IconAlignment.end,
                  )
                ],
              ),
            ),
           ),
       );
  }
}