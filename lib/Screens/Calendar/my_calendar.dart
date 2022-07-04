import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'my_calendar_event.dart';

typedef MarkedDateIconBuilder<T> = Widget? Function(T event);
typedef void OnDayLongPressed(DateTime day);

/// This builder is called for every day in the calendar.
/// If you want to build only few custom day containers, return null for the days you want to leave with default looks
/// All characteristics like circle border are also applied to the custom day container [DayBuilder] provides.
/// (if supplied function returns null, Calendar's function will be called for [day]).
/// [isSelectable] - is between [CalendarCarousel.minSelectedDate] and [CalendarCarousel.maxSelectedDate]
/// [index] - DOES NOT equal day number! Index of the day built in current visible field
/// [isSelectedDay] - if the day is selected
/// [isToday] - if the day is similar to [DateTime.now()]
/// [isPrevMonthDay] - if the day is from previous month
/// [textStyle] - text style that would have been applied by the calendar if it was to build the day.
/// Example: if the user provided [CalendarCarousel.todayTextStyle] and [isToday] is true,
///   [CalendarCarousel.todayTextStyle] would be sent into [DayBuilder]'s [textStyle]. If user didn't
///   provide it, default [CalendarCarousel]'s textStyle would be sent. Same applies to all text styles like
///   [CalendarCarousel.prevDaysTextStyle], [CalendarCarousel.daysTextStyle] etc.
/// [isNextMonthDay] - if the day is from next month
/// [isThisMonthDay] - if the day is from next month
/// [day] - day being built.
typedef Widget? DayBuilder(
    bool isSelectable,
    int index,
    bool isSelectedDay,
    bool isToday,
    bool isPrevMonthDay,
    TextStyle textStyle,
    bool isNextMonthDay,
    bool isThisMonthDay,
    DateTime day);

/// This builder is called for every weekday container (7 times, from Mon to Sun).
/// [weekday] - weekday built, from 0 to 6.
/// [weekdayName] - string representation of the weekday (Mon, Tue, Wed, etc).
typedef Widget WeekdayBuilder(int weekday, String weekdayName);

class CalendarCarousel<T extends EventInterface> extends StatefulWidget {
  final double viewportFraction;
  final TextStyle? prevDaysTextStyle;
  final TextStyle? daysTextStyle;
  final TextStyle? nextDaysTextStyle;
  final Color prevMonthDayBorderColor;
  final Color thisMonthDayBorderColor;
  final Color nextMonthDayBorderColor;
  final double dayPadding;
  final double height;
  final double width;
  final TextStyle? todayTextStyle;
  final Color dayButtonColor;
  final Color todayBorderColor;
  final Color todayButtonColor;
  final DateTime? selectedDateTime;
  final DateTime? targetDateTime;
  final TextStyle? selectedDayTextStyle;
  final Color selectedDayButtonColor;
  final Color selectedDayBorderColor;
  final bool? daysHaveCircularBorder;
  final bool disableDayPressed;
  final Function(DateTime, List<T>)? onDayPressed;
  final TextStyle? weekdayTextStyle;
  final Color iconColor;
  final TextStyle? headerTextStyle;
  final String? headerText;
  final TextStyle? weekendTextStyle;
  final EventList<T>? markedDatesMap;

  /// Change `makredDateWidget` when `markedDateShowIcon` is set to false.
  final Widget? markedDateWidget;

  /// Change `OutlinedBorder` when `markedDateShowIcon` is set to false.
  final OutlinedBorder? markedDateCustomShapeBorder;

  /// Change `TextStyle` when `markedDateShowIcon` is set to false.
  final TextStyle? markedDateCustomTextStyle;

  /// Icon will overlap the [Day] widget when `markedDateShowIcon` is set to true.
  /// This will also make below parameters work.
  final bool markedDateShowIcon;
  final Color? markedDateIconBorderColor;
  final int markedDateIconMaxShown;
  final double markedDateIconMargin;
  final double markedDateIconOffset;
  final MarkedDateIconBuilder<T>? markedDateIconBuilder;

  /// null - no indicator, true - show the total events, false - show the total of hidden events
  final bool? markedDateMoreShowTotal;
  final Decoration? markedDateMoreCustomDecoration;
  final TextStyle? markedDateMoreCustomTextStyle;
  final EdgeInsets headerMargin;
  final double childAspectRatio;
  final EdgeInsets weekDayMargin;
  final EdgeInsets weekDayPadding;
  final WeekdayBuilder? customWeekDayBuilder;
  final DayBuilder? customDayBuilder;
  final Color weekDayBackgroundColor;
  final bool weekFormat;
  final bool showWeekDays;
  final bool showHeader;
  final bool showHeaderButton;
  final MultipleMarkedDates? multipleMarkedDates;
  final Widget? leftButtonIcon;
  final Widget? rightButtonIcon;
  final ScrollPhysics? customGridViewPhysics;
  final Function(DateTime)? onCalendarChanged;
  final String locale;
  final int? firstDayOfWeek;
  final DateTime? minSelectedDate;
  final DateTime? maxSelectedDate;
  final TextStyle? inactiveDaysTextStyle;
  final TextStyle? inactiveWeekendTextStyle;
  final bool headerTitleTouchable;
  final Function? onHeaderTitlePressed;
  final Function? onLeftArrowPressed;
  final Function? onRightArrowPressed;
  final WeekdayFormat weekDayFormat;
  final bool staticSixWeekFormat;
  final bool isScrollable;
  final Axis scrollDirection;
  final bool showOnlyCurrentMonthDate;
  final bool pageSnapping;
  final OnDayLongPressed? onDayLongPressed;
  final CrossAxisAlignment dayCrossAxisAlignment;
  final MainAxisAlignment dayMainAxisAlignment;
  final bool showIconBehindDayText;
  final ScrollPhysics pageScrollPhysics;
  final bool shouldShowTransform;

