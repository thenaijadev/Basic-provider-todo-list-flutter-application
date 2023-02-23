import "package:flutter/material.dart";

class Button extends StatelessWidget {
  const Button({super.key, this.onPress});
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress, child: const Text("Press me"));
  }
}
