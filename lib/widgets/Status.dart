import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'StatusPage.dart';

class status_page extends StatefulWidget {
  status_page({required Key key}) : super(key: key);

  @override
  _status_pageState createState() => _status_pageState();
}

class _status_pageState extends State<status_page> {
  var _formKey = GlobalKey<FormState>();
  DateTime time=DateTime.now();
  @override
  void initState() {
    super.initState();
    statussDescriptionMaxLenth =
        statusDescriptionMaxLines * statusDescriptionMaxLines;
  }

  @override
  void dispose() {
    status_description_controller.dispose();
    statusHeadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: notesHeader(),
      ),
      body: statusHeading.length > 0
          ? buildNotes()
          : Center(child: Text("Add Status...")),
      floatingActionButton: Center(
        child: IconButton(
          icon:Image.asset(
                    'assets/images/status_page/1814113_add_more_plus_icon 1.png'),
                    iconSize: 50,
                    onPressed: () {
                      _settingModalBottomSheet(context);
                    },

        ),
      ),
    );
  }

  Widget buildNotes() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: new ListView.builder(
        itemCount: statusHeading.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5.5),
            child: new Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                setState(() {
                  deletedStatusHeading = statusHeading[index];
                  deletedStatusDescription = statusDescription[index];
                  statusHeading.removeAt(index);
                  statusDescription.removeAt(index);
                  Scaffold.of(context).showSnackBar(
                    new SnackBar(
                      backgroundColor: Colors.purple,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "status Deleted",
                            style: TextStyle(),
                          ),
                          deletedStatusHeading != ""
                              ? GestureDetector(
                                  onTap: () {
                                    print("undo");
                                    setState(() {
                                      if (deletedStatusHeading != "") {
                                        statusHeading.add(deletedStatusHeading);
                                        statusDescription
                                            .add(deletedStatusDescription);
                                      }
                                      deletedStatusHeading = "";
                                      deletedStatusDescription = "";
                                    });
                                  },
                                  child: new Text(
                                    "Undo",
                                    style: TextStyle(),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  );
                });
              },
              background: ClipRRect(
                borderRadius: BorderRadius.circular(5.5),
                child: Container(
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              
              child: statusList(index),
            ),
          );
        },
      ),
    );
    
  }

  Widget statusList(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.5),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: statusColor[(index % statusColor.length).floor()],
          borderRadius: BorderRadius.circular(5.5),
        ),
        height: 100,
        child: Center(
          child: Row(
            children: [
              new Container(
                color:
                    statusMarginColor[(index % statusMarginColor.length).floor()],
                width: 3.5,
                height: double.infinity,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          statusHeading[index],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20.00,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.5,
                      ),
                      Flexible(
                        child: Container(
                          height: double.infinity,
                          child: AutoSizeText(
                            "${(statusDescription[index])}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15.00,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 50,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext bc) {
        return Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: (MediaQuery.of(context).size.height),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 250, top: 50),
                  child: new Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Status",
                            style: TextStyle(
                              fontSize: 20.00,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  statusHeading.add(statusHeadingController.text);
                                  statusDescription
                                      .add(status_description_controller.text);
                                  statusHeadingController.clear();
                                  status_description_controller.clear();
                                });
                                Navigator.pop(context);
                              }
                              print("Notes.dart LineNo:239");
                              print(statusHeadingController.text);
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Save",
                                    style: TextStyle(
                                      fontSize: 20.00,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.blueAccent,
                        thickness: 2.5,
                      ),
                      TextFormField(
                        maxLength: statusHeaderMaxLenth,
                        controller: statusHeadingController,
                        decoration: InputDecoration(
                          hintText: "Status Heading",
                          hintStyle: TextStyle(
                            fontSize: 15.00,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(Icons.text_fields),
                        ),
                        validator: ( noteHeading) {
                          if (noteHeading!.isEmpty) {
                            return "Please enter Status Heading";
                          } else if (noteHeading.startsWith(" ")) {
                            return "Please avoid whitespaces";
                          }
                        },
                        onFieldSubmitted: (String value) {
                          FocusScope.of(context)
                              .requestFocus(textSecondFocusNode);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          margin: EdgeInsets.all(1),
                          height: 5 * 24.0,
                          child: TextFormField(
                            focusNode: textSecondFocusNode,
                            maxLines: statusDescriptionMaxLines,
                            maxLength: statussDescriptionMaxLenth,
                            controller: status_description_controller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Description',
                              hintStyle: TextStyle(
                                fontSize: 15.00,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            validator: ( status_description) {
                              if (status_description!.isEmpty) {
                                return "Please enter Status Desc";
                              } else if (status_description.startsWith(" ")) {
                                return "Please avoid whitespaces";
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget notesHeader() {
  return Padding(
    padding: const EdgeInsets.only(
      top: 10,
      left: 2.5,
      right: 2.5,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Status",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 25.00,
            fontWeight: FontWeight.w500,
          ),
        ),
        Divider(
          color: Colors.blueAccent,
          thickness: 2.5,
        ),
      ],
    ),
  );
}