  CalendarCarousel({
    Key? key,
    this.viewportFraction = 1.0,
    this.prevDaysTextStyle,
    this.daysTextStyle,
    this.nextDaysTextStyle,
    this.prevMonthDayBorderColor = Colors.transparent,
    this.thisMonthDayBorderColor = Colors.transparent,
    this.nextMonthDayBorderColor = Colors.transparent,
    this.dayPadding = 2.0,
    this.height = double.infinity,
    this.width = double.infinity,
    this.todayTextStyle,
    this.dayButtonColor = Colors.transparent,
    this.todayBorderColor = Colors.red,
    this.todayButtonColor = Colors.red,
    this.selectedDateTime,
    this.targetDateTime,
    this.selectedDayTextStyle,
    this.selectedDayBorderColor = Colors.green,
    this.selectedDayButtonColor = Colors.green,
    this.daysHaveCircularBorder,
    this.disableDayPressed = false,
    this.onDayPressed,
    this.weekdayTextStyle = const TextStyle(),
    this.iconColor = Colors.blueAccent,
    this.headerTextStyle,
    this.headerText,
    this.weekendTextStyle,
    this.markedDatesMap,
    this.markedDateShowIcon = false,
    this.markedDateIconBorderColor,
    this.markedDateIconMaxShown = 2,
    this.markedDateIconMargin = 5.0,
    this.markedDateIconOffset = 5.0,
    this.markedDateIconBuilder,
    this.markedDateMoreShowTotal,
    this.markedDateMoreCustomDecoration,
    this.markedDateCustomShapeBorder,
    this.markedDateCustomTextStyle,
    this.markedDateMoreCustomTextStyle,
    this.markedDateWidget,
    this.multipleMarkedDates,
    this.headerMargin = const EdgeInsets.symmetric(vertical: 16.0),
    this.childAspectRatio = 1.0,
    this.weekDayMargin = const EdgeInsets.only(bottom: 4.0),
    this.weekDayPadding = const EdgeInsets.all(0.0),
    this.weekDayBackgroundColor = Colors.transparent,
    this.customWeekDayBuilder,
    this.customDayBuilder,
    this.showWeekDays = true,
    this.weekFormat = false,
    this.showHeader = true,
    this.showHeaderButton = true,
    this.leftButtonIcon,
    this.rightButtonIcon,
    this.customGridViewPhysics,
    this.onCalendarChanged,
    this.locale = "en",
    this.firstDayOfWeek,
    this.minSelectedDate,
    this.maxSelectedDate,
    this.inactiveDaysTextStyle,
    this.inactiveWeekendTextStyle,
    this.headerTitleTouchable = false,
    this.onHeaderTitlePressed,
    this.onLeftArrowPressed,
    this.onRightArrowPressed,
    this.weekDayFormat = WeekdayFormat.short,
    this.staticSixWeekFormat = false,
    this.isScrollable = true,
    this.scrollDirection = Axis.horizontal,
    this.showOnlyCurrentMonthDate = false,
    this.pageSnapping = false,
    this.onDayLongPressed,
    this.dayCrossAxisAlignment = CrossAxisAlignment.center,
    this.dayMainAxisAlignment = MainAxisAlignment.center,
    this.showIconBehindDayText = false,
    this.pageScrollPhysics = const ScrollPhysics(),
    this.shouldShowTransform = true,
  }) : super(key: key);

  @override
  _CalendarState<T> createState() => _CalendarState<T>();
}

enum WeekdayFormat {
  weekdays,
  standalone,
  short,
  standaloneShort,
  narrow,
  standaloneNarrow,
}

