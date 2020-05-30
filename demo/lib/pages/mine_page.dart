import 'package:demo/utils.dart';
import 'package:demo/widgets/theam_right_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {


  _headerView(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.network('https://profile.csdnimg.cn/8/F/0/3_iamonmyownway',width: 70,height: 70,fit: BoxFit.fill,),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('路飞',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 10,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.palette,size: 20,color: ColorUtils.theamRed,),
                        SizedBox(width: 5,),
                        Icon(Icons.palette,size: 20,color: ColorUtils.theamRed,),
                        Text('88888',style: TextStyle(fontSize: 13),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          TheamRightIcon()
        ],
      ),
    );
  }

  
  _myTickets(){

    _item(String title){
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: <Widget>[
            Icon(Icons.pan_tool,color: ColorUtils.theamRed,),
            SizedBox(height: 5,),
            Text(title,style: TextStyle(color: ColorUtils.minorTextColor,fontSize: 12),),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color:ColorUtils.lineColor)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('我的票',style:TextStyle(color: ColorUtils.titleColor,fontSize: 16),),
                GestureDetector(
                  onTap: (){

                  },
                  child: Row(
                    children: <Widget>[
                      Text('查看更多的服务',style:TextStyle(color: ColorUtils.minorTextColor,fontSize: 11),),
                      SizedBox(width: 2,),
                      TheamRightIcon()
                    ],
                  ),
                )
              ],
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _item('待付款'),
              _item('待取票'),
              _item('待观看'),
              _item('退票'),
            ],
          )
        ],
      ),
    );
  }

  _cellItem(String title,bool showBorder,Function onTap){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              border: showBorder?Border(
                bottom: BorderSide(color:ColorUtils.lineColor)
              ):null
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title,style:TextStyle(color: ColorUtils.textColor,fontSize: 14),),
                TheamRightIcon()
              ],
            )
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        middle:  Text('个人中心'),
        border: null,
      ),
      child: Container(
        color: ColorUtils.pageColor,
        child: Column(
          children: <Widget>[
            _headerView(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    _myTickets(),
                    SizedBox(height: 20),

                    _cellItem('关注演出', true, (){}),
                    _cellItem('我的买卖', true, (){}),
                    _cellItem('收获地址', false, (){}),

                    SizedBox(height: 20),
                    _cellItem('常用购票人', true, (){}),
                    _cellItem('在线客服', true, (){}),
                    _cellItem('意见反馈', false, (){}),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}