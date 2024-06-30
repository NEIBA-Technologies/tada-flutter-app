import 'package:flutter/material.dart';
import 'package:tada/components/layouts/scaffold_page.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/models/page_route_setting.dart';

import '../../../components/others_widget/icon_close.dart';
import '../../../core/constants.dart';

class DisplayMenuScreen extends StatefulWidget {
  final PageRouteSetting params;

  const DisplayMenuScreen({super.key, required this.params});

  @override
  State<DisplayMenuScreen> createState() => _DisplayMenuScreenState();
}

class _DisplayMenuScreenState extends State<DisplayMenuScreen> {
  String font = fontSecondary;

  PageRouteSetting? selected;

  bool expansionChanged = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      titlePage: widget.params.title,
      actions: [IconClose()],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceHeightCustom(breakPoint: BreakPoint.md),
            ...widget.params.children.map(
              (child) => GestureDetector(
                onTap: () {
                  child.onClick();
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: ShapeDecoration(
                    shape: context.shape,
                    shadows: isOpen(child) ? [] : boxShadowSM,
                    color: isOpen(child) ? greyColor.shade50 : Colors.white,
                  ),
                  child: AbsorbPointer(
                    absorbing:
                        child.checkIsExternalLink || child.children.isEmpty,
                    child: ExpansionTile(
                      trailing: child.checkIsExternalLink || child.hasRouteName
                          ? const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 18,
                            )
                          : null,
                      onExpansionChanged: (value) {
                        setState(() {
                          selected = child;
                          expansionChanged = value;
                        });
                      },
                      title: Text(
                        child.title,
                        style: context.titleMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          fontFamily: expansionChanged && isOpen(child)
                              ? fontPrimary
                              : fontSecondary,
                        ),
                      ),
                      children: [
                        ...child.children.map(
                          (it) => GestureDetector(
                            onTap: () {
                              print('child.children ${it.routeName}');
                              it.onClick();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: padding * 1.2,
                                horizontal: padding,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  bottom: child.children.last.title != it.title
                                      ? BorderSide.none
                                      : BorderSide(
                                          color: context.theme.dividerColor,
                                          width: 1,
                                        ),
                                ),
                              ),
                              child: Text(
                                it.title,
                                style: context.titleSmall,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isOpen(PageRouteSetting child) => selected?.title == child.title;
}