class _CalendarState<T extends EventInterface>
    extends State<CalendarCarousel<T>> {
  late PageController _controller;
  late List<DateTime> _dates;
  late List<List<DateTime>> _weeks;
  DateTime _selectedDate = DateTime.now();
  late DateTime _targetDate;
  int _startWeekday = 0;
  int _endWeekday = 0;
  late DateFormat _localeDate;
  int _pageNum = 0;
  late DateTime minDate;
  late DateTime maxDate;

  /// When FIRSTDAYOFWEEK is 0 in dart-intl, it represents Monday. However it is the second day in the arrays of Weekdays.
  /// Therefore we need to add 1 modulo 7 to pick the right weekday from intl. (cf. [GlobalMaterialLocalizations])
  late int firstDayOfWeek;

  /// If the setState called from this class, don't reload the selectedDate, but it should reload selected date if called from external class

  @override
  initState() {
    super.initState();
    initializeDateFormatting();

    minDate = widget.minSelectedDate ?? DateTime(2018);
    maxDate = widget.maxSelectedDate ??
        DateTime(
            DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);

    final selectedDateTime = widget.selectedDateTime;
    if (selectedDateTime != null) _selectedDate = selectedDateTime;

    _init();

    /// setup pageController
    _controller = PageController(
      initialPage: this._pageNum,
      keepPage: true,
      viewportFraction: widget.viewportFraction,

      /// width percentage
    );

    _localeDate = DateFormat.yMMM(widget.locale);
    firstDayOfWeek = widget.firstDayOfWeek ??
        (_localeDate.dateSymbols.FIRSTDAYOFWEEK + 1) % 7;

    _setDate();
  }

  @override
  void didUpdateWidget(CalendarCarousel<T> oldWidget) {
    if (widget.targetDateTime != null && widget.targetDateTime != _targetDate) {
      _init();
      _setDate(_pageNum);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  _init() {
    final targetDateTime = widget.targetDateTime;
    if (targetDateTime != null) {
      if (targetDateTime.difference(minDate).inDays < 0) {
        _targetDate = minDate;
      } else if (targetDateTime.difference(maxDate).inDays > 0) {
        _targetDate = maxDate;
      } else {
        _targetDate = targetDateTime;
      }
    } else {
      _targetDate = _selectedDate;
    }
    if (widget.weekFormat) {
      _pageNum = _targetDate.difference(_firstDayOfWeek(minDate)).inDays ~/ 7;
    } else {
      _pageNum = (_targetDate.year - minDate.year) * 12 +
          _targetDate.month -
          minDate.month;
    }
  }

  @override
  Widget build(BuildContext context) {
    final headerText = widget.headerText;
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: <Widget>[
          CalendarHeader(
            showHeader: widget.showHeader,
            headerMargin: widget.headerMargin,
            headerTitle: headerText != null
                ? headerText
                : widget.weekFormat
                    ? '${_localeDate.format(this._weeks[this._pageNum].first)}'
                    : '${_localeDate.format(this._dates[this._pageNum])}',
            headerTextStyle: widget.headerTextStyle,
            showHeaderButtons: widget.showHeaderButton,
            headerIconColor: widget.iconColor,
            leftButtonIcon: widget.leftButtonIcon,
            rightButtonIcon: widget.rightButtonIcon,
            onLeftButtonPressed: () {
              widget.onLeftArrowPressed?.call();

              if (this._pageNum > 0) _setDate(this._pageNum - 1);
            },
            onRightButtonPressed: () {
              widget.onRightArrowPressed?.call();

              if (widget.weekFormat) {
                if (this._weeks.length - 1 > this._pageNum)
                  _setDate(this._pageNum + 1);
              } else {
                if (this._dates.length - 1 > this._pageNum)
                  _setDate(this._pageNum + 1);
              }
            },
            onHeaderTitlePressed: widget.headerTitleTouchable
                ? () {
                    final onHeaderTitlePressed = widget.onHeaderTitlePressed;
                    if (onHeaderTitlePressed != null) {
                      onHeaderTitlePressed();
                    } else {
                      _selectDateFromPicker();
                    }
                  }
                : null,
          ),
          // WeekdayRow(
          //   firstDayOfWeek,
          //   widget.customWeekDayBuilder,
          //   showWeekdays: widget.showWeekDays,
          //   weekdayFormat: widget.weekDayFormat,
          //   weekdayMargin: widget.weekDayMargin,
          //   weekdayPadding: widget.weekDayPadding,
          //   weekdayBackgroundColor: widget.weekDayBackgroundColor,
          //   weekdayTextStyle: widget.weekdayTextStyle,
          //   localeDate: _localeDate,
          // ),
          Expanded(
              child: PageView.builder(
            itemCount:
                widget.weekFormat ? this._weeks.length : this._dates.length,
            physics: widget.isScrollable
                ? widget.pageScrollPhysics
                : NeverScrollableScrollPhysics(),
            scrollDirection: widget.scrollDirection,
            onPageChanged: (index) {
              this._setDate(index);
            },
            controller: _controller,
            itemBuilder: (context, index) {
              return widget.weekFormat ? weekBuilder(index) : builder(index);
            },
            pageSnapping: widget.pageSnapping,
          )),
        ],
      ),
    );
  }

  Widget getDefaultDayContainer(
    bool isSelectable,
    int index,
    bool isSelectedDay,
    bool isToday,
    bool isPrevMonthDay,
    TextStyle? textStyle,
    TextStyle defaultTextStyle,
    bool isNextMonthDay,
    bool isThisMonthDay,
    DateTime now,
  ) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        crossAxisAlignment: widget.dayCrossAxisAlignment,
        mainAxisAlignment: widget.dayMainAxisAlignment,
        children: <Widget>[
          DefaultTextStyle(
            style: getDefaultDayStyle(
                isSelectable,
                index,
                isSelectedDay,
                isToday,
                isPrevMonthDay,
                textStyle,
                defaultTextStyle,
                isNextMonthDay,
                isThisMonthDay),
            child: Text(
              '${now.day}',
              semanticsLabel: now.day.toString(),
              style: getDayStyle(
                  isSelectable,
                  index,
                  isSelectedDay,
                  isToday,
                  isPrevMonthDay,
                  textStyle,
                  defaultTextStyle,
                  isNextMonthDay,
                  isThisMonthDay,
                  now),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget renderDay(
    bool isSelectable,
    int index,
    bool isSelectedDay,
    bool isToday,
    bool isPrevMonthDay,
    TextStyle? textStyle,
    TextStyle defaultTextStyle,
    bool isNextMonthDay,
    bool isThisMonthDay,
    DateTime now,
  ) {
    // If day is in Multiple selection mode, get its color
    bool isMultipleMarked = widget.multipleMarkedDates?.isMarked(now) ?? false;
    Color? multipleMarkedColor = widget.multipleMarkedDates?.getColor(now);

    final markedDatesMap = widget.markedDatesMap;
    return Container(
      margin: EdgeInsets.all(widget.dayPadding),
      child: GestureDetector(
        onLongPress: () => _onDayLongPressed(now),
        child: TextButton(
          style: TextButton.styleFrom(
            shape: widget.markedDateCustomShapeBorder != null &&
                    markedDatesMap != null &&
                    markedDatesMap.getEvents(now).length > 0
                ? widget.markedDateCustomShapeBorder
                : widget.daysHaveCircularBorder == null
                    ? CircleBorder()
                    : widget.daysHaveCircularBorder ?? false
                        ? CircleBorder(
                            side: BorderSide(
                              color: isSelectedDay
                                  ? widget.selectedDayBorderColor
                                  : isToday
                                      ? widget.todayBorderColor
                                      : isPrevMonthDay
                                          ? widget.prevMonthDayBorderColor
                                          : isNextMonthDay
                                              ? widget.nextMonthDayBorderColor
                                              : widget.thisMonthDayBorderColor,
                            ),
                          )
                        : RoundedRectangleBorder(
                            side: BorderSide(
                              color: isSelectedDay
                                  ? widget.selectedDayBorderColor
                                  : isToday
                                      ? widget.todayBorderColor
                                      : isPrevMonthDay
                                          ? widget.prevMonthDayBorderColor
                                          : isNextMonthDay
                                              ? widget.nextMonthDayBorderColor
                                              : widget.thisMonthDayBorderColor,
                            ),
                          ),
            primary: isSelectedDay
                ? widget.selectedDayButtonColor
                : isToday
                    ? widget.todayButtonColor

                    // If day is in Multiple selection mode, apply a different color
                    : isMultipleMarked
                        ? multipleMarkedColor
                        : widget.dayButtonColor,
            padding: EdgeInsets.all(widget.dayPadding),
          ),
          onPressed: widget.disableDayPressed ? null : () => _onDayPressed(now),
          child: Stack(
            children: widget.showIconBehindDayText
                ? <Widget>[
                    widget.markedDatesMap != null
                        ? _renderMarkedMapContainer(now)
                        : Container(),
                    getDayContainer(
                        isSelectable,
                        index,
                        isSelectedDay,
                        isToday,
                        isPrevMonthDay,
                        textStyle,
                        defaultTextStyle,
                        isNextMonthDay,
                        isThisMonthDay,
                        now),
                  ]
                : <Widget>[
                    getDayContainer(
                        isSelectable,
                        index,
                        isSelectedDay,
                        isToday,
                        isPrevMonthDay,
                        textStyle,
                        defaultTextStyle,
                        isNextMonthDay,
                        isThisMonthDay,
                        now),
                    widget.markedDatesMap != null
                        ? _renderMarkedMapContainer(now)
                        : Container(),
                  ],
          ),
        ),
      ),
    );
  }

  AnimatedBuilder builder(int slideIndex) {
    _startWeekday = _dates[slideIndex].weekday - firstDayOfWeek;
    if (_startWeekday == 7) {
      _startWeekday = 0;
    }
    _endWeekday =
        DateTime(_dates[slideIndex].year, _dates[slideIndex].month + 1, 1)
                .weekday -
            firstDayOfWeek;
    double screenWidth = MediaQuery.of(context).size.width;
    int totalItemCount = widget.staticSixWeekFormat
        ? 42
        : DateTime(
              _dates[slideIndex].year,
              _dates[slideIndex].month + 1,
              0,
            ).day +
            _startWeekday +
            (7 - _endWeekday);
    int year = _dates[slideIndex].year;
    int month = _dates[slideIndex].month;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        if (!widget.shouldShowTransform) {
          return child!;
        }
        double value = 1.0;
        if (_controller.position.haveDimensions) {
          value = _controller.page! - slideIndex;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * widget.height,
            width: Curves.easeOut.transform(value) * screenWidth,
            child: child,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: GridView.count(
                physics: widget.customGridViewPhysics,
                crossAxisCount: 7,
                childAspectRatio: widget.childAspectRatio,
                padding: EdgeInsets.zero,
                children: List.generate(totalItemCount,

                    /// last day of month + weekday
                    (index) {
                  final selectedDateTime = widget.selectedDateTime;
                  bool isToday =
                      DateTime.now().day == index + 1 - _startWeekday &&
                          DateTime.now().month == month &&
                          DateTime.now().year == year;
                  bool isSelectedDay = selectedDateTime != null &&
                      selectedDateTime.year == year &&
                      selectedDateTime.month == month &&
                      selectedDateTime.day == index + 1 - _startWeekday;
                  bool isPrevMonthDay = index < _startWeekday;
                  bool isNextMonthDay = index >=
                      (DateTime(year, month + 1, 0).day) + _startWeekday;
                  bool isThisMonthDay = !isPrevMonthDay && !isNextMonthDay;

                  DateTime now = DateTime(year, month, 1);
                  TextStyle? textStyle;
                  TextStyle defaultTextStyle;
                  if (isPrevMonthDay && !widget.showOnlyCurrentMonthDate) {
                    now = now.subtract(Duration(days: _startWeekday - index));
                    textStyle = widget.prevDaysTextStyle;
                    defaultTextStyle = defaultPrevDaysTextStyle;
                  } else if (isThisMonthDay) {
                    now = DateTime(year, month, index + 1 - _startWeekday);
                    textStyle = isSelectedDay
                        ? widget.selectedDayTextStyle
                        : isToday
                            ? widget.todayTextStyle
                            : widget.daysTextStyle;
                    defaultTextStyle = isSelectedDay
                        ? defaultSelectedDayTextStyle
                        : isToday
                            ? defaultTodayTextStyle
                            : defaultDaysTextStyle;
                  } else if (!widget.showOnlyCurrentMonthDate) {
                    now = DateTime(year, month, index + 1 - _startWeekday);
                    textStyle = widget.nextDaysTextStyle;
                    defaultTextStyle = defaultNextDaysTextStyle;
                  } else {
                    return Container();
                  }
                  final markedDatesMap = widget.markedDatesMap;
                  if (widget.markedDateCustomTextStyle != null &&
                      markedDatesMap != null &&
                      markedDatesMap.getEvents(now).length > 0) {
                    textStyle = widget.markedDateCustomTextStyle;
                  }
                  bool isSelectable = true;
                  if (now.millisecondsSinceEpoch <
                      minDate.millisecondsSinceEpoch)
                    isSelectable = false;
                  else if (now.millisecondsSinceEpoch >
                      maxDate.millisecondsSinceEpoch) isSelectable = false;
                  return renderDay(
                      isSelectable,
                      index,
                      isSelectedDay,
                      isToday,
                      isPrevMonthDay,
                      textStyle,
                      defaultTextStyle,
                      isNextMonthDay,
                      isThisMonthDay,
                      now);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedBuilder weekBuilder(int slideIndex) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<DateTime> weekDays = _weeks[slideIndex];

    weekDays = weekDays
        .map((weekDay) => weekDay.add(Duration(days: firstDayOfWeek)))
        .toList();

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double value = 1.0;
          if (_controller.position.haveDimensions) {
            value = _controller.page! - slideIndex;
            value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
          }

          return Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) * widget.height,
              width: Curves.easeOut.transform(value) * screenWidth,
              child: child,
            ),
          );
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: GridView.count(
                  physics: widget.customGridViewPhysics,
                  crossAxisCount: 7,
                  childAspectRatio: widget.childAspectRatio,
                  padding: EdgeInsets.zero,
                  children: List.generate(weekDays.length, (index) {
                    /// last day of month + weekday
                    bool isToday = weekDays[index].day == DateTime.now().day &&
                        weekDays[index].month == DateTime.now().month &&
                        weekDays[index].year == DateTime.now().year;
                    bool isSelectedDay =
                        this._selectedDate.year == weekDays[index].year &&
                            this._selectedDate.month == weekDays[index].month &&
                            this._selectedDate.day == weekDays[index].day;
                    bool isPrevMonthDay =
                        weekDays[index].month < this._targetDate.month;
                    bool isNextMonthDay =
                        weekDays[index].month > this._targetDate.month;
                    bool isThisMonthDay = !isPrevMonthDay && !isNextMonthDay;

                    DateTime now = DateTime(weekDays[index].year,
                        weekDays[index].month, weekDays[index].day);
                    TextStyle? textStyle;
                    TextStyle defaultTextStyle;
                    if (isPrevMonthDay && !widget.showOnlyCurrentMonthDate) {
                      textStyle = widget.prevDaysTextStyle;
                      defaultTextStyle = defaultPrevDaysTextStyle;
                    } else if (isThisMonthDay) {
                      textStyle = isSelectedDay
                          ? widget.selectedDayTextStyle
                          : isToday
                              ? widget.todayTextStyle
                              : widget.daysTextStyle;
                      defaultTextStyle = isSelectedDay
                          ? defaultSelectedDayTextStyle
                          : isToday
                              ? defaultTodayTextStyle
                              : defaultDaysTextStyle;
                    } else if (!widget.showOnlyCurrentMonthDate) {
                      textStyle = widget.nextDaysTextStyle;
                      defaultTextStyle = defaultNextDaysTextStyle;
                    } else {
                      return Container();
                    }
                    bool isSelectable = true;
                    if (now.millisecondsSinceEpoch <
                        minDate.millisecondsSinceEpoch)
                      isSelectable = false;
                    else if (now.millisecondsSinceEpoch >
                        maxDate.millisecondsSinceEpoch) isSelectable = false;
                    return renderDay(
                        isSelectable,
                        index,
                        isSelectedDay,
                        isToday,
                        isPrevMonthDay,
                        textStyle,
                        defaultTextStyle,
                        isNextMonthDay,
                        isThisMonthDay,
                        now);
                  }),
                ),
              ),
            ),
          ],
        ));
  }

  List<DateTime> _getDaysInWeek([DateTime? selectedDate]) {
    if (selectedDate == null) selectedDate = new DateTime.now();

    var firstDayOfCurrentWeek = _firstDayOfWeek(selectedDate);
    var lastDayOfCurrentWeek = _lastDayOfWeek(selectedDate);

    return _daysInRange(firstDayOfCurrentWeek, lastDayOfCurrentWeek).toList();
  }

  DateTime _firstDayOfWeek(DateTime date) {
    var day = _createUTCMiddayDateTime(date);
    return day.subtract(new Duration(days: date.weekday % 7));
  }

  DateTime _lastDayOfWeek(DateTime date) {
    var day = _createUTCMiddayDateTime(date);
    return day.add(new Duration(days: 7 - day.weekday % 7));
  }

  DateTime _createUTCMiddayDateTime(DateTime date) {
    // Magic const: 12 is to maintain compatibility with date_utils
    return new DateTime.utc(date.year, date.month, date.day, 12, 0, 0);
  }

  Iterable<DateTime> _daysInRange(DateTime start, DateTime end) {
    var offset = start.timeZoneOffset;

    return List<int>.generate(end.difference(start).inDays, (i) => i + 1)
        .map((int i) {
      var d = start.add(Duration(days: i - 1));

      var timeZoneDiff = d.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = d.timeZoneOffset;
        d = d.subtract(new Duration(seconds: timeZoneDiff.inSeconds));
      }
      return d;
    });
  }

  void _onDayLongPressed(DateTime picked) {
    widget.onDayLongPressed?.call(picked);
  }

  void _onDayPressed(DateTime picked) {
    if (picked.millisecondsSinceEpoch < minDate.millisecondsSinceEpoch) return;
    if (picked.millisecondsSinceEpoch > maxDate.millisecondsSinceEpoch) return;

    setState(() {
      _selectedDate = picked;
    });
    widget.onDayPressed
        ?.call(picked, widget.markedDatesMap?.getEvents(picked) ?? const []);
  }

  Future<Null> _selectDateFromPicker() async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: minDate,
      lastDate: maxDate,
    );

    if (selected != null) {
      // updating selected date range based on selected week
      setState(() {
        _selectedDate = selected;
      });
      widget.onDayPressed?.call(
          selected, widget.markedDatesMap?.getEvents(selected) ?? const []);
    }
  }

  void _setDatesAndWeeks() {
    /// Setup default calendar format
    List<DateTime> date = [];
    int currentDateIndex = 0;
    for (int _cnt = 0;
        0 >=
            DateTime(minDate.year, minDate.month + _cnt)
                .difference(DateTime(maxDate.year, maxDate.month))
                .inDays;
        _cnt++) {
      date.add(DateTime(minDate.year, minDate.month + _cnt, 1));
      if (0 ==
          date.last
              .difference(
                  DateTime(this._targetDate.year, this._targetDate.month))
              .inDays) {
        currentDateIndex = _cnt;
      }
    }

    /// Setup week-only format
    List<List<DateTime>> week = [];
    for (int _cnt = 0;
        0 >=
            minDate
                .add(Duration(days: 7 * _cnt))
                .difference(maxDate.add(Duration(days: 7)))
                .inDays;
        _cnt++) {
      week.add(_getDaysInWeek(minDate.add(new Duration(days: 7 * _cnt))));
    }

    _startWeekday = date[currentDateIndex].weekday - firstDayOfWeek;
    /*if (widget.showOnlyCurrentMonthDate) {
      _startWeekday--;
    }*/
    if (/*widget.showOnlyCurrentMonthDate && */ _startWeekday == 7) {
      _startWeekday = 0;
    }
    _endWeekday = DateTime(date[currentDateIndex].year,
                date[currentDateIndex].month + 1, 1)
            .weekday -
        firstDayOfWeek;
    this._dates = date;
    this._weeks = week;
//        this._selectedDate = widget.selectedDateTime != null
//            ? widget.selectedDateTime
//            : DateTime.now();
  }

  void _setDate([int page = -1]) {
    if (page == -1) {
      setState(() {
        _setDatesAndWeeks();
      });
    } else {
      if (widget.weekFormat) {
        setState(() {
          this._pageNum = page;
          this._targetDate = this._weeks[page].first;
        });

        _controller.animateToPage(page,
            duration: Duration(milliseconds: 1), curve: Threshold(0.0));
      } else {
        setState(() {
          this._pageNum = page;
          this._targetDate = this._dates[page];
          _startWeekday = _dates[page].weekday - firstDayOfWeek;
          _endWeekday = _lastDayOfWeek(_dates[page]).weekday - firstDayOfWeek;
        });
        _controller.animateToPage(page,
            duration: Duration(milliseconds: 1), curve: Threshold(0.0));
      }

      //call callback
      final onCalendarChanged = widget.onCalendarChanged;
      if (onCalendarChanged != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onCalendarChanged(!widget.weekFormat
              ? this._dates[page]
              : this._weeks[page][firstDayOfWeek]);
        });
      }
    }
  }

  Widget _renderMarkedMapContainer(DateTime now) {
    if (widget.markedDateShowIcon) {
      return Stack(
        children: _renderMarkedMap(now),
      );
    } else {
      return Container(
        height: double.infinity,
        padding: EdgeInsets.only(bottom: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _renderMarkedMap(now),
        ),
      );
    }
  }

  List<Widget> _renderMarkedMap(DateTime now) {
    final markedEvents = widget.markedDatesMap?.getEvents(now) ?? [];
    final markedDateIconBuilder = widget.markedDateIconBuilder;
    final markedDateWidget = widget.markedDateWidget;
    final markedDateMoreShowTotal = widget.markedDateMoreShowTotal;
    final markedDateMoreCustomTextStyle = widget.markedDateMoreCustomTextStyle;
    final markedDateIconMargin = widget.markedDateIconMargin;
    final markedDateShowIcon = widget.markedDateShowIcon;
    final markedDateIconMaxShown = widget.markedDateIconMaxShown;
    final markedDateIconOffset = widget.markedDateIconOffset;
    final markedDateMoreCustomDecoration =
        widget.markedDateMoreCustomDecoration;

    if (markedEvents.length > 0) {
      List<Widget> tmp = [];
      int count = 0;
      int eventIndex = 0;
      double offset = 0.0;
      double padding = markedDateIconMargin;
      markedEvents.forEach((T event) {
        if (markedDateShowIcon) {
          if (tmp.length > 0 && tmp.length < markedDateIconMaxShown) {
            offset += markedDateIconOffset;
          }
          if (tmp.length < markedDateIconMaxShown &&
              markedDateIconBuilder != null) {
            tmp.add(Center(
                child: new Container(
              padding: EdgeInsets.only(
                top: padding + offset,
                left: padding + offset,
                right: padding - offset,
                bottom: padding - offset,
              ),
              width: double.infinity,
              height: double.infinity,
              child: markedDateIconBuilder(event),
            )));
          } else {
            count++;
          }
          if (count > 0 && markedDateMoreShowTotal != null) {
            tmp.add(
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  width: markedDateMoreShowTotal ? 18 : null,
                  height: markedDateMoreShowTotal ? 18 : null,
                  decoration: markedDateMoreCustomDecoration == null
                      ? new BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(1000.0)),
                        )
                      : markedDateMoreCustomDecoration,
                  child: Center(
                    child: Text(
                      markedDateMoreShowTotal
                          ? (count + markedDateIconMaxShown).toString()
                          : (count.toString() + '+'),
                      semanticsLabel: markedDateMoreShowTotal
                          ? (count + markedDateIconMaxShown).toString()
                          : (count.toString() + '+'),
                      style: markedDateMoreCustomTextStyle == null
                          ? TextStyle(
                              fontSize: 9.0,
                              color: Colors.white,
                              fontWeight: FontWeight.normal)
                          : markedDateMoreCustomTextStyle,
                    ),
                  ),
                ),
              ),
            );
          }
        } else {
          //max 5 dots
          if (eventIndex < 5) {
            Widget? widget;

            if (markedDateIconBuilder != null) {
              widget = markedDateIconBuilder(event);
            }

            if (widget != null) {
              tmp.add(widget);
            } else {
              final dot = event.getDot();
              if (dot != null) {
                tmp.add(dot);
              } else if (markedDateWidget != null) {
                tmp.add(markedDateWidget);
              } else {
                tmp.add(defaultMarkedDateWidget);
              }
            }
          }
        }

        eventIndex++;
      });
      return tmp;
    }
    return [];
  }

  TextStyle getDefaultDayStyle(
    bool isSelectable,
    int index,
    bool isSelectedDay,
    bool isToday,
    bool isPrevMonthDay,
    TextStyle? textStyle,
    TextStyle defaultTextStyle,
    bool isNextMonthDay,
    bool isThisMonthDay,
  ) {
    return !isSelectable
        ? defaultInactiveDaysTextStyle
        : (_localeDate.dateSymbols.WEEKENDRANGE
                    .contains((index - 1 + firstDayOfWeek) % 7)) &&
                !isSelectedDay &&
                !isToday
            ? (isPrevMonthDay
                ? defaultPrevDaysTextStyle
                : isNextMonthDay
                    ? defaultNextDaysTextStyle
                    : isSelectable
                        ? defaultWeekendTextStyle
                        : defaultInactiveWeekendTextStyle)
            : isToday
                ? defaultTodayTextStyle
                : isSelectable && textStyle != null
                    ? textStyle
                    : defaultTextStyle;
  }

  TextStyle? getDayStyle(
      bool isSelectable,
      int index,
      bool isSelectedDay,
      bool isToday,
      bool isPrevMonthDay,
      TextStyle? textStyle,
      TextStyle defaultTextStyle,
      bool isNextMonthDay,
      bool isThisMonthDay,
      DateTime now) {
    // If day is in multiple selection get its style(if available)
    bool isMultipleMarked = widget.multipleMarkedDates?.isMarked(now) ?? false;
    TextStyle? mutipleMarkedTextStyle =
        widget.multipleMarkedDates?.getTextStyle(now);

    return isSelectedDay && widget.selectedDayTextStyle != null
        ? widget.selectedDayTextStyle
        : isMultipleMarked
            ? mutipleMarkedTextStyle
            : (_localeDate.dateSymbols.WEEKENDRANGE
                        .contains((index - 1 + firstDayOfWeek) % 7)) &&
                    !isSelectedDay &&
                    isThisMonthDay &&
                    !isToday
                ? (isSelectable
                    ? widget.weekendTextStyle
                    : widget.inactiveWeekendTextStyle)
                : !isSelectable
                    ? widget.inactiveDaysTextStyle
                    : isPrevMonthDay
                        ? widget.prevDaysTextStyle
                        : isNextMonthDay
                            ? widget.nextDaysTextStyle
                            : isToday
                                ? widget.todayTextStyle
                                : widget.daysTextStyle;
  }

  Widget getDayContainer(
      bool isSelectable,
      int index,
      bool isSelectedDay,
      bool isToday,
      bool isPrevMonthDay,
      TextStyle? textStyle,
      TextStyle defaultTextStyle,
      bool isNextMonthDay,
      bool isThisMonthDay,
      DateTime now) {
    final customDayBuilder = widget.customDayBuilder;

    Widget? dayContainer;
    if (customDayBuilder != null) {
      final appTextStyle = DefaultTextStyle.of(context).style;

      final dayStyle = getDayStyle(
        isSelectable,
        index,
        isSelectedDay,
        isToday,
        isPrevMonthDay,
        textStyle,
        defaultTextStyle,
        isNextMonthDay,
        isThisMonthDay,
        now,
      );

      final styleForBuilder = appTextStyle.merge(dayStyle);

      dayContainer = customDayBuilder(
          isSelectable,
          index,
          isSelectedDay,
          isToday,
          isPrevMonthDay,
          styleForBuilder,
          isNextMonthDay,
          isThisMonthDay,
          now);
    }

    return dayContainer ??
        getDefaultDayContainer(
          isSelectable,
          index,
          isSelectedDay,
          isToday,
          isPrevMonthDay,
          textStyle,
          defaultTextStyle,
          isNextMonthDay,
          isThisMonthDay,
          now,
        );
  }
}

