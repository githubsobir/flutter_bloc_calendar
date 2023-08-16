import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_calendar/feature/domain/usecases/get_data_calendar.dart';
import 'package:flutter_bloc_calendar/feature/presentation/bloc/bloc_event.dart';
import 'package:flutter_bloc_calendar/feature/presentation/bloc/bloc_main.dart';
import 'package:flutter_bloc_calendar/feature/presentation/bloc/bloc_state.dart';
import 'package:flutter_bloc_calendar/feature/presentation/pages/choose_date.dart';

class CalendarMain extends StatefulWidget {
  const CalendarMain({super.key});

  @override
  State<CalendarMain> createState() => _CalendarMainState();
}

class _CalendarMainState extends State<CalendarMain> {
  List<String> week = [
    "Du",
    "Se",
    "Cho",
    "Pa",
    "Ju",
    "Sha",
    "Ya",
  ];

  @override
  Widget build(BuildContext context) {
    final userRepository = GetCalendarData();
    return BlocProvider(
        create: (context) =>
            BlocMain(getCalendarData: userRepository)..add(BlocEventGetData()),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: BlocBuilder<BlocMain, BlocState>(
                builder: (context, state) {
                  if (state is BlocStateLoading) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  } else if (state is BlocStateLoaded) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          child: ListView.builder(
                            itemCount: week.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.14,
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(week[index],
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: const TextStyle(fontSize: 12)),
                              )),
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7,
                                ),
                                itemCount: state.listModelIntegration.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          builder: (BuildContext context) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                height: 300,
                                                child: ShowItem(
                                                    day: state
                                                            .listModelIntegration[
                                                                index]
                                                            .day +
                                                        1,
                                                    type: state
                                                        .listModelIntegration[
                                                            index]
                                                        .type),
                                              ),
                                            );
                                          });
                                    },
                                    child: Container(
                                        margin: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: state
                                                  .listModelIntegration[index]
                                                  .color
                                                  .isNotEmpty
                                              ? (state.listModelIntegration[index].day +
                                                              1) %
                                                          7 !=
                                                      0
                                                  ? Color(int.parse(
                                                          state
                                                              .listModelIntegration[
                                                                  index]
                                                              .color
                                                              .substring(1, 7),
                                                          radix: 16) +
                                                      0xFF000000)
                                                  : Colors.white
                                              : Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                            child: Text(
                                          '${state.listModelIntegration[index].day + 1}',
                                          style: TextStyle(
                                              color:
                                                  (state.listModelIntegration[index]
                                                                      .day +
                                                                  1) %
                                                              7 ==
                                                          0
                                                      ? Colors.red
                                                      : Colors.black),
                                        ))),
                                  );
                                })),
                      ],
                    );
                  } else if (state is BlocStateError) {
                    return const Center(
                      child: Text("xatolik"),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ))));
  }
}
