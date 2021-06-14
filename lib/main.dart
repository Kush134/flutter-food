import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selected = 'EVENTS';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 400.0,
              ),
              ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent])
                        .createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset('assets/images.jpg',
                      height: 300.0, fit: BoxFit.cover)),
              RotatedBox(
                quarterTurns: 3,
                child: Text('NASA',
                    style: TextStyle(
                        fontSize: 75,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.3),
                        letterSpacing: 10.0)),
              ),
              Positioned(
                top: 4.0,
                right: 4.0,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white),
                  child: Center(
                    child: Icon(Icons.menu),
                  ),
                ),
              ),
              Positioned(
                top: 2.0,
                right: 5.0,
                child: Container(
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Color(0xFFFD3664)),
                ),
              ),
              Positioned(
                  top: 200.0,
                  left: 40.0,
                  child: Column(
                    children: <Widget>[
                      Text('WELCOME TO',
                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 32.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white))
                    ],
                  )),
              Positioned(
                  top: 235.0,
                  left: 40.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('NASA',
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFD3664))),
                          Text(',',
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(width: 10.0),
                          Text('COMMUNITY',
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      )
                    ],
                  )),
              Positioned(
                  top: 320.0,
                  left: 25.0,
                  right: 25.0,
                  child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Color(0xFF262626),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0))),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Lets explore some knowledge here...',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 12.0),
                            contentPadding: EdgeInsets.only(top: 15.0),
                            prefixIcon: Icon(Icons.search, color: Colors.white)),
                      )))
            ],
          ),
          //Get out of the stack for the options
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _buildMenuItem('EVENTS', Icons.location_city),
            _buildMenuItem('HISTORY', Icons.history),
            _buildMenuItem('LUNCHES', Icons.launch),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMenuItem('COMET', Icons.star),
              _buildMenuItem('FACTS', Icons.cloud),
              _buildMenuItem('TEAM', Icons.person),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMenuItem('LIVE', Icons.live_tv),
              _buildMenuItem('IMAGES', Icons.image),
              _buildMenuItem('TV', Icons.tv),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(String Name, iconData) {
    return InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          selectMenuOption(Name);
        },
        child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 300),
            height: selected == Name ? 100.0 : 75.0,
            width: selected == Name ? 100.0 : 75.0,
            color: selected == Name
                ? Color(0xFFFD3566)
                : Colors.transparent,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                iconData,
                color: selected == Name ? Colors.white : Colors.grey,
                size: 25.0,
              ),
              SizedBox(height: 12.0),
              Text(Name,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color:
                          selected == Name ? Colors.white : Colors.grey,
                      fontSize: 10.0))
            ])));
  }

  selectMenuOption(String Name) {
    setState(() {
      selected = Name;
    });
  }
}
