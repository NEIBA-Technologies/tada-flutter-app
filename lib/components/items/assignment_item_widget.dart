import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';

import '../../core/constants.dart';
import '../../core/models/assignment.dart';
import '../../core/router_generator.dart';
import '../../core/utils/helpers.dart';

class AssignmentItemWidget extends StatefulWidget {
  AssignmentItemWidget({
    super.key,
    required this.data,
    required this.color,
    this.ispinned = false,
  });

  final Assignment data;
  final MaterialColor color;
  final bool ispinned;

  @override
  State<AssignmentItemWidget> createState() => _AssignmentItemWidgetState();
}

class _AssignmentItemWidgetState extends State<AssignmentItemWidget> {
  late bool isPinned;

  @override
  void initState() {
    super.initState();
    isPinned = widget.ispinned;
  }

  void togglePinned() {
    setState(() {
      isPinned = !isPinned;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterGenerator.detailAssignmentRoute,
            arguments: widget.data);
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 10),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        color: widget.color.withOpacity(0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Helpers.getSvg(widget.data.icon,
                  height: 25, color: widget.color),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            widget.data.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.titleSmall
                                .copyWith(fontFamily: fontPrimary),
                          ),
                        ),
                        if (widget.data.favoris == true)
                          GestureDetector(
                            onTap: togglePinned,
                            child: Icon(
                              isPinned
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              size: 17,
                            ),
                          ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        widget.data.detail,
                        style: context.labelSmall!.copyWith(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.data.gain != null)
                          _buildChildText(
                              "${widget.data.gain}".formatCurrency()),
                        if (widget.data.gain == null)
                          _buildChildText("Non payé"),
                        if (widget.data.duration != null &&
                            widget.data.type == MissionType.Spontaneous)
                          _buildChildText(
                              "${widget.data.duration} ${widget.data.time} restants",
                              time: true),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  get styleBuildChild {
    return context.titleSmall!.copyWith(fontFamily: fontPrimary, fontSize: 12);
  }

  _buildChildText(String label, {bool time = false}) {
    return Flexible(
      child: Text(label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: time
              ? context.labelSmall!.copyWith(fontSize: 12)
              : styleBuildChild),
    );
  }
}
