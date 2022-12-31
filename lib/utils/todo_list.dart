import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Task extends StatelessWidget {
  final Color tasksColor;
  final String task;
  final bool val;
  final Function(bool?)? onChange;
  final Function(BuildContext)? deleteFunction;
  const Task({
    super.key,
    required this.tasksColor,
    required this.val,
    required this.task,
    this.onChange,
    this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
            )
          ],
        ),
        child: Container(
          color: Colors.white,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  StatefulBuilder(builder: ((context, setState) {
                    return Transform.scale(
                      scale: 0.8,
                      child: Checkbox(
                        value: val,
                        onChanged: onChange,
                      ),
                    );
                  })),
                  Text(
                    task,
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 18,
                        decoration: val
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              ),
              VerticalDivider(
                color: tasksColor,
                thickness: 5,
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
