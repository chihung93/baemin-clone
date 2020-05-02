import 'package:baeminapp/common/EmptyAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';

import '../../constant.dart';

class HomePage extends StatefulWidget {
  CarouselController bannerController = CarouselController();
  List<String> banners = [
    "assets/icons/banner_1.jpg",
    "assets/icons/banner_2.jpeg",
    "assets/icons/banner_3.jpeg",
    "assets/icons/banner_4.jpeg",
    "assets/icons/banner_5.jpeg",
    "assets/icons/banner_6.jpg",
    "assets/icons/banner_7.jpg",
    "assets/icons/banner_8.jpg"
  ];

  List<String> categories = [
    "assets/icons/cate_1.png",
    "assets/icons/cate_2.png",
    "assets/icons/cate_3.png",
    "assets/icons/cate_4.png",
    "assets/icons/cate_5.png",
    "assets/icons/cate_6.png",
    "assets/icons/cate_7.png",
    "assets/icons/cate_8.png"
  ];

  List<String> categoriesName = [
    "Cơm Phần",
    "Đi Chợ",
    "Bún/Phở",
    "Chuỗi",
    "Ăn Vặt",
    "Gà Rán",
    "Món Hàn",
    "Trà Sữa",
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _currentBanner = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _displaySnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    double heightBanner = MediaQuery.of(context).size.height / 4;
    return Scaffold(
        key: _scaffoldKey,
        primary: false,
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Icon(
                              Icons.location_on,
                              color: kColorAccent,
                            )),
                        Expanded(
                          child: Text(
                            "Tp HCM Việt Nam, 123A/12/BA Nguyễn Văn Nghi Chợ Gò Vấp",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kTitleTextstyle.copyWith(
                                color: Colors.black,
                                fontFamily: "Roboto_Medium"),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(8, 3, 8, 0),
                            child: Image(
                              image: AssetImage("assets/icons/email.png"),
                              width: 20,
                              height: 17,
                            )),
                        Padding(
                            padding: EdgeInsets.fromLTRB(8, 2, 8, 0),
                            child: Image(
                              image: AssetImage("assets/icons/three_lines.png"),
                              width: 17,
                              height: 17,
                            ))
                      ],
                    ))),
                /**
                 * Search bar
                 * */
                Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 8),
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xFFf5f7fa),
                    borderRadius: BorderRadius.all(
                        Radius.circular(20.0) //         <--- border radius here
                        ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        color: kTextLightColor,
                      ),
                      Text(
                        "Tìm nhà hàng, món ăn",
                        style: kSubTextStyle.copyWith(
                            fontSize: 14, fontFamily: "Roboto_Regular"),
                      )
                    ],
                  ),
                ),

                /**
                 * Slider
                 * */
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    CarouselSlider(
                      items: widget.banners
                          .map((item) => Container(
                                width: MediaQuery.of(context).size.width,
                                height: heightBanner,
                                child: Center(
                                    child: Image(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: heightBanner,
                                        fit: BoxFit.cover,
                                        image: AssetImage(item))),
                              ))
                          .toList(),
                      carouselController: widget.bannerController,
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 1),
                          onPageChanged: (pageIndex, _) {
                            setState(() {
                              _currentBanner = pageIndex;
                            });
                          }),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                            onTap: () {
                              widget.bannerController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              alignment: Alignment.center,
                              height: 35,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Color(0xFFeaf0d6).withOpacity(0.8),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0)),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                      child: Text(
                                        "${_currentBanner + 1}/${widget.banners.length}",
                                        style: kTitleTextstyle.copyWith(
                                            fontSize: 14,
                                            fontFamily: "Roboto_Bold",
                                            color: Colors.black),
                                      )),
                                  Icon(
                                    Icons.navigate_next,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            )))
                  ],
                ),

                /**
                 * Categories
                 * */
                GridView.count(
                  childAspectRatio: 1.0,
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  children: List.generate(widget.categories.length, (index) {
                    return InkWell(
                        onTap: () {
                          _displaySnackBar(
                              context, widget.categoriesName[index]);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                                    height: 80,
                                    fit: BoxFit.fitWidth,
                                    image:
                                        AssetImage(widget.categories[index])),
                            Center(child: Text(
                              widget.categoriesName[index],
                              style: kTitleTextstyle.copyWith(
                                  color: Colors.black, fontSize: 14),
                            )),
                          ],
                        ));
                  }),
                ),
                Container(
                  height: 10,
                  color: Color(0xFFf4f6fc),
                ),
                InkWell(
                    onTap: () {},
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image(
                              image: AssetImage("assets/icons/voucher.png"),
                              width: 20,
                              height: 17,
                            ),
                            Expanded(
                                child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '   Bạn ơi,',
                                      style: kNomalTextStyle.copyWith(
                                          fontFamily: "Roboto_Regular")),
                                  TextSpan(
                                      text: '12',
                                      style: kNomalTextStyle.copyWith(
                                          fontFamily: "Roboto_Bold",
                                          fontWeight: FontWeight.bold,
                                          color: kColorAccent)),
                                  TextSpan(
                                      text: ' mã giảm giá vẫy gọi nè',
                                      style: kNomalTextStyle.copyWith(
                                          fontFamily: "Roboto_Regular")),
                                ],
                              ),
                            )),
                            Text("Xem",
                                style: kNomalTextStyle.copyWith(
                                    fontFamily: "Roboto_Bold",
                                    fontWeight: FontWeight.bold,
                                    color: kColorAccent))
                          ],
                        ))),
                Container(
                  height: 10,
                  color: Color(0xFFf4f6fc),
                ),
              ],
            ),
          ),
        ));
  }
}
