// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restowcustomer/Constants/colors.dart';
import 'package:restowcustomer/Screens/Notifications/notifications.dart';
import 'package:restowcustomer/Widgets/buttons.dart';
import 'package:restowcustomer/Widgets/drawer_menu.dart';

import '../../Widgets/icon.dart';
import '../../Widgets/notinsurance_dialog.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  final items = ['10:30', '11:00', '11:30', '12:00'];
  String selectedValue = '10:30';
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  bool isPm = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController descController = TextEditingController(text: "");

  DateTime _currentDate = DateTime(2022, 7, 3);
  final DateTime _currentDate2 = DateTime(2022, 7, 3);
  final String _currentMonth = DateFormat.yMMM().format(DateTime(2022, 7, 3));
  final DateTime _targetDateTime = DateTime(2022, 7, 3);
  static final Widget _eventIcon = Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(const Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  @override
  Widget build(BuildContext context) {
    String noEventText = "No event here";
    String calendarText = noEventText;

    CalendarCarousel myCalendarCarousel;
    DateTime currentDate = DateTime.now();
    DateTime selectedDate = DateTime.now();
    String selectedMonth = DateFormat.yMMM().format(DateTime.now());
    DateTime targetDateTime = DateTime.now();
    var calendarcoursel = CalendarCarousel(
      height: Get.height * 0.6,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      todayButtonColor: kPrimaryColor,
      todayBorderColor: kPrimaryColor,
      todayTextStyle: TextStyle(color: Colors.black),
      dayButtonColor: kPrimaryColor,
      showWeekDays: false,
      iconColor: kPrimaryColor,
      weekFormat: false,
      daysHaveCircularBorder: true,
      childAspectRatio: 1,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldkey,
        drawer: const MyDrawer(),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(Get.height * 0.15), // here the desired height
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.03, vertical: Get.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    scaffoldkey.currentState!.openDrawer();
                  },
                  child: const AppIcon(
                    icon: Icons.menu,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(Notifications());
                  },
                  child: Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(width: 0, color: Colors.white)),
                    elevation: 8,
                    child: Padding(
                        padding: EdgeInsets.all(Get.width * 0.03),
                        child: SvgPicture.asset(
                          "assets/icons/notification.svg",
                          height: 20,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.width * 0.05,
                ),
                const Center(
                  child: Text(
                    "Select Date & Time",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: ksecondarytextcolor,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: CalendarCarousel(
                    childAspectRatio: 1,
                    height: Get.height * 0.5,
                    weekendTextStyle: TextStyle(color: Colors.grey),
                    weekFormat: false,
                    iconColor: Colors.grey,
                    headerTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    showIconBehindDayText: true,
                    selectedDayBorderColor: Colors.green,
                    selectedDayButtonColor: Colors.green,
                    selectedDayTextStyle: TextStyle(color: Colors.white),
                    todayBorderColor: Colors.transparent,
                    weekdayTextStyle: TextStyle(color: Colors.black),
                    maxSelectedDate: DateTime(DateTime.now().year + 100,
                        DateTime.now().month, DateTime.now().day),
                    onDayPressed: (val, event) {
                      print(val);
                    },
                    daysHaveCircularBorder: true,
                    dayButtonColor: kPrimaryColor,
                    todayTextStyle: TextStyle(color: Colors.black),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Time",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 13,
                          color: textcolor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(width: 0.7, color: Colors.grey)),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isPm = false;
                                });
                              },
                              child: Text(
                                "Am",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isPm ? Colors.black : kPrimaryColor,
                                ),
                              ),
                            ),
                            Text(
                              " | ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isPm = true;
                                });
                              },
                              child: Text(
                                "Pm",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: !isPm ? Colors.black : kPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  height: Get.width * 0.17,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xffF7F6FB),
                      borderRadius: BorderRadius.circular(7)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      menuMaxHeight: Get.height * 0.45,
                      icon: SvgPicture.asset(
                        "assets/icons/down.svg",
                        height: 8,
                        width: 8,
                      ),
                      isExpanded: true,
                      value: selectedValue,
                      elevation: 5,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Roboto"),
                      items: items.map((items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (selected) {
                        setState(() {
                          selectedValue = selected.toString();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.04),
                MyButton(onpress: () {}, btntext: "Submit"),
                SizedBox(
                  height: Get.width * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
// import 'package:intl/intl.dart';

// class CalendarScreen extends StatefulWidget {
//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   DateTime _currentDate = DateTime.now();
//   DateTime _currentDate2 = DateTime.now();
//   String _currentMonth = DateFormat.yMMM().format(DateTime.now());
//   DateTime _targetDateTime = DateTime.now();

//   late CalendarCarousel _calendarCarouselNoHeader;

//   static Widget _eventIcon =  Container(
//     decoration:  BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(1000)),
//         border: Border.all(color: Colors.blue, width: 2.0)),
//     child:  Icon(
//       Icons.person,
//       color: Colors.amber,
//     ),
//   );

//   EventList<Event> _markedDateMap =  EventList<Event>(
//     events: {
//        DateTime(2020, 2, 10): [
//          Event(
//           date: new DateTime(2020, 2, 14),
//           title: 'Event 1',
//           icon: _eventIcon,
//           dot: Container(
//             margin: EdgeInsets.symmetric(horizontal: 1.0),
//             color: Colors.red,
//             height: 5.0,
//             width: 5.0,
//           ),
//         ),
//         new Event(
//           date: new DateTime(2020, 2, 10),
//           title: 'Event 2',
//           icon: _eventIcon,
//         ),
//         new Event(
//           date: new DateTime(2020, 2, 15),
//           title: 'Event 3',
//           icon: _eventIcon,
//         ),
//       ],
//     },
//   );

//   @override
//   void initState() {
//     _markedDateMap.add(
//         new DateTime(2020, 2, 25),
//         new Event(
//           date: new DateTime(2020, 2, 25),
//           title: 'Event 5',
//           icon: _eventIcon,
//         ));

//     _markedDateMap.add(
//         new DateTime(2020, 2, 10),
//         new Event(
//           date: new DateTime(2020, 2, 10),
//           title: 'Event 4',
//           icon: _eventIcon,
//         ));

//     _markedDateMap.addAll(new DateTime(2022, 7, 11), [
//       new Event(
//         date: DateTime(2022, 7, 11),
//         title: 'Event 1',
//         icon: _eventIcon,
//       ),
//       new Event(
//         date: new DateTime(2022, 11, 7),
//         title: 'Event 2',
//         icon: _eventIcon,
//       ),
//       new Event(
//         date: new DateTime(2022, 7, 11),
//         title: 'Event 3',
//         icon: _eventIcon,
//       ),
//     ]);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _calendarCarouselNoHeader = CalendarCarousel(
//       todayBorderColor: Colors.green,
//       onDayPressed: (DateTime date, List events) {
//         this.setState(() => _currentDate2 = date);
//       },

//       showOnlyCurrentMonthDate: false,
//       weekendTextStyle: TextStyle(
//         color: Colors.red,
//       ),
//       thisMonthDayBorderColor: Colors.grey,
//       weekFormat: false,
// //      firstDayOfWeek: 4,
//       // markedDatesMap: _markedDateMap,
//       height: 420.0,
//       // selectedDateTime: _currentDate2,
//       targetDateTime: _targetDateTime,
//       customGridViewPhysics: NeverScrollableScrollPhysics(),
//       markedDateCustomShapeBorder: CircleBorder(
//           side: BorderSide(
//         color: Colors.yellow,
//       )),

//       showHeader: true,

//       onCalendarChanged: (DateTime date) {
//         this.setState(() {
//           _targetDateTime = date;
//           _currentMonth = DateFormat.yMMM().format(_targetDateTime);
//         });
//       },
//       daysHaveCircularBorder: false,
//       onDayLongPressed: (DateTime date) {
//         print('long pressed date $date');
//       },
//     );

//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Calendar'),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               //custom icon

//               Container(
//                 margin: EdgeInsets.only(
//                   top: 30.0,
//                   bottom: 16.0,
//                   left: 16.0,
//                   right: 16.0,
//                 ),
//                 child: new Row(
//                   children: <Widget>[
//                     Expanded(
//                         child: Text(
//                       _currentMonth,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24.0,
//                       ),
//                     )),
//                     FlatButton(
//                       child: Text('PREV'),
//                       onPressed: () {
//                         setState(() {
//                           _targetDateTime = DateTime(
//                               _targetDateTime.year, _targetDateTime.month - 1);
//                           _currentMonth =
//                               DateFormat.yMMM().format(_targetDateTime);
//                         });
//                       },
//                     ),
//                     FlatButton(
//                       child: Text('NEXT'),
//                       onPressed: () {
//                         setState(() {
//                           _targetDateTime = DateTime(
//                               _targetDateTime.year, _targetDateTime.month + 1);
//                           _currentMonth =
//                               DateFormat.yMMM().format(_targetDateTime);
//                         });
//                       },
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 16.0),
//                 child: _calendarCarouselNoHeader,
//               ), //
//             ],
//           ),
//         ));
//   }
// }
