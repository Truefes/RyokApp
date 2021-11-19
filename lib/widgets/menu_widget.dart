import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ryok_application/widgets/profile_widget.dart';
import 'status_widget.dart';

class menu_widget extends StatelessWidget {
  final Widget? child;
  final List<Widget>? children;
  menu_widget({Key? key, this.child, this.children});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Menu',
        style: TextStyle(fontSize: 29),),
        backgroundColor: Colors.deepPurple[800],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 550, maxWidth: 550),
          child: GridView.count(
            shrinkWrap: true,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            crossAxisCount: 2,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    children: [
                      TextButton.icon(
                          onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => profile_widget()),
                      );},
                          icon: Image.asset(
                              'assets/images/menu_page/Profile.png'),
                          label: Text('')),
                      Text('Profile')
                    ],
                  ),
                ),
              ),Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                              'assets/images/menu_page/Contacts.png'),
                          label: Text('')),
                      Text('Contacts')
                    ],
                  ),
                ),
              ),Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    children: [
                      TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => status_widget()),
                      );
                    },
                    icon: Image.asset('assets/images/menu_page/Status.png'),
                    label: Text('')),
                      Text('Status')
                    ],
                  ),
                ),
              ),Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                              'assets/images/menu_page/Setting.png'),
                          label: Text('')),
                      Text('Settings')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: TextButton(onPressed: (){}, child: Text('LogOut', style: TextStyle(color: Colors.deepPurple[800],fontSize: 20),)),
        ),
      ),
    );
  }
}
