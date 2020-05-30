import 'package:demo/utils.dart';
import 'package:demo/widgets/theam_tab_controll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SalePage extends StatefulWidget {
  SalePage({Key key}) : super(key: key);

  @override
  _SalePageState createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> with TickerProviderStateMixin {
  TabController tabCtr;

  @override
  void initState() {
    super.initState();
    tabCtr = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('买卖'),
        trailing: IconButton(icon: Icon(Icons.add), onPressed: null),
        backgroundColor: Colors.white,
        border: null,
      ),
      child: TheamTabView(tabCtr: tabCtr, titles: ['卖票', '买票'], pages: [SaleView(isBuy: false,),SaleView(isBuy: true,)]),
    );
  }
}

class SaleView extends StatefulWidget {
  final bool isBuy;
  SaleView({Key key, this.isBuy = false}) : super(key: key);

  @override
  _SaleViewState createState() => _SaleViewState();
}

class _SaleViewState extends State<SaleView> with AutomaticKeepAliveClientMixin{
  RefreshController _controller = RefreshController(initialRefresh: false);
  int count = 10;

  _item(){
    return Container(
      padding: EdgeInsets.all(ScreenUtils.fix(8)),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/book_1.png',width: ScreenUtils.fix(140),height: ScreenUtils.fix(180),),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: ScreenUtils.fix(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '日本独家授权音乐剧《深夜食堂》-上海站',
                    style: TextStyle(
                      fontSize: ScreenUtils.fix(18),
                      color: ColorUtils.titleColor,
                      
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: ScreenUtils.fix(10),),
                  Text(
                    '伤害卢湾区兰心大剧院',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenUtils.fix(14),
                      color: ColorUtils.minorTextColor,
                    ),
                  ),
                  Text(
                    '2018年10月10日 19:30',
                    style: TextStyle(
                      fontSize: ScreenUtils.fix(14),
                      color: ColorUtils.textColor,
                    ),
                  ),
                  SizedBox(height: ScreenUtils.fix(15),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '票档：看台',
                            style: TextStyle(
                              fontSize: ScreenUtils.fix(16),
                              color: ColorUtils.textColor,  
                            ),
                          ),
                          Text(
                            '888',
                            style: TextStyle(
                              fontSize: ScreenUtils.fix(17),
                              color: ColorUtils.theamRed,  
                            ),
                          ),
                        ],
                      ),
                      CupertinoButton(
                        child: Text(widget.isBuy?'我买':'我卖',),
                        onPressed: (){},
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: SmartRefresher(
        controller: _controller,
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 1000));
          _controller.refreshCompleted();
          setState(() {
            count = 10;
          });
        },
        onLoading: () async {
          await Future.delayed(Duration(milliseconds: 1000));
          _controller.loadComplete();
          setState(() {
            count += 10;
          });
        },
        enablePullDown: true,
        enablePullUp: true,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return _item();
            }, 
            childCount: count))
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
