import 'package:flutter/material.dart';
import 'package:super_ops/const/my_colors.dart';
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
        fillColor: MyColors.textFieldFilled,
        hintText: "Search...",
        hintStyle: TextStyle(color: MyColors.lightBlack),
        suffixIcon: Icon(Icons.search, color: MyColors.lightBlack),
      ),
      onChanged: authorController.onSearch,
    );
  }
}
