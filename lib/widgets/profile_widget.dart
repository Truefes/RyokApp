import 'package:flutter/material.dart';

class profile_widget extends StatefulWidget {
  final String? title;
  final Widget? child;
  final List<Widget>? children;
  profile_widget({
    Key? key,
    this.title,
    this.child,
    this.children,
  }) : super(key: key);
  @override
  _profile_Widget_State createState() => _profile_Widget_State();
}

class _profile_Widget_State extends State<profile_widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Profile'),
      ),
      body: Column(
        children: [
          Center(
            child: Stack(clipBehavior: Clip.none, children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 300),
                child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Positioned(
                      top:100,
                      child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  //place holder for icon,TO DO: needs to be changed to a normal image.
                                  image: AssetImage(
                                      'assets/images/profile_page/TopPlaceHolder.png')))),
                    )),
              ),
              Positioned(
                bottom: -300,
                child: Container(
                  height: 300,
                  width: 532,
                  color: Colors.black,
                ),
              ),
              Positioned(
                bottom: -301,
                child: Container(
                  height: 300,
                  width: 533,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: -100,
                left: -170,
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 155),
                    child: AspectRatio(
                        aspectRatio: 5.5,
                        child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    //place holder for icon,TO DO: needs to be changed to a normal image.
                                    image: AssetImage(
                                        'assets/images/profile_page/ProfileImage.png')))))),
              ),
              Positioned(
                bottom: -110,
                right: 170,
                child: IconButton(
                  icon:
                      Image.asset('assets/images/profile_page/SwitchImage.png'),
                  onPressed: () {},
                  iconSize: 40,
                ),
              ),
              Positioned(
                bottom: -551,
                child: Container(
                  height: 300,
                  width: 533,
                  color: Colors.grey,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
