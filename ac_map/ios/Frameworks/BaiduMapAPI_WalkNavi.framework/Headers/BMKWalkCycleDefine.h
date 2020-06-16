//
//  BMKWalkCycleDefine.h
//  WalkCycleComponent
//
//  Created by Xin,Qi on 24/01/2018.
//  Copyright © 2018 Baidu. All rights reserved.
//

#ifndef BMK_WalkCycle_Define_h
#define BMK_WalkCycle_Define_h

/**
 步骑行导航算路返回码

 - BMK_WALK_CYCLE_ROUTEPLAN_RESULT_SUCCESS: 成功
 - BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_WRONGCOORD: 坐标格式错误
 - BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_CALCFAIL: 计算失败
 - BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_NOOUTDATA: 无室外路线
 - BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_NETERROR: 网络错误
 - BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_INVALIDSTART: 起点无效
 - BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_INVALIDEND: 终点无效
 - BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_TOOFAR_STARTTOROAD: 起始地离路太远
 - BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_TOOFAR_DESTTOROAD: 目的地离路太远
 - BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_TOONEAR_STARTTODEST: 起始地离目的地太近
 - BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_TOOFAR_STARTTODEST: 起始地离目的地太远
 - BMK_WALK_CYCLE_ROUTEPLAN_RESULT_INVALID: 无效值
 */
typedef NS_ENUM(NSUInteger, BMKWalkCycleRoutePlanErrorCode) {
    BMK_WALK_CYCLE_ROUTEPLAN_RESULT_SUCCESS,
    BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_WRONGCOORD,
    BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_CALCFAIL,
    BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_NOOUTDATA,
    BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_NETERROR,
    BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_INVALIDSTART,
    BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_INVALIDEND,
    BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_TOOFAR_STARTTOROAD,
    BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_TOOFAR_DESTTOROAD,
    BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_TOONEAR_STARTTODEST,
    BMK_WALK_CYCLE_ROUTEPLAN_RESULT_FAIL_TOOFAR_STARTTODEST,
    BMK_WALK_CYCLE_ROUTEPLAN_RESULT_INVALID
};

