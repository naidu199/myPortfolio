// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Contact {
  final String email;
  final String name;
  final String subject;
  final String message;

  Contact(
      {required this.email,
      required this.name,
      required this.subject,
      required this.message});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'subject': subject,
      'message': message,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      email: map['email'] as String,
      name: map['name'] as String,
      subject: map['subject'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source) as Map<String, dynamic>);
}
