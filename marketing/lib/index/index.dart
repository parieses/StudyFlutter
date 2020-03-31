import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:marketing/common/HttpUtils.dart';

// ignore: must_be_immutable
class Index extends StatefulWidget {
  Index({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _index createState() => _index();
}

// ignore: camel_case_types
class _index extends State<Index> {
  List listData;
  int length = 0;

  void _initData() {
    HttpUtils.request('home-page/rotation-chart', method: HttpUtils.GET)
        .then((result) {
      setState(() {
        listData = result['data'];
        length = result['data'].length;
      });
    });
  }

  void initState() {
    this._initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new ListView(
          // 这里使用listView是因为本地写了几组不同样式的展示，太懒了，所以这里就没有改
          children: [
            firstSwiperView(),
            CoachView(),
          ],
        ));
  }

  //轮播图
  Widget firstSwiperView() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      width: MediaQuery.of(context).size.width,
      height: 160,
      child: Swiper(
        itemCount: length,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54, activeColor: Colors.white)),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }

  //轮播图的具体图片
  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      listData[index]['pic'],
      fit: BoxFit.fill,
    ));
  }

  // ignore: non_constant_identifier_names
  Widget CoachView({EdgeInsets padding, Row child}) {
    return Container(
        padding: const EdgeInsets.all(32.0),
        child: new Row(
            children: [
              new Expanded(
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                      ]
                  )
              )
        ]
        )
    );
  }
}
