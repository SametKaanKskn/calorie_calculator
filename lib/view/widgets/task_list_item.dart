import 'package:calorie_calculator/models/task_model.dart';
import 'package:calorie_calculator/view_modal/providers/food_api_provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  TextEditingController _taskNameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskNameController.text = widget.task.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10)
          ]),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            child: const Icon(Icons.check, color: Colors.white),
            decoration: BoxDecoration(
                color: widget.task.isCompleted ? Colors.white : Colors.white,
                border: Border.all(color: Colors.grey, width: 0.8),
                shape: BoxShape.circle),
          ),
        ),
        title: widget.task.isCompleted
            ? Text(
                widget.task.name,
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey),
              )
            : TextField(
                controller: _taskNameController,
                minLines: 1,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(border: InputBorder.none),
                onSubmitted: (yeniDeger) {
                  // if (yeniDeger.length > 3) {
                  //   widget.task.name = yeniDeger;
                  // }
                  Provider.of<FoodApiProvider>(context, listen: false)
                      .getNutrition(yeniDeger);
                }),
        trailing: Text(
          DateFormat.yMMMMEEEEd().format(widget.task.createdAt),
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
