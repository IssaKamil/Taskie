import 'package:flutter/material.dart';
import 'package:ninja_project3/widgets/buttonwidget.dart';

class Dialogwidget extends StatelessWidget {
  final Function() saved;
  final TextEditingController controller;

  const Dialogwidget({super.key, required this.saved, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.redAccent,
      content: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  hintText: 'Enter your task',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(title: 'SAVE', onpress: saved),
                const SizedBox(
                  width: 10,
                ),
                Button(
                  title: 'CANCEL',
                  onpress: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
