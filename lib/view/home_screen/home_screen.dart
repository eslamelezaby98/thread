import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thread/logic/thread_logic.dart';
import 'package:thread/view/responsive_widget/responsive_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThreadLogic threadLogic = Provider.of<ThreadLogic>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Make A Thread 🧵 ",
        ),
      ),
      body: ResponsiveWisget(
        mobile: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputThreadWidget(threadLogic: threadLogic),
            OutputThreadWidget(threadLogic: threadLogic),
          ],
        ),
        tablet: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputThreadWidget(threadLogic: threadLogic),
            OutputThreadWidget(threadLogic: threadLogic),
          ],
        ),
        web: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputThreadWidget(threadLogic: threadLogic),
            OutputThreadWidget(threadLogic: threadLogic),
          ],
        ),
      ),
    );
  }
}

class OutputThreadWidget extends StatelessWidget {
  const OutputThreadWidget({
    Key? key,
    required this.threadLogic,
  }) : super(key: key);
  final ThreadLogic threadLogic;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ListView.builder(
        itemCount: threadLogic.thread.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    threadLogic.thread[index],
                  ),
                  Text(
                    threadLogic.thread[index].toString().length.toString(),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.copy,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class InputThreadWidget extends StatelessWidget {
  const InputThreadWidget({
    Key? key,
    required this.threadLogic,
  }) : super(key: key);
  final ThreadLogic threadLogic;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                threadLogic.text = value;
              },
              maxLines: 15,
              decoration:const InputDecoration.collapsed(
                hintText: "paste you tweet",
                border:  OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: () {
                threadLogic.makeThread();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Thread 🧵",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