class MultipleMarkedDates {
  List<MarkedDate> markedDates;

  MultipleMarkedDates({required this.markedDates});

  void add(MarkedDate markedDate) {
    markedDates.add(markedDate);
  }

  void addRange(MarkedDate markedDate, {int plus = 0, int minus = 0}) {
    this.add(markedDate);

    if (plus > 0) {
      int start = 1;
      MarkedDate newAddMarkedDate;

      while (start <= plus) {
        newAddMarkedDate = new MarkedDate(
          color: markedDate.color,
          date: markedDate.date.add(Duration(days: start)),
          textStyle: markedDate.textStyle,
        );

        this.add(newAddMarkedDate);

        start += 1;
      }
    }

    if (minus > 0) {
      int start = 1;
      MarkedDate newSubMarkedDate;

      while (start <= minus) {
        newSubMarkedDate = new MarkedDate(
          color: markedDate.color,
          date: markedDate.date.subtract(Duration(days: start)),
          textStyle: markedDate.textStyle,
        );

        this.add(newSubMarkedDate);

        start += 1;
      }
    }
  }

  void addAll(List<MarkedDate> markedDates) {
    this.markedDates.addAll(markedDates);
  }

  bool remove(MarkedDate markedDate) {
    return markedDates.remove(markedDate);
  }

