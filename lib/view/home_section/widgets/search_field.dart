import 'package:flutter/material.dart';
import 'package:super_ops/controllers/author_controller.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.authorController,
  }) : super(key: key);

  final AuthorController authorController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 24.0),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none),
        fillColor: const Color(0xFFF5F5F5),
        hintText: "Search...",
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      onChanged: authorController.onSearch,
    );
  }
}
