import 'dart:developer';

import 'package:flutter/material.dart';

class WorkerScreen extends StatefulWidget {
  const WorkerScreen({Key? key}) : super(key: key);

  @override
  State<WorkerScreen> createState() => _WorkerScreenState();
}

class _WorkerScreenState extends State<WorkerScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  log(
                    "Settings",
                    level: 1,
                    name: "test",
                    // error: context,
                    // sequenceNumber: 2,
                    time: DateTime.now(),
                    // zone: Zone.current
                  );
                },
                icon: const Icon(Icons.settings_outlined))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.timer_outlined)),
              Tab(icon: Icon(Icons.qr_code_outlined)),
            ],
          ),
          title: const Text('WorkerScreen'),
        ),
        body: TabBarView(
          children: [
            const Icon(Icons.timer_outlined),
            ProfileScreen_2(),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen_2 extends StatelessWidget {
  ProfileScreen_2({Key? key}) : super(key: key);

  String fio = "Иванов Иван Иваныч";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60.0,
            // minRadius: 50.0,
            backgroundImage: NetworkImage(
                "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
            backgroundColor: Colors.amber,
          ),
          const SizedBox(
            height: 55,
          ),
          Text(fio),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            child: Icon(Icons.qr_code_2, size: 300),
          )
        ],
      ),
    );
  }
}