  void clear() {
    markedDates.clear();
  }

  bool isMarked(DateTime date) {
    final results = markedDates.firstWhere((element) => element.date == date,
        orElse: () => MarkedDate(color: Colors.black, date: DateTime(0)));
    return results.date.year == date.year;
  }

  Color getColor(DateTime date) {
    final results = markedDates.firstWhere((element) => element.date == date,
        orElse: () => MarkedDate(color: Colors.black, date: DateTime(0)));
    return results.color;
  }

  DateTime getDate(DateTime date) {
    final results = markedDates.firstWhere((element) => element.date == date,
        orElse: () => MarkedDate(color: Colors.black, date: DateTime(0)));
    return results.date;
  }

  TextStyle? getTextStyle(DateTime date) {
    final results = markedDates.firstWhere((element) => element.date == date,
        orElse: () => MarkedDate(color: Colors.black, date: DateTime(0)));
    return results.textStyle;
  }
}


class CalendarHeader extends StatelessWidget {
  /// Passing in values for [leftButtonIcon] or [rightButtonIcon] will override [headerIconColor]
  CalendarHeader(
      {required this.headerTitle,
      this.headerMargin,
      required this.showHeader,
      this.headerTextStyle,
      this.showHeaderButtons = true,
      this.headerIconColor,
      this.leftButtonIcon,
      this.rightButtonIcon,
      required this.onLeftButtonPressed,
      required this.onRightButtonPressed,
      this.onHeaderTitlePressed})
      : isTitleTouchable = onHeaderTitlePressed != null;

