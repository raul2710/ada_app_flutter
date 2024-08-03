
import 'package:cloud_firestore/cloud_firestore.dart';

class Person {

  final String? firstName;
  final String? lastName;
  final Timestamp? birthDate;
  final String? gender;

  Person({
    this.firstName, 
    this.lastName, 
    this.birthDate, 
    this.gender
  });

  factory Person.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Person(
      firstName: data?['firstName'],
      lastName: data?['lastName'],
      birthDate: data?['birthDate'],
      gender: data?['gender'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (firstName != null) "firstName": firstName,
      if (lastName != null) "lastName": lastName,
      if (birthDate != null) "birthDate": birthDate,
      if (gender != null) "gender": gender,
    };
  }
}