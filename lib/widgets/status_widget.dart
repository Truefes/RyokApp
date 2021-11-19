import 'dart:ui';
import 'package:ryok_application/widgets/menu_widget.dart';

import 'Status.dart';
import 'package:flutter/material.dart';
import 'package:ryok_application/widgets/Status.dart';
import 'package:ryok_application/widgets/archive_widget.dart';

class status_widget extends StatefulWidget {
  final String? title;
  final Image? image;
  final String? last_updated_message;
  final LimitedBox? status_box;
  final VoidCallback? onPressed;
  final ListView? view_list_of_status;
  final AlertDialog? alert_on_pressed;
  final TextField? add_status;
  final Widget? child;
  final List<Widget>? children;
  List<TextEditingController>? edit_controller = <TextEditingController>[];

  status_widget({
    Key? key,
    this.title,
    this.image,
    this.last_updated_message,
    this.status_box,
    this.view_list_of_status,
    this.alert_on_pressed,
    this.add_status,
    this.child,
    this.children,
    this.edit_controller,
    this.onPressed,
  }) : super(key: key);
  @override
  _status_Widget_State createState() => _status_Widget_State();
}

// ignore: non_constant_identifier_names
void add_status() {}

class _status_Widget_State extends State<status_widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'status'),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        //padding from the top to make space on the top of the icon
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                //constrained box to contrain the maximum height of 150 to the icon
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 150),
                    child: AspectRatio(
                        aspectRatio: 5.5,
                        child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    //place holder for icon,TO DO: needs to be changed to a normal image.
                                    image: AssetImage(
                                        'assets/images/status_page/Group 17.png'))))
                                        ))),
            //TO DO: make a function that shows the last time it was edited or show you havent added a status

            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text("last time edited is"),
            ),
            //this sized box holds the maximum height for the aspect ration below
            SizedBox(
              height: 250,
              child: AspectRatio(
                aspectRatio: 16 / 4,
                child: Container(
                    color: const Color.fromARGB(25, 14, 35, 45),
                    //this list view is within the container to show the list i the same way as the intended way
                    //TO DO: create a function to build notes, and another function to build the list on confirmation from the icon button below
                    child: Builder(
                        builder: (context) => status_page(
                              key: UniqueKey(),
                            ))),
              ),
            ),
            //TO DO: make a container to wrap the list with and have an archive button below the list
            //icon button for the the addition of notes to the list
            IconButton(
              icon: Image.asset(
                  'assets/images/status_page/4639313_archive_books_education_library_icon 1.png'),
              color: const Color.fromRGBO(20, 5, 5, 100),
              iconSize: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => archive_widget()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
