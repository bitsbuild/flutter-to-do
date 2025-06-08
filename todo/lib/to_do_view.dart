import 'package:flutter/material.dart';

class ToDoView extends StatefulWidget {
  List<String> toDoList;
  ValueChanged<List<String>> func;
  ToDoView({super.key, required this.toDoList, required this.func});
  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      // height: 600,
      // width: double.infinity,
      child: ListView.builder(
        itemCount: widget.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(widget.toDoList),
            onDismissed: (direction) {
              widget.func(
                List.from(widget.toDoList)..remove(widget.toDoList[index]),
              );
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 130,
                  width: double.infinity,
                  child: Card(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Center(
                            child: Text(
                              softWrap: true,
                              widget.toDoList[index].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
