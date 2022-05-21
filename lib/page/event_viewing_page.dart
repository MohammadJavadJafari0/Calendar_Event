import 'package:calender/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calender/utils.dart';
import 'event_editing_page.dart';
import '../model/event.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;
  const EventViewingPage({Key? key, required this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: <Widget>[
          buildDateTime(event),
          SizedBox(
            height: 32,
          ),
          Text(
            event.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Text(event.description,
              style: TextStyle(color: Colors.white, fontSize: 18))
        ],
      ),
    );
  }

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'All-Day' : 'From', event.from),
        if (!event.isAllDay) buildDate('To', event.to),
      ],
    );
  }

  void buildViewingActions(BuildContext context, Event event) {
    IconButton(
        onPressed: () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => EventEditingPage(
                      event: event,
                    ))),
        icon: const Icon(Icons.edit));

    IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        final provider = Provider.of<EventProvider>(context, listen: false);
        provider.deleteEvent(event);
      },
    );
  }

  buildDate(String s, DateTime from) {}
}
