import 'package:calender/page/event_editing_page.dart';
import 'package:calender/provider/event_provider.dart';
import 'package:calender/widget/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => EventProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color.fromARGB(255, 199, 199, 199),
            colorScheme: ColorScheme.light(
              primary: Color.fromARGB(255, 87, 174, 110),
            ),
          ),
          home: const MyHomePage(title: 'Calendar'),
        ),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calendar',
            style: TextStyle(color: Color.fromARGB(255, 225, 224, 224))),
      ),
      body: CalendarWidget(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Color.fromARGB(255, 87, 174, 110),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EventEditingPage()),
            );
          }),
    );
  }
}
