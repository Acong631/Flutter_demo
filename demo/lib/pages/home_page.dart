import 'dart:ui';

import 'package:demo/utils.dart';
import 'package:demo/widgets/theam_dialog.dart';
import 'package:demo/widgets/theam_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imagePaths = [
    'assets/images/banner_1.png',
    'assets/images/banner_2.png',
    'assets/images/banner_3.png'
  ];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  _banner() {
    return Container(
      height: ScreenUtils.fix(175),
      child: Swiper(
        itemCount: imagePaths.length,
        autoplay: true,
        duration: 1000,
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.fromLTRB(
              0,
              0,
              ScreenUtils.fix(15),
              ScreenUtils.fix(15),
            ),
            builder: DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Colors.white,
                size: 8,
                activeSize: 10)),
        itemBuilder: (context, index) {
          return Image.asset(imagePaths[index]);
        },
      ),
    );
  }

  _menus({Function(String, int) tap}) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return GestureDetector(
          onTap: () {
            tap('111', index);
          },
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.home),
                Text(
                  'aaa',
                  style: TextStyle(color: ColorUtils.titleColor),
                )
              ],
            ),
          ),
        );
      }, childCount: 5),
    );
  }

  _items({Function(String, int) tap}) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 80 / 140.0,
          mainAxisSpacing: ScreenUtils.fix(10),
          crossAxisSpacing: ScreenUtils.fix(10)),
      delegate: SliverChildBuilderDelegate((context, index) {
        return GestureDetector(
          onTap: () {
            tap('111', index);
          },
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: ClipRRect(
                      child: Image.asset('assets/images/book_1.png'),
                      borderRadius: BorderRadius.circular(ScreenUtils.fix(5))),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(ScreenUtils.fix(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '在幸福的路上',
                          style: TextStyle(
                            fontSize: ScreenUtils.fix(14),
                            color: ColorUtils.textColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                  text: '200',
                                  style: TextStyle(
                                      fontSize: ScreenUtils.fix(12),
                                      color: ColorUtils.theamRed),
                                  children: [
                                    TextSpan(
                                      text: '起',
                                      style: TextStyle(
                                          fontSize: ScreenUtils.fix(12),
                                          color: ColorUtils.minorTextColor),
                                    )
                                  ]),
                            ),
                            Text(
                              '售票中',
                              style: TextStyle(
                                  fontSize: ScreenUtils.fix(12),
                                  color: ColorUtils.minorTextColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }, childCount: 6),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Row(
          children: <Widget>[
            Expanded(
                child: Container(
                  height: 30,
                  child: TheamSearch(
                    placeholder: '五月天',
                    onTap: (){
                      TheamDialog.showToast(context, msg: '暂无相关功能');
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),    
                )
              ),
            IconButton(icon: Icon(Icons.home), onPressed: null),
            IconButton(icon: Icon(Icons.home), onPressed: null),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      child: Container(
        color: Color.fromARGB(255, 240, 240, 240),
        child: Stack(
          children: <Widget>[
            SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              header: WaterDropHeader(),
              onRefresh: () async {
                await Future.delayed(Duration(milliseconds: 1000));
                _refreshController.refreshCompleted();
              },
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: _banner(),
                  ),
                  _menus(tap: (title, index) {
                    TheamDialog.showAlertDialog(context, msg: '无相关功能');
                  }),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          ScreenUtils.fix(10),
                          ScreenUtils.fix(0),
                          ScreenUtils.fix(8),
                          ScreenUtils.fix(10)),
                      child: Text(
                        '猜你喜欢',
                        style: TextStyle(
                            fontSize: ScreenUtils.fix(17),
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding:
                        EdgeInsets.symmetric(horizontal: ScreenUtils.fix(10)),
                    sliver: _items(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
