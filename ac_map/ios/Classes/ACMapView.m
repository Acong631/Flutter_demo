//
//  ACMapView.m
//  acmap
//
//  Created by cong on 2020/6/16.
//

#import "ACMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map_For_WalkNavi/BMKMapComponent.h>//引入步骑行地图功能所有的头文件
#import <BaiduMapAPI_WalkNavi/BMKWalkNaviComponent.h>//引入步骑行导航功能所有的头文件
#import "BMKWalkNaviViewController.h"

@interface ACMapView() <BMKWalkCycleRoutePlanDelegate, BMKWalkCycleRouteGuidanceDelegate,BMKWalkCycleTTSPlayerDelegate,BMKWalkCycleLocationServiceDelegate>

@property (strong, nonatomic) NSObject<FlutterBinaryMessenger> *messenger;

@property (nonatomic, strong) BMKMapView *mapView;
@property (nonatomic, strong) FlutterMethodChannel *channel;

@property (nonatomic, strong) BMKWalkNaviViewController *controller;   ///导航页面
@property (nonatomic, assign) NSInteger navigationType;     ///默认0：步行导航, 1：普通骑行导航, 2：电动车骑行导航

@end


@implementation ACMapView

-(instancetype)initWithviewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger
{
    self = [super init];
    if (self) {
        self.messenger = messenger;
        _mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
        //_mapView.delegate = self;
        
        if (args) {
            if(args[@"ShowMapScaleBar"]){
                _mapView.showMapScaleBar = [args[@"ShowMapScaleBar"] boolValue];
            }
            if(args[@"ZoomLevel"]){
                NSNumber *level = args[@"ZoomLevel"];
                [_mapView setZoomLevel:level.floatValue];
            }
        }
        
       // 注册flutter 与 ios 通信通道
        NSString* channelName = [NSString stringWithFormat:@"ACMapView_%lld", viewId];
        _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        __weak __typeof__(self) weakSelf = self;
        [_channel setMethodCallHandler:^(FlutterMethodCall *  call, FlutterResult  result) {
            [weakSelf onMethodCall:call result:result];
        }];

        
        
    }
    return self;
}