/**
 步骑行诱导类型枚举

 - BMK_WALK_CYCLE_MANEUVER_KIND_INVALID: 无效
 - BMK_WALK_CYCLE_MANEUVER_KIND_START: 起点
 - BMK_WALK_CYCLE_MANEUVER_KIND_FRONT: 直行
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_FRONT:  右前方转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT: 右转
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_BACK: 右后方转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_BACK: 左后方转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFT: 左转
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_FRONT: 左前方转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_FRONT_STRAIGHT: 右前方直行
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_FRONT_STRAIGHT: 左前方直行 =10
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_PASSROAD_FRONT: 左转穿过马路(步行设施名称)继续向前
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_PASSROAD_FRONT: 右转穿过马路(步行设施名称)继续向前
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_PASSROAD_UTURN: 左转穿过马路(步行设施名称)往回走
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_PASSROAD_UTURN: 右转穿过马路(步行设施名称)往回走
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFTDIAGONAL_PASSROAD_RIGHT: 向左到路口斜对面，向右转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFTDIAGONAL_PASSROAD_RIGHT_FRONT: 向左到路口斜对面，向右前方转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFTDIAGONAL_PASSROAD_FRONT: 向左到路口斜对面，继续向前
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFTDIAGONAL_PASSROAD_LEFT_FRONT: 向左到路口斜对面，向左前方转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFTDIAGONAL_PASSROAD_LEFT: 向左到路口斜对面，向左转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFTDIAGONAL_PASSROAD_LEFT_BACK: 向左到路口斜对面，向左后方转弯 =20
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHTDIAGONAL_PASSROAD_LEFT: 向右到路口斜对面，向左转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHTDIAGONAL_PASSROAD_LEFT_FRONT: 向右到路口斜对面，向左前方转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHTDIAGONAL_PASSROAD_FRONT: 向右到路口斜对面，继续向前
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHTDIAGONAL_PASSROAD_RIGHT_FRONT: 向右到路口斜对面，向右前方转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHTDIAGONAL_PASSROAD_RIGHT: 向右到路口斜对面，向右转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHTDIAGONAL_PASSROAD_RIGHT_BACK: 向右到路口斜对面，向右后方转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_PASSROAD_LEFT: 过马路左转
 - BMK_WALK_CYCLE_MANEUVER_KIND_PASSROAD_RIGHT: 过马路右转
 - BMK_WALK_CYCLE_MANEUVER_KIND_GOTO_LEFT_ROAD: 进入左侧道路
 - BMK_WALK_CYCLE_MANEUVER_KIND_GOTO_RIGHT_ROAD: 进入右侧道路 =30
 - BMK_WALK_CYCLE_MANEUVER_KIND_GOTO_LEFT_ROAD_UTURN: 进入左侧道路往回走
 - BMK_WALK_CYCLE_MANEUVER_KIND_GOTO_RIGHT_ROAD_UTURN: 进入右侧道路往回走
 - BMK_WALK_CYCLE_MANEUVER_KIND_DEST: 目的地
 - BMK_WALK_CYCLE_MANEUVER_KIND_OVERLINEBRIDGE: 天桥
 - BMK_WALK_CYCLE_MANEUVER_KIND_UNDERGROUNDPASSAGE: 地下通道
 - BMK_WALK_CYCLE_MANEUVER_KIND_RING: 环岛
 - BMK_WALK_CYCLE_MANEUVER_KIND_PARK: 公园
 - BMK_WALK_CYCLE_MANEUVER_KIND_SQUARE: 广场
 - BMK_WALK_CYCLE_MANEUVER_KIND_LADDER:  阶梯
 - BMK_WALK_CYCLE_MANEUVER_KIND_WAYPOINT: 途径点 =40
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_THREE_LEFTSIDE: 左转 并靠最左侧路口转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_THREE_MIDDLE: 左转 并沿中间路口转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_THREE_RIGHTSIDE: 左转 并靠最右侧路口转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_TWO_LEFTSIDE: 左转 并靠最左侧路口转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_TWO_RIGHTSIDE: 左转 并靠最右侧路口转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_THREE_LEFTSIDE: 右转 并靠最左侧路口转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_THREE_MIDDLE: 右转 并沿中间路口转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_THREE_RIGHTSIDE: 右转 并靠最右侧路口转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_TWO_LEFTSIDE: 右转 并靠最左侧路口转弯
 - BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_TWO_RIGHTSIDE: 右转 并靠最右侧路口转弯 =50
 - BMK_WALK_CYCLE_MANEUVER_KIND_FRONT_THREE_LEFTSIDE: 直行 靠左侧道路直行
 - BMK_WALK_CYCLE_MANEUVER_KIND_FRONT_THREE_MIDDLE: 直行 沿中间道路直行
 - BMK_WALK_CYCLE_MANEUVER_KIND_FRONT_THREE_RIGHTSIDE: 直行 靠右侧道路直行
 - BMK_WALK_CYCLE_MANEUVER_KIND_FRONT_TWO_LEFTSIDE: 直行 靠左侧道路直行
 - BMK_WALK_CYCLE_MANEUVER_KIND_FRONT_TWO_RIGHTSIDE: 直行 靠右侧道路直行
 - BMK_WALK_CYCLE_MANEUVER_KIND_FERRY: 渡口
 - BMK_WALK_CYCLE_MANEUVER_KIND_START_ISINDOOR_DOOR: Start is indoor
 - BMK_WALK_CYCLE_MANEUVER_KIND_DEST_ISINDOOR_DOOR: Dest is indoor
 - BMK_WALK_CYCLE_MANEUVER_KIND_ELEVATOR: 直梯
 - BMK_WALK_CYCLE_MANEUVER_KIND_STAIR: 楼梯 = 60
 - BMK_WALK_CYCLE_MANEUVER_KIND_ESCALATOR: 扶梯
 - BMK_WALK_CYCLE_MANEUVER_KIND_SECURITY_CHECK: 安检
 - BMK_WALK_CYCLE_MANEUVER_KIND_INDOORSTART: indoor start
 - BMK_WALK_CYCLE_MANEUVER_KIND_INDOORDEST: indoor dest
 */
