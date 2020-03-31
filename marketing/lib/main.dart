import 'package:flutter/material.dart';
import 'package:marketing/index/index.dart';
import 'package:marketing/my/my.dart';
import 'package:marketing/shop/shop.dart';
import 'package:marketing/class/class.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: '路由'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> _bottomNavPages = List(); // 底部导航栏各个可切换页面组
  void initState() {
    super.initState();
    _bottomNavPages
      ..add(Index(title: '首页'))
      ..add(Shop(title: '购买'))
      ..add(Class(title: '课程'))
      ..add(My(title: '我的'));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('确定退出程序吗?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('暂不'),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text('确定'),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            ));
  }

//将Scaffold 作为WillPopScope的子控件
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            // 底部导航
            type: BottomNavigationBarType.fixed,
            //指定为fixed就解决了。
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_shopping_cart), title: Text('购买')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.class_), title: Text('课程')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), title: Text('我的')),
            ],
            currentIndex: _selectedIndex,
            fixedColor: Colors.purpleAccent,
            onTap: _onItemTapped,
          ),
          body: _bottomNavPages[_selectedIndex],
        ));
  }
}