-(void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result{
    if ([[call method] isEqualToString:@"startWalkNavigation"]) {

        [self startWalkNavigation];
    }else{
        
    }
    
}

- (void)startWalkNavigation{
    BMKWalkNavigationManager *manager = [BMKWalkNavigationManager sharedManager];
    manager.routePlanDelegate = self;
    manager.routeGuidanceDelegate = self;
    manager.ttsPlayerDelegate = self;
    manager.locationAuthorizationDelegate = self;
    _navigationType = 0;
    _controller = [[BMKWalkNaviViewController alloc] init];
    BOOL inited = [[BMKWalkNavigationManager sharedManager] initNaviEngine:_controller];
    if (inited) {
        NSLog(@"SDK-初始化引擎成功");
        BMKWalkNaviLaunchParam *param = [[BMKWalkNaviLaunchParam alloc] init];
        param.startPoint = CLLocationCoordinate2DMake(40.033593,116.224751);
        param.endPoint = CLLocationCoordinate2DMake(39.991152,116.367905);
        [[BMKWalkNavigationManager sharedManager] routePlanWithParams:param];
    }
}


#pragma mark - **后面的是有关于步行导航的相关回调，前面是demo辅助代码**

#pragma mark - BMKWalkCycleRoutePlanDelegate
/**
 开始算路
 */
- (void)onRoutePlanStart:(BMKWalkCycleNavigationType)naviType {
    NSLog(@"SDK-开始算路");
    
}

- (void)onRoutePlanResult:(BMKWalkCycleRoutePlanErrorCode)errorCode naviType:(BMKWalkCycleNavigationType)naviType{
    if (errorCode == BMK_WALK_CYCLE_ROUTEPLAN_RESULT_SUCCESS) {
        NSLog(@"SDK-算路成功");
        _controller.navigationType = _navigationType;
//        FlutterViewController* controller = (FlutterViewController*) [UIApplication sharedApplication].keyWindow.rootViewController;
//
//        UINavigationController *chatNav = [[UINavigationController alloc] init];
//        controller.view.window.rootViewController = chatNav;
//
////        [chatNav pushViewController:vc animated:YES];
//        NSLog(@"----- %@----%@",controller, chatNav);
        _controller.navigationType = _navigationType;
        UINavigationController *chatNav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        [chatNav pushViewController:_controller animated:YES];
    } else {
        NSLog(@"SDK-算路失败 %lu", (unsigned long)errorCode);
    
        FlutterViewController* controller = (FlutterViewController*) [UIApplication sharedApplication].keyWindow.rootViewController;

        UINavigationController *chatNav = [[UINavigationController alloc] init];
        controller.view.window.rootViewController = chatNav;

//        [chatNav pushViewController:vc animated:YES];
        NSLog(@"----- %@----%@",controller, chatNav);
        _controller.navigationType = _navigationType;
        [chatNav pushViewController:_controller animated:YES];
    }
}

#pragma mark - BMKWalkCycleRouteGuidanceDelegate
/**
 诱导图标更新
 
 @param icon 诱导图标
 */
- (void)onRouteGuideIconUpdate:(UIImage *)icon naviType:(BMKWalkCycleNavigationType)naviType{
    NSLog(@"SDK-诱导图标%@",icon);
}

/**
 诱导枚举信息
 
 @param guideKind 诱导信息
 */
- (void)onRouteGuideKind:(BMKWalkCycleGuideKind)guideKind naviType:(BMKWalkCycleNavigationType)naviType{
    NSLog(@"SDK-诱导kind%lu",(unsigned long)guideKind);
    
}

/**
 诱导信息
 
 @param firstSequence 第一行显示的信息，比如“沿当前道路”
 @param secondSequence 第二行显示的信息，比如“向东出发”，第二行信息也可能为空
 */
- (void)onRoadGuideTextUpdateFirst:(NSString *)firstSequence second:(NSString *)secondSequence naviType:(BMKWalkCycleNavigationType)naviType{
    NSLog(@"SDK-诱导信息%@, %@",firstSequence, secondSequence);
}

/**
 总的剩余时间
 
 @param remainTime 剩余时间，已经带有单位:（秒）
 */
- (void)onRemainTimeUpdate:(NSString *)remainTime naviType:(BMKWalkCycleNavigationType)naviType{
    NSLog(@"SDK-剩余时间%@",remainTime);
}

/**
 总的剩余距离
 
 @param remainDistance 剩余距离，已经带有单位:（米）
 */
- (void)onRemainDistanceUpdate:(NSString *)remainDistance naviType:(BMKWalkCycleNavigationType)naviType{
    NSLog(@"SDK-剩余距离%@",remainDistance);
}

/**
 GPS状态发生变化，来自诱导引擎的消息
 
 @param gspInfo GPS信息
 @param guideIcon GPS诱导图标
 */
- (void)onGpsStatusChange:(NSString *)gspInfo guideIcon:(UIImage *)guideIcon naviType:(BMKWalkCycleNavigationType)naviType{
    NSLog(@"SDK-gps发生变化%@%@",gspInfo, guideIcon);
}

/**
 已经开始偏航
 
 @param rarAwayInfo 偏航信息
 @param guideIcon 偏航诱导图标
 */
- (void)onRouteFarAway:(NSString *)rarAwayInfo guideIcon:(UIImage *)guideIcon naviType:(BMKWalkCycleNavigationType)naviType{
    NSLog(@"SDK-已经开始偏航%@%@",rarAwayInfo, guideIcon);
}

/**
 偏航规划中
 
 @param yawingInfo 偏航规划中的信息
 @param guideIcon 偏航诱导图标
 */
- (void)onRoutePlanYawing:(NSString *)yawingInfo guideIcon:(UIImage *)guideIcon naviType:(BMKWalkCycleNavigationType)naviType{
    NSLog(@"SDK-偏航规划中%@%@",yawingInfo, guideIcon);
}

/**
 重新算路成功
 */
- (void)onReRouteComplete:(BMKWalkCycleNavigationType)naviType{
    NSLog(@"SDK-重新算路成功");
}


/**
 重新算路失败
 */
- (void)onReRouteFail:(BMKWalkCycleNavigationType)naviType {
    NSLog(@"SDK-重新算路失败");
}
/**
 到达目的地
 */
- (void)onArriveDest:(BMKWalkCycleNavigationType)naviType {
    NSLog(@"SDK到达目的地");
}

/**
 震动
 */
- (void)onVibrate:(BMKWalkCycleNavigationType)naviType {
    NSLog(@"SDK-震动");
}

#pragma mark - BMKWalkCycleTTSPlayerDelegate
- (void)onPlayTTSText:(NSString *)text prior:(BOOL)prior naviType:(BMKWalkCycleNavigationType)naviType{
    NSLog(@"SDK-tts播放：%@",text);
}

#pragma mark - BMKWalkCycleLocationServiceDelegate
/**
*  @brief 为了适配app store关于新的后台定位的审核机制（app store要求如果开发者只配置了使用期间定位，则代码中不能出现申请后台定位的逻辑），当开发者在plist配置NSLocationAlwaysUsageDescription或者NSLocationAlwaysAndWhenInUseUsageDescription时，需要在该delegate中调用后台定位api：[locationManager requestAlwaysAuthorization]。开发者如果只配置了NSLocationWhenInUseUsageDescription，且只有使用期间的定位需求，则无需在delegate中实现逻辑。
*  @param locationManager 系统 CLLocationManager 类 。
*  @since 5.0.0
*/
- (void)doRequestAlwaysAuthorization:(CLLocationManager * _Nonnull)locationManager {
    if (@available(iOS 8.0, *)) {
        [locationManager requestAlwaysAuthorization];
    } else {
        // Fallback on earlier versions
    }
}


- (UIView*)view
{
    return _mapView;
}

@end