  final String headerTitle;
  final EdgeInsetsGeometry? headerMargin;
  final bool showHeader;
  final TextStyle? headerTextStyle;
  final bool showHeaderButtons;
  final Color? headerIconColor;
  final Widget? leftButtonIcon;
  final Widget? rightButtonIcon;
  final VoidCallback onLeftButtonPressed;
  final VoidCallback onRightButtonPressed;
  final bool isTitleTouchable;
  final VoidCallback? onHeaderTitlePressed;

  TextStyle get getTextStyle => headerTextStyle ?? defaultHeaderTextStyle;

  Widget _leftButton() => IconButton(
        onPressed: onLeftButtonPressed,
        icon:
            leftButtonIcon ?? Icon(Icons.chevron_left, color: headerIconColor),
      );

  Widget _rightButton() => IconButton(
        onPressed: onRightButtonPressed,
        icon: rightButtonIcon ??
            Icon(Icons.chevron_right, color: headerIconColor),
      );

  Widget _headerTouchable() => TextButton(
        onPressed: onHeaderTitlePressed,
        child: Text(
          headerTitle,
          semanticsLabel: headerTitle,
          style: getTextStyle,
        ),
      );

  @override
  Widget build(BuildContext context) => showHeader
      ? Container(
          margin: headerMargin,
          child: DefaultTextStyle(
              style: getTextStyle,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    showHeaderButtons ? _leftButton() : Container(),
                    isTitleTouchable
                        ? _headerTouchable()
                        : Text(headerTitle, style: getTextStyle),
                    showHeaderButtons ? _rightButton() : Container(),
                  ])),
        )
      : Container();
}
const TextStyle defaultHeaderTextStyle = const TextStyle(
  fontSize: 20.0,
  color: Colors.blue,
);
const TextStyle defaultPrevDaysTextStyle = const TextStyle(
  color: Colors.grey,
  fontSize: 14.0,
);
const TextStyle defaultNextDaysTextStyle = const TextStyle(
  color: Colors.grey,
  fontSize: 14.0,
);
const TextStyle defaultDaysTextStyle = const TextStyle(
  color: Colors.black,
  fontSize: 14.0,
);
const TextStyle defaultTodayTextStyle = const TextStyle(
  color: Colors.white,
  fontSize: 14.0,
);
const TextStyle defaultSelectedDayTextStyle = const TextStyle(
  color: Colors.white,
  fontSize: 14.0,
);
const TextStyle defaultWeekdayTextStyle = const TextStyle(
  color: Colors.deepOrange,
  fontSize: 14.0,
);
const TextStyle defaultWeekendTextStyle = const TextStyle(
  color: Colors.pinkAccent,
  fontSize: 14.0,
);
const TextStyle defaultInactiveDaysTextStyle = const TextStyle(
  color: Colors.black38,
  fontSize: 14.0,
);
final TextStyle defaultInactiveWeekendTextStyle = TextStyle(
  color: Colors.pinkAccent.withOpacity(0.6),
  fontSize: 14.0,
);
final Widget defaultMarkedDateWidget = Container(
  margin: EdgeInsets.symmetric(horizontal: 1.0),
  color: Colors.blueAccent,
  height: 4.0,
  width: 4.0,
);