typedef NS_ENUM(NSUInteger, BMKWalkCycleGuideKind) {
    BMK_WALK_CYCLE_MANEUVER_KIND_INVALID ,
    BMK_WALK_CYCLE_MANEUVER_KIND_START ,
    BMK_WALK_CYCLE_MANEUVER_KIND_FRONT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_FRONT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_BACK ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_BACK ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_FRONT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_FRONT_STRAIGHT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_FRONT_STRAIGHT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_PASSROAD_FRONT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_PASSROAD_FRONT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_PASSROAD_UTURN ,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_PASSROAD_UTURN ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFTDIAGONAL_PASSROAD_RIGHT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFTDIAGONAL_PASSROAD_RIGHT_FRONT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFTDIAGONAL_PASSROAD_FRONT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFTDIAGONAL_PASSROAD_LEFT_FRONT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFTDIAGONAL_PASSROAD_LEFT    ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFTDIAGONAL_PASSROAD_LEFT_BACK ,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHTDIAGONAL_PASSROAD_LEFT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHTDIAGONAL_PASSROAD_LEFT_FRONT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHTDIAGONAL_PASSROAD_FRONT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHTDIAGONAL_PASSROAD_RIGHT_FRONT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHTDIAGONAL_PASSROAD_RIGHT    ,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHTDIAGONAL_PASSROAD_RIGHT_BACK ,
    BMK_WALK_CYCLE_MANEUVER_KIND_PASSROAD_LEFT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_PASSROAD_RIGHT ,
    BMK_WALK_CYCLE_MANEUVER_KIND_GOTO_LEFT_ROAD ,
    BMK_WALK_CYCLE_MANEUVER_KIND_GOTO_RIGHT_ROAD ,
    BMK_WALK_CYCLE_MANEUVER_KIND_GOTO_LEFT_ROAD_UTURN ,
    BMK_WALK_CYCLE_MANEUVER_KIND_GOTO_RIGHT_ROAD_UTURN ,
    BMK_WALK_CYCLE_MANEUVER_KIND_DEST ,
    BMK_WALK_CYCLE_MANEUVER_KIND_OVERLINEBRIDGE ,
    BMK_WALK_CYCLE_MANEUVER_KIND_UNDERGROUNDPASSAGE ,
    BMK_WALK_CYCLE_MANEUVER_KIND_RING ,
    BMK_WALK_CYCLE_MANEUVER_KIND_PARK ,
    BMK_WALK_CYCLE_MANEUVER_KIND_SQUARE ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LADDER ,
    BMK_WALK_CYCLE_MANEUVER_KIND_WAYPOINT ,
    
    //复杂八方向
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_THREE_LEFTSIDE ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_THREE_MIDDLE ,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_THREE_RIGHTSIDE,
    
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_TWO_LEFTSIDE,
    BMK_WALK_CYCLE_MANEUVER_KIND_LEFT_TWO_RIGHTSIDE,
    
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_THREE_LEFTSIDE,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_THREE_MIDDLE,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_THREE_RIGHTSIDE,
    
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_TWO_LEFTSIDE,
    BMK_WALK_CYCLE_MANEUVER_KIND_RIGHT_TWO_RIGHTSIDE,
    
    BMK_WALK_CYCLE_MANEUVER_KIND_FRONT_THREE_LEFTSIDE,
    BMK_WALK_CYCLE_MANEUVER_KIND_FRONT_THREE_MIDDLE,
    BMK_WALK_CYCLE_MANEUVER_KIND_FRONT_THREE_RIGHTSIDE,
    
    BMK_WALK_CYCLE_MANEUVER_KIND_FRONT_TWO_LEFTSIDE,
    BMK_WALK_CYCLE_MANEUVER_KIND_FRONT_TWO_RIGHTSIDE,
    
    BMK_WALK_CYCLE_MANEUVER_KIND_FERRY,
    
    BMK_WALK_CYCLE_MANEUVER_KIND_START_ISINDOOR_DOOR,
    BMK_WALK_CYCLE_MANEUVER_KIND_DEST_ISINDOOR_DOOR,
    
    BMK_WALK_CYCLE_MANEUVER_KIND_ELEVATOR,
    BMK_WALK_CYCLE_MANEUVER_KIND_STAIR,
    BMK_WALK_CYCLE_MANEUVER_KIND_ESCALATOR,
    BMK_WALK_CYCLE_MANEUVER_KIND_SECURITY_CHECK,
    BMK_WALK_CYCLE_MANEUVER_KIND_INDOORSTART,
    BMK_WALK_CYCLE_MANEUVER_KIND_INDOORDEST,
};

/**
 步骑行导航类型。
 本枚举值用于SDK向开发者的回调中，标识当前的导航类型。
 
 - BMK_WALK_CYCLE_NAVIGATION_TYPE_WALK: 步行
 - BMK_WALK_CYCLE_NAVIGATION_TYPE_NORMAL_CYCLE: 普通骑行
 - BMK_WALK_CYCLE_NAVIGATION_TYPE_ELECTRIC_CYCLE: 电动车骑行
 */
typedef NS_ENUM(NSUInteger, BMKWalkCycleNavigationType) {
    BMK_WALK_CYCLE_NAVIGATION_TYPE_WALK,
    BMK_WALK_CYCLE_NAVIGATION_TYPE_NORMAL_CYCLE,
    BMK_WALK_CYCLE_NAVIGATION_TYPE_ELECTRIC_CYCLE,
};

/**
 步行导航模式，普通导航、AR导航。
 本枚举值用于开发者指定步行导航的模式。
 
 - BMK_WALK_NAVIGATION_MODE_WALK_NORMAL: 普通步行导航
 - BMK_WALK_NAVIGATION_MODE_WALK_AR: AR步行导航
 */
typedef NS_ENUM(NSUInteger, BMKWalkNavigationMode) {
    BMK_WALK_NAVIGATION_MODE_WALK_NORMAL,
    BMK_WALK_NAVIGATION_MODE_WALK_AR,
};

/**
 步行AR导航，'3D'引导员资源类型

 - BMK_WALK_AR_GUIDER_RESOURCE_TYPE_DOWNLOAD_KEY: 下载秘钥类型
 - BMK_WALK_AR_GUIDER_RESOURCE_TYPE_PATH: 资源磁盘路径
 */
typedef NS_ENUM(NSUInteger, BMKWalkARGuiderResourceType) {
    BMK_WALK_AR_GUIDER_RESOURCE_TYPE_DOWNLOAD_KEY,
    BMK_WALK_AR_GUIDER_RESOURCE_TYPE_PATH,
};
#endif /* BMK_WalkCycle_Define_h */