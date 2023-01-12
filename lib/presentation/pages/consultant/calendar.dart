// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/shared/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:e_consulting_flutter/utils/helpers/calendar_helper.dart';

class ConsultantCalendar extends StatefulWidget {
  @override
  _ConsultantCalendarState createState() => _ConsultantCalendarState();
}
class _ConsultantCalendarState extends State<ConsultantCalendar> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff;

  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    initAppointmentsCalendar(BlocProvider.of<AuthCubit>(context).authLogin.user.id);
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        // _rangeStart = null; // Important to clean those
        // _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    var t = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.appointmentCalendar),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,

            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            // rangeStartDay: _rangeStart,
            // rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.saturday,
            calendarStyle: CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
              selectedDecoration: BoxDecoration(
                  color: AppColors.primaryColor, shape: BoxShape.circle),
            ),

            onDaySelected: _onDaySelected,
            // onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    if(BlocProvider.of<AuthCubit>(context).authLogin.user.id == value[index].clientId)
                    {
                      return Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 20,
                          end: 20,
                          bottom: 20
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.all(10),
                          child: Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image(
                                    width: 130,
                                      height: 130,
                                      image: AssetImage('assets/images/Dreamer.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    top: 16
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            size: 25,
                                            color: AppColors.primaryColor,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            t.vacation,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.grey
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            value[index].appointmentStart,
                                            style: TextStyle(
                                                fontSize: 16, fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_sharp,
                                            size: 25,
                                            color: AppColors.primaryColor,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            value[index].appointmentEnd,
                                            style: TextStyle(
                                                fontSize: 16, fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }else
                    {
                      return Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 20,
                          end: 20,
                          bottom: 20
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: CachedNetworkImage(
                                  imageUrl: value[index].image != null
                                      ? "$STORAGE_URL${value[index].image}"
                                      : "https://www.kindpng.com/picc/m/99-997900_headshot-silhouette-person-placeholder-hd-png-download.png",
                                  height: 125,
                                  width: 125,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Image(
                                    image: AssetImage('assets/images/placeHolder.jpg'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.assignment_ind,
                                          size: 25,
                                          color: AppColors.primaryColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          value[index].firstName,
                                          style: TextStyle(
                                              fontSize: 16, fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          value[index].lastName,
                                          style: TextStyle(
                                              fontSize: 16, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 25,
                                          color: AppColors.primaryColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          t.appointment,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          value[index].appointmentStart,
                                          style: TextStyle(
                                              fontSize: 16, fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_sharp,
                                          size: 25,
                                          color: AppColors.primaryColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          value[index].appointmentEnd,
                                          style: TextStyle(
                                              fontSize: 16, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
