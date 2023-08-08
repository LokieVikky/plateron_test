import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PageOne(),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
      ),
      body: Center(
        child: CustomButton(
          onPressed: () async {
            var result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PageTwo(
                  description: 'Description',
                ),
              ),
            );
            print(result);
          },
          title: 'Go',
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  final String description;

  const PageTwo({required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pop('Object()');
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Page Two'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(description),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  title: 'Go Back',
                  onPressed: () {
                    Navigator.of(context).pop('Object()');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends ButtonBar {
  final String title;
  final VoidCallback onPressed;

  const CustomButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          color: Colors.deepPurple,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
