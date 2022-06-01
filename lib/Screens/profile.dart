import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late OverlayEntry entry;

  @override
  void initState() {
    super.initState();
    entry = OverlayEntry(
      builder: (context) {
        return Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    entry.remove();
                  },
                  child: const Text("abc"),
                ),
                RaisedButton(
                  onPressed: () {
                    entry.remove();
                  },
                  child: const Text("def"),
                ),
                RaisedButton(
                  onPressed: () {
                    entry.remove();
                  },
                  child: const Text("123"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProfileScreen"),
      ),
      // bottomSheet: ElevatedButton.icon(
      //     onPressed: null,
      //     icon: const Icon(Icons.abc_outlined),
      //     label: const Text("data")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Overlay.of(context)?.insert(entry);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