class EventList<T> {
  Map<DateTime, List<T>> events;

  EventList({
    required this.events,
  });

  void add(DateTime date, T event) {
    final eventsOfDate = events[date];
    if (eventsOfDate == null) {
      events[date] = [event];
    } else
      eventsOfDate.add(event);
  }

  void addAll(DateTime date, List<T> events) {
    final eventsOfDate = this.events[date];
    if (eventsOfDate == null)
      this.events[date] = events;
    else
      eventsOfDate.addAll(events);
  }

  bool remove(DateTime date, T event) {
    final eventsOfDate = events[date];
    return eventsOfDate != null ? eventsOfDate.remove(event) : false;
  }

  List<T> removeAll(DateTime date) {
    return events.remove(date) ?? [];
  }

  void clear() {
    events.clear();
  }

  List<T> getEvents(DateTime date) {
    return events[date] ?? [];
  }
}

 

class MarkedDate implements MarkedDateInterface {
  final Color color;
  final int? id;
  final TextStyle? textStyle;
  final DateTime date;

  MarkedDate({
    required this.color,
    this.id,
    this.textStyle,
    required this.date,
  });

  @override
  bool operator ==(dynamic other) {
    return this.date == other.date &&
        this.color == other.color &&
        this.textStyle == other.textStyle &&
        this.id == other.id;
  }

  @override
  DateTime getDate() => this.date;

  @override
  int? getId() => this.id;

  @override
  Color getColor() => this.color;

  @override
  TextStyle? getTextStyle() => this.textStyle;

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}

abstract class MarkedDateInterface {
  DateTime getDate();
  Color getColor();
  int? getId();
  TextStyle? getTextStyle();
}
