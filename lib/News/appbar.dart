import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
          ),

          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Shrayesh'),
              Text(
                'News',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),

      ),
    );
  }
}