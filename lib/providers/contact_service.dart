import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactService extends ChangeNotifier {
  bool _isSending = false;
  bool get isSending => _isSending;
  bool _success = false;
  bool get success => _success;
  final String serviceId = "service_rt7awip";
  final String templateIdForMe = "template_g1y04ue";
  final String templateIdForContact = "template_apnnx5k";
  final String userId = "aLBbDrd5CeQpn2Plb";
  Future<bool> sendMessage({
    required String name,
    required String email,
    required String message,
    required String subject,
  }) async {
    _isSending = true;
    notifyListeners();

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      final responseToMe = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "service_id": serviceId,
            "template_id": templateIdForMe,
            "user_id": userId,
            "template_params": {
              "from_name": name,
              "reply_to": email,
              "message": message,
              "subject": subject
            }
          },
        ),
      );

      final responseToContact = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "service_id": serviceId,
            "template_id": templateIdForContact,
            "user_id": userId,
            "template_params": {"to_name": name, "reply_to": email}
          },
        ),
      );

      _isSending = false;
      _success =
          responseToMe.statusCode == 200 && responseToContact.statusCode == 200;
      notifyListeners();

      return responseToMe.statusCode == 200 &&
          responseToContact.statusCode == 200;
    } catch (e) {
      _isSending = false;
      notifyListeners();
      return false;
    }
  }
}
