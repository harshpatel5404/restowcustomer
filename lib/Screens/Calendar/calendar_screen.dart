import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restowcustomer/Constants/colors.dart';
import 'package:restowcustomer/Screens/Notifications/notifications.dart';
import 'package:restowcustomer/Widgets/buttons.dart';
import 'package:restowcustomer/Widgets/drawer_menu.dart';
import '../../Widgets/icon.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final items = ['10:30', '11:00', '11:30', '12:00'];
  String selectedValue = '10:30';
  DateTime dt = DateTime.now();
  bool isPm = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController descController = TextEditingController(text: "");

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {},
  );

  @override
  void initState() {
    super.initState();
    _markedDateMap.add(
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
        Event(
          date: DateTime(2022, 7, 6),
          title: 'Event 5',
        ));
  }

  @override
  Widget build(BuildContext context) {
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
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: CalendarCarousel(
                    customGridViewPhysics: const NeverScrollableScrollPhysics(),
                    height: Get.height * 0.5,
                    showHeaderButton: true,
                    weekendTextStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto",
                    ),
                    weekFormat: false,
                    iconColor: Colors.grey,
                    markedDateWidget: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          dt.day.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    headerTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Roboto",
                    ),
                    showHeader: true,
                    showWeekDays: true,
                    todayButtonColor: kPrimaryColor,
                    markedDatesMap: _markedDateMap,
                    daysTextStyle: const TextStyle(
                        fontFamily: "Roboto", color: Colors.black),
                    selectedDayTextStyle: const TextStyle(color: Colors.black),
                    todayBorderColor: Colors.transparent,
                    weekdayTextStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: "Roboto",
                    ),
                    weekDayMargin: EdgeInsets.only(bottom: 10),
                    inactiveDaysTextStyle: const TextStyle(
                        fontFamily: "Roboto", color: Colors.black),
                    prevDaysTextStyle: const TextStyle(
                        fontFamily: "Roboto", color: Colors.grey),
                    nextDaysTextStyle: const TextStyle(
                        fontFamily: "Roboto", color: Colors.grey),
                    maxSelectedDate: DateTime(DateTime.now().year + 100,
                        DateTime.now().month, DateTime.now().day),
                    onDayPressed: (val, event) {
                      // print(val);
                      // selectedDate = val;
                      dt = DateTime.parse(val.toString());
                      _markedDateMap.clear();
                      _markedDateMap.add(
                          DateTime(dt.year, dt.month, dt.day),
                          Event(
                            date: DateTime(dt.year, dt.month, dt.day),
                            title: 'Event 5',
                          ));

                      setState(() {});
                    },
                    todayTextStyle: const TextStyle(color: Colors.black),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Select Time",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 13,
                          color: textcolor,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
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
                            const Text(
                              " | ",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
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
                      onChanged: (val) {
                        selectedValue = val.toString();
                        setState(() {});
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
