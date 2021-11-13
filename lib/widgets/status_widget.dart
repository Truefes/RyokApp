import 'package:flutter/material.dart';
import 'package:ryok_application/widgets/Note.dart';

class status_widget extends StatefulWidget{
  final String? title;
  final Image? image;
  final String? last_updated_message;
  final LimitedBox? status_box;
  final Note? status;
  final VoidCallback? onPressed;
  final ListView? view_list_of_status;
  final AlertDialog? alert_on_pressed;
  final TextField? add_status;
  final Note?  create_note_on_pressed;
  final Widget? child;
  final List<Widget>? children;
  List <TextEditingController>? edit_controller=<TextEditingController>[];

  status_widget({
    Key? key,
    this.title,
    this.image,
    this.last_updated_message,
    this. status_box,
    this. status,
    this.view_list_of_status, 
    this.alert_on_pressed, 
    this.add_status, 
    this. create_note_on_pressed, 
    this.child, 
    this.children, 
    this. edit_controller, this.onPressed, }) 
    : super(key: key);

@override
  _status_Widget_State createState() => _status_Widget_State();
}

class _status_Widget_State extends State<status_widget>{
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'status'),
      ),
      body:Container(
          padding: const EdgeInsets.fromLTRB(0,10,0,0),        
          child: Column(children: [
          AspectRatio(
          aspectRatio: 5.5,
          child:
           Container(
            width: 190.0,
            height: 190.0,
            decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image:  DecorationImage(
            fit: BoxFit.contain,
            image:  NetworkImage(
                 "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png")
                 )
))),
        ],),
      )
    );
  }
}
