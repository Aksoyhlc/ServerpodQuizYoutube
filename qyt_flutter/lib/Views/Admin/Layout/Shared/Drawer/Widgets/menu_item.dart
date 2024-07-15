import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qyt_flutter/Const/const.dart';
import 'package:qyt_flutter/Extensions/num.dart';
import 'package:qyt_flutter/Mixins/state_tools.dart';

import 'sub_menu_item.dart';

class DrawerMenuItem extends StatefulWidget {
  const DrawerMenuItem({
    super.key,
    required this.name,
    required this.title,
    required this.icon,
    this.subMenuItems,
    this.textColor,
  });

  final String name;
  final String title;
  final IconData icon;
  final List<SubMenuItem>? subMenuItems;
  final Color? textColor;

  @override
  State<DrawerMenuItem> createState() => _DrawerMenuItemState();
}

class _DrawerMenuItemState extends State<DrawerMenuItem> with StateTools {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool selected = dc.selectedItem.value == widget.name;
      return InkWell(
        onTap: () async {
          dc.selectItem(context, widget.name);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        widget.icon,
                        color: widget.textColor ?? primaryColor,
                      ),
                      10.w,
                      Expanded(
                        child: Text(
                          widget.title,
                          style: GoogleFonts.quicksand(
                            color: widget.textColor ?? primaryColor,
                          ),
                        ),
                      ),
                      Icon(
                        widget.subMenuItems == null
                            ? Icons.keyboard_arrow_right_outlined
                            : selected
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_down_outlined,
                        color: widget.textColor ?? primaryColor,
                      )
                    ],
                  ),
                  AnimatedCrossFade(
                    firstChild: const SizedBox(),
                    secondChild: Container(
                      margin: const EdgeInsets.only(left: 20),
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        children: widget.subMenuItems ?? [],
                      ),
                    ),
                    crossFadeState: (selected && widget.subMenuItems != null)
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 400),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
