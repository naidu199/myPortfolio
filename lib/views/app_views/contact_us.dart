import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/const/data.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:provider/provider.dart';

class CollaborationFormScreen extends StatefulWidget {
  const CollaborationFormScreen({super.key});

  @override
  _CollaborationFormScreenState createState() =>
      _CollaborationFormScreenState();
}

class _CollaborationFormScreenState extends State<CollaborationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _message = '';
  bool _isSending = false;

  Future<void> _sendMessage() async {
    setState(() {
      _isSending = true;
    });

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final responseToMe = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: '''
      {
        "service_id": "YOUR_SERVICE_ID",
        "template_id": "YOUR_TEMPLATE_ID_FOR_ME",
        "user_id": "YOUR_USER_ID",
        "template_params": {
          "name": "$_name",
          "email": "$_email",
          "message": "$_message"
        }
      }
      ''',
    );

    final responseToContact = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: '''
      {
        "service_id": "YOUR_SERVICE_ID",
        "template_id": "YOUR_TEMPLATE_ID_FOR_CONTACT",
        "user_id": "YOUR_USER_ID",
        "template_params": {
          "name": "$_name",
          "email": "$_email"
        }
      }
      ''',
    );

    setState(() {
      _isSending = false;
    });

    if (responseToMe.statusCode == 200 && responseToContact.statusCode == 200) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Message Sent!'),
          content: const Text(
              'Thank you for reaching out. We\'ll get back to you soon.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Something went wrong. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, _) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: inputDecoration(hintText: 'Name'),
                    onSaved: (value) {
                      _name = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: inputDecoration(hintText: 'Email'),
                    onSaved: (value) {
                      _email = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: inputDecoration(hintText: "Enter your message"),
                    onSaved: (value) {
                      _message = value!;
                    },
                    maxLines: 4,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your message';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  // _isSending
                  //     ? const Center(child: CircularProgressIndicator())
                  //     : ElevatedButton(
                  //         onPressed: () {
                  //           if (_formKey.currentState!.validate()) {
                  //             _formKey.currentState!.save();
                  //             _sendMessage();
                  //           }
                  //         },
                  //         child: const Text('Send Message'),
                  //       ),
                  CustomButton(
                    animate: true,
                    borderRadius: 20,
                    shadowColor: Colors.blueGrey[50],
                    isThreeD: true,
                    pressed: _isSending ? Pressed.pressed : Pressed.notPressed,
                    backgroundColor: Colors.deepPurpleAccent,
                    width: 220,
                    height: 60,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _sendMessage();
                      }
                    },
                    child: Text(
                      "Send Message",
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        // fontWeight: FontWeight.w600,
                        // letterSpacing: 1.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 40)
                        .copyWith(bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            state.launchAppUrl(linkedIn);
                          },
                          child: Image.asset(
                            "assets/icons/linkedin.png",
                            height: 76,
                            width: 76,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            state.launchAppUrl(github);
                          },
                          child: Image.asset(
                            "assets/icons/github.png",
                            height: 76,
                            width: 76,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            state.launchEmail();
                          },
                          child: Image.asset(
                            "assets/icons/email.png",
                            height: 68,
                            width: 68,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

InputDecoration inputDecoration({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      fontSize: 20,
      color: Colors.grey.shade600,
      fontWeight: FontWeight.w500,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Colors.blueAccent,
        width: 2.0,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.redAccent,
        width: 2.0,
      ),
    ),
    filled: true,
    fillColor: Colors.blue.shade50,
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Colors.redAccent,
        width: 2.0,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
    errorStyle: const TextStyle(
      fontSize: 16,
      color: Colors.redAccent,
      fontWeight: FontWeight.bold,
    ),
  );
}
