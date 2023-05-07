import 'package:calorie_calculator/models/task_model.dart';
import 'package:calorie_calculator/view/widgets/task_list_item.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Task> allTasks;
  CustomSearchDelegate({required this.allTasks});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query.isEmpty ? null : query = '';
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
        size: 24,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Task> filteredList = allTasks
        .where(
            (gorev) => gorev.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filteredList.length > 0
        ? ListView.builder(
            itemBuilder: (
              context,
              index,
            ) {
              var _oankiListeElemani = filteredList[index];
              return Dismissible(
                  background: Container(
                    color: Colors.red,
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  key: Key(_oankiListeElemani.id),
                  onDismissed: (direction) {
                    filteredList.removeAt(index);
                  },
                  child: TaskItem(task: _oankiListeElemani));
            },
            itemCount: filteredList.length,
          )
        : Center(
            child: Text("Aradığınız besin bulunmadı"),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
