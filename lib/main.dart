import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String weatherCondition = '';

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final labelLarge = Theme.of(context).textTheme.labelLarge!;
    final yumemiWeather = YumemiWeather();

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
              child: weatherCondition.isNotEmpty
                  ? SvgPicture.asset(
                      'assets/$weatherCondition.svg',
                      semanticsLabel: 'weater',
                    )
                  : const Placeholder(),
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
                    onPressed: () {
                      setState(() {
                        weatherCondition = yumemiWeather.fetchSimpleWeather();
                      });
                      debugPrint('Weather Condition: $weatherCondition');
                    },
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
