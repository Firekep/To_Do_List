import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/screens/calendar/alertbox/edit_item_calendar.dart';
import 'package:to_do_list/screens/calendar/memory/calendar_items.dart';
import 'package:to_do_list/screens/calendar/alertbox/calendar_add_box.dart';
import 'package:to_do_list/screens/calendar/alertbox/calendar_add_box_by_datetime.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar>
    with SingleTickerProviderStateMixin {
  List<CalendarItem> _items = [];
  final DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
  late CalendarCarousel _calendarCarouselNoHeader;
  Future<void>? _futureLoad;

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2022, 5, 15): [
        Event(
          date: DateTime(2022, 5, 15),
          title: 'Event 1',
          icon: const Icon(Icons.home),
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.green,
            height: 5.0,
            width: 5.0,
          ),
        ),
      ],
      DateTime(2022, 5, 24): [
        Event(
          date: DateTime(2022, 5, 24),
          title: 'Event 1',
          icon: const Icon(Icons.home),
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
      ],
      DateTime(2022, 11, 7): [
        Event(
          date: DateTime(2022, 5, 15),
          title: 'Event 1',
          icon: const Icon(Icons.home),
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
      ],
    },
  );

  @override
  void initState() {
    _futureLoad = _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        setState(() => _currentDate2 = date);
        setState(() {});

        for (var event in events) {
          if (kDebugMode) {
            print(_markedDateMap.events);
          }
        }
      },

      thisMonthDayBorderColor: Theme.of(context).disabledColor,
      height: 420.0,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),

      onCalendarChanged: (DateTime date) {
        setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        setState(() {
          _addItemToListByDateTime(date);
        });
      },

      daysHaveCircularBorder: true,
      weekFormat: false,
      showOnlyCurrentMonthDate: false,
      showHeader: false,

      daysTextStyle: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      weekendTextStyle: const TextStyle(
        color: Colors.red,
      ),
      weekdayTextStyle: TextStyle(
        color: Theme.of(context).backgroundColor,
      ),

      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,

      minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
      maxSelectedDate: _currentDate.add(const Duration(days: 360)),

      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true, // precisa ser true pra mostrar incones
      markedDateMoreShowTotal: false,
      markedDateIconOffset: 1,

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

      markedDateCustomShapeBorder:
          const CircleBorder(side: BorderSide(color: Colors.red)),
      markedDateCustomTextStyle: const TextStyle(
        fontSize: 20,
      ),
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        autofocus: false,
        splashColor: Colors.transparent,
        onPressed: _addItemToList,
        elevation: 2.0,
        backgroundColor: Theme.of(context).shadowColor,
        child: const Icon(
          Icons.add_alert_outlined,
          size: 25.0,
        ),
        // padding: const EdgeInsets.all(15.0),
        shape: const CircleBorder(),
      ),
      body: FutureBuilder(
          future: _futureLoad,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('none');
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).backgroundColor,
                  ),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                return bodyViewer(context);
            }
          }),
    );
  }

  Column bodyViewer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
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
                      _currentMonth = DateFormat.yMMM().format(_targetDateTime);
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
              border:
                  Border(bottom: BorderSide(color: Colors.black, width: 1.2))),
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
        ), //Calendário
        Expanded(
          flex: 2,
          child: ReorderableListView(
             onReorder: _onReorder,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: List.generate(_items.length, (index){
               final item = _items[index];
               return GestureDetector(
                 key: Key('$index'),
                 child: Dismissible(
                   key: Key(item.content ?? json.encode(item)),
                   onDismissed: (direction) {
                     setState(() {
                       _removeItemList(index);
                     });
                   },
                   child: Card(
                     color: Theme.of(context).cardColor,
                     margin:
                     const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                     child: ListTile(
                       title: Text(
                         DateFormat('dd/MM/yyyy').format(item.date),
                         style: TextStyle(color: Theme.of(context).primaryColor),
                       ),
                       subtitle: Text(
                         item.content!,
                         style: TextStyle(color: Theme.of(context).primaryColor),
                       ),
                       leading: IconButton(
                         onPressed: () {},
                         icon: getIcon(item),
                         color: Theme.of(context).primaryColor,
                       ),
                       trailing: IconButton(
                         onPressed: () => _removeItemList(index),
                         icon: const Icon(Icons.delete_forever_rounded),
                         color: Colors.red,
                       ),
                       // onTap: () => _editCalendarItem(item, index),
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
                 ),
               );
           }),
          ),
        ), //Lista do calendário
      ],
    );
  }

  Icon getIcon(CalendarItem item) {
    const IconData fakeIcon = Icons.live_help_outlined;

    return Icon(IconData(
      item.iconCodePoint ?? fakeIcon.codePoint,
      fontFamily: fakeIcon.fontFamily,
      fontPackage: fakeIcon.fontPackage,
      matchTextDirection: true,
    ));
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(
          () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final CalendarItem item = _items.removeAt(oldIndex);
        _items.insert(newIndex, item);
        _saveCurrentChanges();
      },
    );
  }

  void _removeItemList(int index) async {
    setState(() {
      _items.removeAt(index);
    });

    _markedDateMap.clear();

    for (var e in _items) {
      setState(() {
        _markedDateMap.add(e.date, Event(date: e.date));
      });
    }

    await _saveCurrentChanges();
  }

  Future<void> _editCalendarItem(CalendarItem item, int index) async {
    final response = await showDialog(
      context: context,
      builder: (contextDialog) => EditCalendarBox(item: item),
    );

    if (response is CalendarItem) {
      setState(() {
        _items.removeAt(index);
        _items.insert(index, response);
      });

      var prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'data',
        jsonEncode(_items),
      );
    }
  }

  Future<void> _addItemToList() async {
    final response = await showDialog(
      context: context,
      builder: (contextDialog) => const CalendarAdd(),
    );

    if (response is CalendarItem) {
      setState(() {
        _items.add(response);
        _markedDateMap.add(response.date, Event(date: response.date));
      });

      await _saveCurrentChanges();
    }
  }

  Future<void> _addItemToListByDateTime(DateTime date) async {
    final response = await showDialog(
      context: context,
      builder: (contextDialog) => CalendarAddByDateTime(selectedDay: date),
    );

    if (response is CalendarItem) {
      setState(() {
        _items.add(response);
        _markedDateMap.add(response.date, Event(date: response.date));
      });

      await _saveCurrentChanges();
    }
  }

  Future<void> _load() async {
    await Future.delayed(const Duration(microseconds: 1));
    var prefs = await SharedPreferences.getInstance();
    var calendarItemStringList = prefs.getString('calendar');

    if (calendarItemStringList != null) {
      List<CalendarItem> result = CalendarItem.decode(calendarItemStringList);

      setState(() {
        _items = result;
      });

      for (var element in result) {
        setState(() {
          _markedDateMap.add(element.date,
              Event(date: element.date, icon: const Icon(Icons.markunread)));
        });
      }
    }
  }

  Future<void> _saveCurrentChanges() async {
    var prefs = await SharedPreferences.getInstance();
    final String encodedData = CalendarItem.encode(_items);
    await prefs.setString('calendar', encodedData);
  }
}
