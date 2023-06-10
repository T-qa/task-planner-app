import 'package:flutter/material.dart';
import 'package:task_planner_app/common/utils/constants.dart';

import 'bottom_tile.dart';

class TileExpansion extends StatelessWidget {
  final String text;
  final String text2;
  final void Function(bool)? onExpansionChanged;
  final Widget? trailing;
  final List<Widget> children;
  const TileExpansion({
    super.key,
    required this.text,
    required this.text2,
    this.onExpansionChanged,
    this.trailing,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstant.kBkLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstant.kRadius),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: BottomTile(
            text: text,
            text2: text2,
          ),
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          onExpansionChanged: onExpansionChanged,
          trailing: trailing,
          children: children,
        ),
      ),
    );
  }
}
