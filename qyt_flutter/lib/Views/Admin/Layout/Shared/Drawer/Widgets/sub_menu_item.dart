import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qyt_flutter/Const/const.dart';
import 'package:qyt_flutter/Extensions/context.dart';
import 'package:qyt_flutter/Mixins/state_tools.dart';
import 'package:qyt_flutter/Views/Admin/Question/add_edit.dart';

class SubMenuItem extends StatefulWidget {
  const SubMenuItem({
    super.key,
    required this.name,
    required this.title,
    required this.parentName,
  });
  final String name;
  final String title;
  final String parentName;

  @override
  State<SubMenuItem> createState() => _SubMenuItemState();
}

class _SubMenuItemState extends State<SubMenuItem> with StateTools {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: false,
      child: InkWell(
        onTap: () {
          if (widget.name == "questionAdd") {
            context.to(const QuestionCrud());
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style:
                      GoogleFonts.quicksand(color: primaryColor, fontSize: 15),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: primaryColor,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
