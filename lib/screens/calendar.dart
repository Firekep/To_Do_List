import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/database/calendar_items.dart';
import 'package:to_do_list/models/ultilits/alertboxes/calendar_add_box.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<CalendarItem> _items = [];
  final DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  late CalendarCarousel _calendarCarouselNoHeader;

  static final Widget _eventIcon = Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
  );

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2022, 5, 15): [
        Event(
          date: DateTime(2022, 5, 15),
          title: 'Event 1',
          icon: _eventIcon,
        ),
        Event(
          date: DateTime(2022, 5, 24),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        Event(
          date: DateTime(2022, 11, 7),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        setState(() => _currentDate2 = date);
        for (var event in events) {
          if (kDebugMode) {
            print(event.title);
          }
        }
      },
      daysTextStyle: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: const TextStyle(
        color: Colors.red,
      ),
      weekdayTextStyle: TextStyle(
        color: Theme.of(context).backgroundColor,
      ),
      thisMonthDayBorderColor: Theme.of(context).disabledColor,
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          const CircleBorder(side: BorderSide(color: Colors.blue)),
      markedDateCustomTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      showHeader: false,

      minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
      maxSelectedDate: _currentDate.add(const Duration(days: 360)),
      prevDaysTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      onCalendarChanged: (DateTime date) {
        setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        // _saveDay(date);
        // print(date);

        setState(() {
          _markedDateMap.add(date, Event(date: date));
        });
      },
      todayTextStyle: const TextStyle(
        color: Colors.white,
      ),
      todayBorderColor: Theme.of(context).primaryColor,
      todayButtonColor: Theme.of(context).backgroundColor,
      selectedDayTextStyle: const TextStyle(
        color: Colors.white,
      ),
      selectedDayButtonColor: const Color.fromRGBO(155, 22, 61, 1),
      selectedDayBorderColor: Theme.of(context).primaryColor,
    );

    return Scaffold(
      floatingActionButton: RawMaterialButton(
        autofocus: false,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: _add,
        elevation: 2.0,
        fillColor: Theme.of(context).shadowColor,
        child: const Icon(
          Icons.add_alert_outlined,
          size: 25.0,
        ),
        padding: const EdgeInsets.all(15.0),
        shape: const CircleBorder(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //custom icon

          Container(
            margin: const EdgeInsets.only(
              top: 30.0,
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  _currentMonth,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                )),
                OutlinedButton(
                  child: Text(
                    'Anterior',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    setState(() {
                      _targetDateTime = DateTime(
                          _targetDateTime.year, _targetDateTime.month - 1);
                      _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.transparent),
                  ),
                ),
                OutlinedButton(
                  child: Text('Seguinte',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  onPressed: () {
                    setState(
                      () {
                        _targetDateTime = DateTime(
                            _targetDateTime.year, _targetDateTime.month + 1);
                        _currentMonth =
                            DateFormat.yMMM().format(_targetDateTime);
                      },
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 1.2))),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              child: _calendarCarouselNoHeader,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1.2))),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return Dismissible(
                    key: Key(item.content ?? json.encode(item)),
                    onDismissed: (direction) {
                      _remove(index);
                    },
                    child: Card(
                      color: Theme.of(context).cardColor,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 2),
                      child: ListTile(
                        title: Text(
                          DateFormat('dd/MM/yyyy').format(item.date),
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        subtitle: Text(
                          item.content ?? '',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        leading: Image.asset(
                          'assets/image/openbox.png',
                          width: 50,
                          height: 50,
                        ),
                        // leading:  IconButton(color: Colors.green, onPressed:(){}, icon: const Icon(Icons.calendar_today_sharp),),
                        trailing: IconButton(
                          onPressed: () => _remove(index),
                          icon: const Icon(Icons.delete_forever_rounded),
                          color: Colors.red,
                        ),
                      ),
                    ),
                    background: Container(
                        child: const Icon(Icons.arrow_forward_outlined),
                        color: Theme.of(context).backgroundColor),
                    secondaryBackground: Container(
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        size: 25,
                      ),
                      color: Theme.of(context).backgroundColor,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future<void> _save() async {
    var prefs = await SharedPreferences.getInstance();

    final String encodedData = CalendarItem.encode(_items);

    await prefs.setString('calendar', encodedData);
  }

  void _remove(int index) async {
    setState(() {
      _items.removeAt(index);
    });

    await _save();
  }

  Future<void> _add() async {
    final response = await showDialog(
      context: context,
      builder: (contextDialog) => const CalendarAdd(),
    );

    if (response is CalendarItem) {
      setState(() {
        _items.add(response);
      });

      await _save();
    }
  }

  Future _load() async {
    var prefs = await SharedPreferences.getInstance();
    var calendarItemStringList = await prefs.getString('calendar');

    if (calendarItemStringList != null) {
      List<CalendarItem> result = CalendarItem.decode(calendarItemStringList);

      print('result: ${result}');

      setState(() {
        _items = result;
      });

      for (var element in result) {
        setState(() {
          _markedDateMap.add(element.date, Event(date: element.date));
        });
      }
    }
  }
}
