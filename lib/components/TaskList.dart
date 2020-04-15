import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whattodo/task_data.dart';

import 'TaskTile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              title: task.name,
              check: task.isDone,
              callback: (newValue) {
                taskData.updateTask(task);
              },
              longpresscallback: () {
                taskData.delete(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
