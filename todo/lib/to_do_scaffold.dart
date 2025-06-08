import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/to_do_view.dart';

class ToDoScaffold extends StatefulWidget {
  const ToDoScaffold({super.key});
  @override
  State<ToDoScaffold> createState() => _ToDoScaffold();
}

class _ToDoScaffold extends State<ToDoScaffold> {
  List<String> toDoList = [];
  late Widget wid;
  @override
  void initState() {
    super.initState();
    wid = ToDoView(toDoList: toDoList, func: functionDelete);
  }

  void functionDelete(List<String> st) {
    setState(() {
      toDoList = st;
      wid = ToDoView(toDoList: toDoList, func: functionDelete);
    });
  }

  String inputString = '';
  List<Color> colorTheme = [Color(0xff000000), Color(0xff000000)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return SizedBox.expand(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Add A Task',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                onChanged:
                                    (st) => {
                                      setState(() {
                                        inputString = st;
                                      }),
                                    },
                                decoration: InputDecoration(
                                  label: Text('Enter Task'),
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                              ),
                            ),
                            OutlinedButton(
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              onPressed:
                                  () => {
                                    if (inputString == '')
                                      {
                                        Navigator.pop(context),
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              child: Container(
                                                height: 100,
                                                width: 200,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    20.0,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Empty String Is Not Allowed',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      }
                                    else
                                      {
                                        setState(() {
                                          toDoList.add(inputString);
                                          wid = ToDoView(
                                            toDoList: toDoList,
                                            func: functionDelete,
                                          );
                                          inputString = '';
                                          Navigator.pop(context);
                                        }),
                                      },
                                  },
                              child: Text('Create Task'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              shape: Border.all(color: Colors.grey, width: 3),
              backgroundColor: Colors.black,
              child: Icon(Icons.add, color: Colors.grey),
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'ToDo',
            style: GoogleFonts.robotoSlab(
              textStyle: TextStyle(
                fontSize: 75,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: colorTheme),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: colorTheme)),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(child: wid),
        ),
      ),
    );
  }
}
