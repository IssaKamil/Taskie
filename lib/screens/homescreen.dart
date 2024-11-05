import 'package:flutter/material.dart';
import 'package:ninja_project3/widgets/dialogwidget.dart';
import 'package:ninja_project3/widgets/taskwidget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // bool isDone = true;
  // String? taskName = '';
  // int index = 0;
  final _controller = TextEditingController();

  List todoTask = [
    ['my task',true]
  ];

  void taskDone(bool? ischecked, int index) {
    setState(() {
      todoTask[index][1] = !todoTask[index][1];
    });
  }

  void savetask() {
    setState(() {
      todoTask.add([_controller.text, false]);
      _controller.clear();

      Navigator.pop(context);
    });
  }

  void deletetask(int index) {
    setState(() {
      todoTask.removeAt(index);

      //avigator.pop(context);
    });
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Center(
          child: Text(
            'TODO APP',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: todoTask.length,
            itemBuilder: (BuildContext context, int index) => TaskTile(
                  taskTitle: todoTask[index][0],
                  isDone: todoTask[index][1],
                  onChanged: (value) {
                    taskDone(todoTask[index][1], index);
                  },
                  onpressed: (buildContext) {
                    deletetask(index);
                  },
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialogwidget(
                  saved: savetask,
                  controller: _controller,
                );
              });
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      //floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat ,
    );
  }
}
