import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';

List<int> isolatesInt = [];

List<Map<Isolate, Capability>> isolates = [];

void testIsolate(String isolateNumber) {
  log("test_isolate");

  Timer.periodic(const Duration(seconds: 2), (timer) {
    log(DateTime.now().toString(), name: "isolate_$isolateNumber");
  });
}

runIsolate() async {
  isolatesInt.add(isolatesInt.length + 1);

  // Isolate isolate =
  //     await Isolate.spawn(testIsolate, isolates.length.toString());

  // Capability resumeCapability = Capability();

  // isolates.add({isolate: resumeCapability});

  log("isolate after run...");
}

class IsolateTestScreen extends StatefulWidget {
  const IsolateTestScreen({Key? key}) : super(key: key);

  @override
  State<IsolateTestScreen> createState() => _IsolateTestScreenState();
}

class _IsolateTestScreenState extends State<IsolateTestScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  resumeIsolate(int isolateIndex) {
    // Isolate isolate = isolates[isolateIndex].keys.first;
    // Capability resumeCapability = isolates[isolateIndex].values.first;
    // isolate.resume(resumeCapability);
  }

  pauseIsolate(int isolateIndex) {
    // Isolate isolate = isolates[isolateIndex].keys.first;
    // Capability resumeCapability = isolates[isolateIndex].values.first;
    // isolate.pause(resumeCapability);
  }

  killIsolate(int isolateIndex) {
    // Isolate isolate = isolates[isolateIndex].keys.first;
    // isolate.kill();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Isolate"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await runIsolate();
                    setState(() {});
                  },
                  child: const Text("Run isolate")),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext _, int index) => ListTile(
                        leading: Text(index.toString()),
                        title: const Text('хз что 1'),
                        subtitle: Row(
                          children: [
                            IconButton(
                                onPressed: () => resumeIsolate(index),
                                icon: const Icon(Icons.play_arrow_outlined)),
                            IconButton(
                                onPressed: () => pauseIsolate(index),
                                icon: const Icon(Icons.pause_outlined)),
                            IconButton(
                                onPressed: () => killIsolate(index),
                                icon: const Icon(Icons.stop_outlined))
                          ],
                        ),
                        trailing: Expanded(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () => resumeIsolate(index),
                                  icon: const Icon(Icons.play_arrow_outlined)),
                              IconButton(
                                  onPressed: () => pauseIsolate(index),
                                  icon: const Icon(Icons.pause_outlined)),
                              IconButton(
                                  onPressed: () => killIsolate(index),
                                  icon: const Icon(Icons.stop_outlined))
                            ],
                          ),
                        )),
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: isolatesInt.length),
              ),
            ],
          ),
        ));
  }
}
