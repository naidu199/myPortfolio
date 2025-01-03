import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portfolio/const/data.dart';
import 'package:portfolio/model/contact.dart';
import 'package:portfolio/providers/contact_service.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CollaborationFormScreen extends StatefulWidget {
  const CollaborationFormScreen({super.key});

  @override
  State<CollaborationFormScreen> createState() =>
      _CollaborationFormScreenState();
}

class _CollaborationFormScreenState extends State<CollaborationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String message = '';
  String subject = '';

  Future<void> _handleSubmit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    final messageProvider = context.read<ContactService>();

    final success = await messageProvider.sendMessage(
      name: name,
      email: email,
      message: message,
      subject: subject,
    );

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(success ? 'Message Sent!' : 'Error'),
        content: Text(success
            ? 'Thank you for reaching out. We\'ll get back to you soon.'
            : 'Something went wrong. Please try again later.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // if (success) Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ContactService contactService = Provider.of<ContactService>(context);
    return Consumer<ScreenState>(builder: (context, state, _) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade50,
              Colors.purple.shade50,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Let\'s Collaborate!',
                    textStyle: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 1,
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildAnimatedFormField(
                      field: TextFormField(
                        style: _inputTextStyle(),
                        decoration: inputDecoration(
                          hintText: 'Name',
                          icon: Icons.person_outline,
                        ),
                        onSaved: (value) => name = value!,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter your name' : null,
                      ),
                      delay: 200,
                    ),
                    const SizedBox(height: 20),
                    _buildAnimatedFormField(
                      field: TextFormField(
                        style: _inputTextStyle(),
                        decoration: inputDecoration(
                          hintText: 'Email',
                          icon: Icons.email_outlined,
                        ),
                        onSaved: (value) => email = value!,
                        validator: (value) => !value!.contains('@')
                            ? 'Please enter a valid email'
                            : null,
                      ),
                      delay: 400,
                    ),
                    const SizedBox(height: 20),
                    _buildAnimatedFormField(
                      field: TextFormField(
                        style: _inputTextStyle(),
                        decoration: inputDecoration(
                          hintText: 'Your Subject',
                          icon: Icons.subject,
                        ),
                        maxLines: 2,
                        onSaved: (value) => subject = value!,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter your subject' : null,
                      ),
                      delay: 600,
                    ),
                    const SizedBox(height: 20),
                    _buildAnimatedFormField(
                      field: TextFormField(
                        style: _inputTextStyle(),
                        decoration: inputDecoration(
                          hintText: 'Your Message',
                          icon: Icons.message_outlined,
                        ),
                        maxLines: 4,
                        onSaved: (value) => message = value!,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter your message' : null,
                      ),
                      delay: 800,
                    ),
                    const SizedBox(height: 30),
                    _buildSubmitButton(contactService: contactService),
                    const SizedBox(height: 40),
                    _buildSocialLinks(state),
                  ],
                ).animate(delay: 300.ms).fadeIn(duration: 500.ms),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildAnimatedFormField({
    required Widget field,
    required int delay,
  }) {
    return field
        .animate(delay: Duration(milliseconds: delay))
        .fadeIn()
        .slideX(begin: -0.2, end: 0);
  }

  Widget _buildSubmitButton({required ContactService contactService}) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Colors.deepPurple,
            Colors.deepPurpleAccent,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: contactService.isSending
            ? null
            : () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _handleSubmit(context);
                  contactService.success
                      ? _formKey.currentState!.reset()
                      : null;
                }
              },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: contactService.isSending
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                'Send Message',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    ).animate(delay: 800.ms).scale(duration: 400.ms);
  }

  Widget _buildSocialLinks(ScreenState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          'assets/icons/linkedin.png',
          () => state.launchAppUrl(linkedIn),
          0,
        ),
        _buildSocialButton(
          'assets/icons/github.png',
          () => state.launchAppUrl(github),
          200,
        ),
        _buildSocialButton(
          'assets/icons/email.png',
          () => state.launchEmail(),
          400,
        ),
      ],
    );
  }

  Widget _buildSocialButton(String asset, VoidCallback onTap, int delay) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          asset,
          height: 72,
          width: 72,
        )
            .animate(delay: Duration(milliseconds: delay))
            .scale(duration: 300.ms)
            .then()
            .shimmer(duration: 1000.ms),
      ),
    );
  }

  TextStyle _inputTextStyle() {
    return GoogleFonts.poppins(
      fontSize: 16,
      color: Colors.black87,
      fontWeight: FontWeight.w500,
    );
  }
}

InputDecoration inputDecoration({
  required String hintText,
  required IconData icon,
}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: GoogleFonts.poppins(
      fontSize: 16,
      color: Colors.grey.shade600,
      fontWeight: FontWeight.w400,
    ),
    prefixIcon: Icon(icon, color: Colors.deepPurple),
    border: _buildBorder(),
    enabledBorder: _buildBorder(),
    focusedBorder: _buildBorder(Colors.deepPurple),
    errorBorder: _buildBorder(Colors.redAccent),
    focusedErrorBorder: _buildBorder(Colors.redAccent),
    filled: true,
    fillColor: Colors.white.withOpacity(0.9),
    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    errorStyle: GoogleFonts.poppins(
      fontSize: 14,
      color: Colors.redAccent,
      fontWeight: FontWeight.w500,
    ),
  );
}

OutlineInputBorder _buildBorder([Color? color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(
      color: color ?? Colors.transparent,
      width: 2,
    ),
  );
}
