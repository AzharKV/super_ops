import 'package:flutter/material.dart';

class OutlinedDeletedButton extends StatelessWidget {
  const OutlinedDeletedButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 2.0, color: Colors.red),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      ),
      child: const Text(
        "Delete",
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
