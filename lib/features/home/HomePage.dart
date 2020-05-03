import 'package:baeminapp/common/EmptyAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';
import 'dart:math';

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

  List<String> vouchersPercents = [
    "${Random().nextInt(30)}% Off | T2-CN",
    "${Random().nextInt(60)}% Off | T3-T5",
    "${Random().nextInt(80)}% Off | T5-CN",
    "${Random().nextInt(99)}% Off | T7-CN",
  ];

  List<String> foodRecommendationToday = [
    "Khao bạn ${Random().nextInt(30)}K menu này nha",
    "Khao bạn ${Random().nextInt(80)}K menu này nha",
    "Khao bạn ${Random().nextInt(123)}K menu này nha",
    "Khao bạn ${Random().nextInt(212)}K menu này nha",
  ];

  List<String> address = [
    "Ozzy - Nguyễn Đức cảnh",
    "Yến Chân Long - Dương Quảng Hàm",
    "Farmers' Market Nguyễn Thị Thập",
    "GoGi House Nguyễn Thị Thập",
    "3G Trois Gourmands Saigon",
    "4Ps Pizza Saigon",
    "Au Lac do Brazil",
    "Bamboo Chic Restaurant Saigon",
    "Banh Mi 37",
    "Banh Xeo 46A",
    "Bun Bo Xu",
    "Cafe Cardinal Saigon",
    "Camargue",
    "Cantina Central",
    "Cobalt Wine Bar & Restaurant",
    "Din Ky Restaurant Saigon",
    "EON 51 Fine Dining Saigon",
    "Hideaway Café Saigon",
    "ID Café Saigon",
    "La Cuisine",
    "La Brasserie at Hotel Nikko Saigon",
    "New York Steakhouse & Winery",
    "Nguyen Thi Thanh (The Lunch Lady)",
    "The Refinery Bar and Restaurant",
  ];

  List<String> foodPhoto = [
    "https://www.remotelands.com/travelogues/app/uploads/2018/05/Anan_3.jpg",
    "https://everydaymonkey.com/wp-content/uploads/2018/09/leesamantha.jpg",
    "https://mymodernmet.com/wp/wp-content/uploads/2017/06/food-art-healthy-desserts-foodbites-1-1.jpg",
    "https://4.bp.blogspot.com/-rPf2o5NAos4/UmFkcLePN4I/AAAAAAAABMw/4AudqcQFKzw/s1600/food+art7.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/13/cc/26/08/grilled-sea-bass-chef.jpg",
    "https://www.abudhabitalking.com/wp-content/uploads/2019/02/CP_IMG_3836-1-768x512.jpg",
    "https://www.itourvn.com/images/easyblog_articles/828/b2ap3_large_a-bite-1.jpg",
    "https://media.cooky.vn/article/s640/Article2696-636111865848504395.jpg",
    "https://www.asia-bars.com/wp-content/uploads/2017/09/Vietnam-House-Wagyu-Beef-Pho-I.jpg",
    "https://ahima17.discoverlosangeles.com/sites/default/files/styles/listography_image/public/media/restaurants/ramen-champ-tonkotsu-ramen-chinatown.jpg",
    "https://www.itourvn.com/images/easyblog_articles/681/vietnamese-rice-paper-wrappers-cover.jpg",
    "https://yummyvietnam.net/wp-content/uploads/2019/12/Banh-trang-nuong-recipe%E2%80%93Vietnamese-grilled-rice-paper-11.jpg",
    "https://vietnamcoracle.com/wp-content/uploads/2018/05/IMG_3385-copy-blog-1024x768.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/16/a9/6c/16/waffles-with-banana-balsamic.jpg",
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  double heightBanner = 0;
  int _currentBanner = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _displaySnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    heightBanner = MediaQuery.of(context).size.height / 4;
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
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 40,
                        itemBuilder: (BuildContext context, int position) {
                          switch (position) {
                            case 0:
                              return _slider(context);
                            case 1:
                              return _categories(context);
                            case 3:
                              return _vouchersCount(context);
                            case 5:
                              return _discountTime(context);
                            case 7:
                              return _foodRecommendationToday(context);
                            case 9:
                              return _foodRecommendationPromo(context);
                            case 11:
                              return Padding(
                                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                                  child: Text(
                                    "Restaurants Near You",
                                    style: kTitleTextstyle,
                                  ));
                            case 12:
                            case 14:
                            case 16:
                            case 18:
                            case 20:
                            case 22:
                            case 24:
                            case 26:
                            case 28:
                            case 30:
                            case 32:
                            case 34:
                            case 36:
                            case 38:
                              return _foodRecommendationNearMe(context,
                                  Random().nextInt(widget.foodPhoto.length));
                            case 13:
                            case 15:
                            case 17:
                            case 19:
                            case 21:
                            case 23:
                            case 25:
                            case 27:
                            case 29:
                            case 31:
                            case 33:
                            case 35:
                            case 37:
                            case 39:
                              return _dividerSmall(context);
                            default:
                              return _dividerLarge(context);
                          }
                        })),
              ],
            ),
          ),
        ));
  }

  /// Slider
  Widget _slider(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        CarouselSlider(
          items: widget.foodPhoto
              .map((item) => Container(
                    width: MediaQuery.of(context).size.width,
                    height: heightBanner,
                    child: Center(
                        child: Image.network(
                      item,
                      width: MediaQuery.of(context).size.width,
                      height: heightBanner,
                      fit: BoxFit.cover,
                    )),
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
                  width: _currentBanner + 1 <= 9 ? 80 : 85,
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
                            "${_currentBanner + 1}/${widget.foodPhoto.length}",
                            style: kTitleTextstyle.copyWith(
                                fontSize: 14,
                                fontFamily: "Roboto_Bold",
                                color: Colors.black),
                          )),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                        size: 25,
                      )
                    ],
                  ),
                )))
      ],
    );
  }

  /// Categories
  Widget _categories(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 1.0,
      shrinkWrap: true,
      crossAxisCount: 4,
      children: List.generate(widget.categories.length, (index) {
        return InkWell(
            onTap: () {
              _displaySnackBar(context, widget.categoriesName[index]);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                    height: 80,
                    fit: BoxFit.fitWidth,
                    image: AssetImage(widget.categories[index])),
                Center(
                    child: Text(
                  widget.categoriesName[index],
                  style: kTitleTextstyle.copyWith(
                      color: Colors.black, fontSize: 14),
                )),
              ],
            ));
      }),
    );
  }

  /// Divider
  Widget _dividerLarge(BuildContext context) {
    return Container(
      height: 10,
      color: Color(0xFFf4f6fc),
    );
  }

  Widget _dividerSmall(BuildContext context) {
    return Container(
      height: 0.5,
      color: Color(0xFFBDBDBD),
    );
  }

  /// Vouchers
  Widget _vouchersCount(BuildContext context) {
    return InkWell(
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
            )));
  }

  /// Discount time
  Widget _discountTime(BuildContext context) {
    return Container(
      color: Colors.white,
      height: heightBanner / 2,
      child: ListView.separated(
          itemCount: widget.vouchersPercents.length,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: 0,
              ),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _displaySnackBar(
                              context, widget.vouchersPercents[index]);
                        },
                        child: Container(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width / 16,
                                0,
                                0,
                                0),
                            width: MediaQuery.of(context).size.width / 1.5,
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            decoration: BoxDecoration(
                                color: Color(0xFF71d173),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Nhập HENRYCODE",
                                  style: kTitleTextstyle.copyWith(
                                      color: Colors.white,
                                      fontFamily: "Roboto_Bold",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                Text(
                                  widget.vouchersPercents[index],
                                  style: kTitleTextstyle.copyWith(
                                      color: Colors.white,
                                      fontFamily: "Roboto_Bold",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ],
                            )),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          alignment: Alignment.centerLeft,
                          color: Colors.transparent,
                          child: Image.asset(
                              "assets/icons/voucher_${index + 1}.png",
                              fit: BoxFit.fitHeight,
                              height: heightBanner / 2)),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width / 1.7, 0, 0, 0),
                        child: Icon(Icons.navigate_next, color: Colors.white70),
                      )
                    ],
                  )),
            );
          }),
    );
  }

  /// food today
  Widget _foodRecommendationToday(BuildContext context) {
    return Container(
      color: Colors.white,
      height: heightBanner + heightBanner / 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              "Hôm nay ăn gì?",
              style: kTitleTextstyle,
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemCount: widget.foodRecommendationToday.length,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                      width: 0,
                    ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: EdgeInsets.fromLTRB(
                          16,
                          16,
                          index == widget.foodRecommendationToday.length - 1
                              ? 16
                              : 0,
                          16),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.foodPhoto[index]),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: Colors.white70, //
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Material(
                        color: Colors.white.withOpacity(0.0),
                        child: InkWell(
                          onTap: () {
                            _displaySnackBar(
                                context, widget.foodRecommendationToday[index]);
                          },
                          child: Container(
                              decoration: new BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                color: Colors.purple,
                                gradient: new LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.grey.withOpacity(0.7),
                                    ],
                                    stops: [
                                      0.0,
                                      1.0
                                    ],
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    tileMode: TileMode.repeated),
                              ),
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Lần đầu order Beamin thì ăn gì?",
                                    style: kTitleTextstyle.copyWith(
                                        color: Colors.white,
                                        fontFamily: "Roboto_Bold",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    widget.foodRecommendationToday[index],
                                    style: kTitleTextstyle.copyWith(
                                        color: Colors.white,
                                        fontFamily: "Roboto_Bold",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ],
                              )),
                        ),
                      ));
                }),
          )
        ],
      ),
    );
  }

  /// promo block
  Widget _foodRecommendationPromo(BuildContext context) {
    return Container(
      color: Colors.white,
      height: heightBanner + heightBanner / 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "BEAMIN Đi Chợ - FREESHIP",
                  style: kTitleTextstyle,
                ),
                Material(
                    color: Colors.white.withOpacity(0.0),
                    child: InkWell(
                        onTap: () {},
                        child: Text("Xem",
                            style: kNomalTextStyle.copyWith(
                                fontFamily: "Roboto_Bold",
                                fontWeight: FontWeight.bold,
                                color: kColorAccent))))
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemCount: widget.foodPhoto.length,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                      width: 8,
                    ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                      color: Colors.white.withOpacity(0.0),
                      child: InkWell(
                          onTap: () {
                            _displaySnackBar(context, widget.address[index]);
                          },
                          child: Container(
                              margin: EdgeInsets.fromLTRB(
                                  index == 0 ? 16 : 0,
                                  16,
                                  widget.address.length - 1 ==
                                          index
                                      ? 16
                                      : 0,
                                  16),
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Expanded(
                                          child: Container(
                                        margin: EdgeInsets.fromLTRB(8, 8, 0, 0),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  widget.foodPhoto[index]),
                                              fit: BoxFit.cover,
                                            ),
                                            border: Border.all(
                                              color: Colors.white70, //
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                      )),
                                      Stack(
                                        children: <Widget>[
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 8, 0, 0),
                                              child: Image.asset(
                                                "assets/icons/flag.png",
                                                fit: BoxFit.fitWidth,
                                                width: 15,
                                              )),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 8, 0, 0),
                                              child: Text(
                                                "     ${widget.address[index]}",
                                                maxLines: 2,
                                                style: kNomalTextStyle.copyWith(
                                                    color: Colors.black,
                                                    fontFamily: "Roboto_Medium",
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                  Image.asset(
                                    "assets/icons/promo.png",
                                    fit: BoxFit.fitHeight,
                                    height: 20,
                                  )
                                ],
                              ))));
                }),
          )
        ],
      ),
    );
  }

  /// around me
  Widget _foodRecommendationNearMe(BuildContext context, int index) {
    return Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
        onTap: () {
      _displaySnackBar(context, widget.address[index]);
    },
    child: Container(
      padding: EdgeInsets.all(16),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 4.5,
                height: MediaQuery.of(context).size.width / 4.5,
                margin: EdgeInsets.fromLTRB(8, 8, 0, 0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.foodPhoto[index]),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.white70, //
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
              ),
              Visibility(
                visible: index % 2 == 0,
                child: Image.asset(
                  "assets/icons/promo.png",
                  fit: BoxFit.fitHeight,
                  height: 20,
                ),
              )
            ],
          ),
          SizedBox(
            width: 16,
            height: 1,
          ),
          Expanded(child:
          Container(
            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              height: MediaQuery.of(context).size.width / 4.5,
              color: Colors.transparent,
              child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    "assets/icons/flag.png",
                    fit: BoxFit.fitWidth,
                    width: 15,
                  ),
                  Expanded(child:Text(
                    " ${widget.address[index]}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kNomalTextStyle.copyWith(
                        color: Colors.black,
                        fontFamily: "Roboto_Medium",
                        fontWeight: FontWeight.w500),
                  ))
                ],
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text(
                    "Gà tắm nước mắm",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style:
                        kNomalTextStyle.copyWith(fontFamily: "Roboto_Regular"),
                  )),
              Expanded(child: Container(
                alignment: Alignment.bottomLeft,
                color: Colors.transparent,
                child: Text(
                  "${index}km",
                  overflow: TextOverflow.ellipsis,
                  style: kNomalTextStyle.copyWith(fontFamily: "Roboto_Regular"),
                ),
              ))
            ],
          )))
        ],
      ),
    )));
  }
}
