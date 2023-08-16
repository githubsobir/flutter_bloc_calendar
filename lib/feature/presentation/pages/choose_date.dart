// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ShowItem extends StatefulWidget {
  int day;
  int type;

  ShowItem({super.key, required this.day, required this.type});

  @override
  State<ShowItem> createState() => _ShowItemState();
}

class _ShowItemState extends State<ShowItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("day ${widget.day}", style:const TextStyle(fontSize: 20, color: Colors.black)),
            Text("type ${widget.type}",style:const TextStyle(fontSize: 20, color: Colors.black))
          ],
        ),
      )),
    );
  }
}
