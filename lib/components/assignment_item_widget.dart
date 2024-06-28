import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';

import '../core/constants.dart';
import '../core/models/assignment.dart';
import '../core/router_generator.dart';
import '../core/utils/helpers.dart';
import 'others_widget/space_height_custom.dart';

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
      onTap: (){
      Navigator.pushNamed(
                        context, RouterGenerator.detailAssignmentRoute, arguments: widget.data
                      );
      } ,
      child: Container(
        height: 100,
        margin: EdgeInsets.only(bottom: padding / 2),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.1),
              ),
              child: Center(
                child: Helpers.getSvg(widget.data.icon, width: 42, color: widget.color),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.data.title}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        if (widget.data.favoris == true)
                          GestureDetector(
                            onTap: togglePinned,
                            child: Icon(
                              isPinned ? Icons.bookmark : Icons.bookmark_outline,
                            ),
                          ),
                      ],
                    ),
                    Text(
                      "${widget.data.detail}",
                      style: TextStyle(fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.data.gain != null)
                          Text(
                            "${widget.data.gain}".formatCurrency(),
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        if (widget.data.gain == null)
                          Text(
                            "Non payé",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        if (widget.data.duration != null)
                          Text(
                            "${widget.data.duration} ${widget.data.time} restants",
                            style: TextStyle(fontSize: 10),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
