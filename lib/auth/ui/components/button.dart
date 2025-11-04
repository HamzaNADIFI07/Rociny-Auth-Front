import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool loading;
  final Color color;

  const Button({super.key, required this.text, this.onPressed, this.loading=false, this.color = const Color(0xFF015845),});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: FilledButton(
        onPressed: loading ? null : onPressed,
        style: FilledButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: color,
        ),
        child: loading
            ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2))
            : Text(text, style: const TextStyle(fontSize: 16 , color: Colors.white,fontWeight: FontWeight.w500,)),
      ),
    );
  }
}
