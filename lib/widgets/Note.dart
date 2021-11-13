import 'dart:convert';
import 'package:flutter/material.dart';

class Note{
  int id;
  /*
  DateFormat later to display in the way you want, for ex:
  DateFormat('EEEE').format(date); // prints Tuesday
  DateFormat('EEEE, d MMM, yyyy').format(date); // prints Tuesday, 10 Dec, 2019
  DateFormat('h:mm a').format(date); // prints 10:02 AM
  */
  DateTime time_created;
  String health_report;
  String description;
  int is_archived = 0;
Note(this.id,this.time_created,this.health_report,this.description);

Map<String,dynamic> to_map(bool for_update){
  var data={
    'health_report': utf8.encode(health_report),
    'description':utf8.encode(description),
    //'time_created': epochFromDate(time_created),
    'int_is_archived': is_archived
  };if(for_update){
    data["id"]=this.id;
  }return data;
}
}