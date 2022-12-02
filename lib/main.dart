import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final labelLarge = Theme.of(context).textTheme.labelLarge!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: deviceWidth / 2,
              height: 128,
            ),
            SizedBox(
              width: deviceWidth / 2,
              height: deviceWidth / 2,
              child: const Placeholder(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  width: deviceWidth / 4,
                  child: Text(
                    '** ℃',
                    style: labelLarge.copyWith(color: Colors.blue),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  width: deviceWidth / 4,
                  child: Text(
                    '** ℃',
                    style: labelLarge.copyWith(color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: deviceWidth / 2,
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: deviceWidth / 4,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Close'),
                  ),
                ),
                SizedBox(
                  width: deviceWidth / 4,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Reload'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
