#import "AcmapPlugin.h"
#import "ACMapFactory.h"

#import <BaiduMapAPI_Base/BMKBaseComponent.h>

@implementation AcmapPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"acmap"
            binaryMessenger:[registrar messenger]];
  AcmapPlugin* instance = [[AcmapPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
 
    [registrar registerViewFactory:[[ACMapFactory alloc] initWithMessenger:   registrar.messenger] withId:@"ACMapView"];
    
    // 要使用百度地图，请先启动BaiduMapManager
    BMKMapManager *mapManager = [[BMKMapManager alloc] init];
    // 如果要关注网络及授权验证事件，请设定generalDelegate参数
    BOOL ret = [mapManager start:@"bXadoybATKmHqQv5RjWDkiG1w2EmPsKO"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"启动引擎失败");
        if ([BMKMapManager setCoordinateTypeUsedInBaiduMapSDK: BMK_COORDTYPE_COMMON]) {
            NSLog(@"经纬度类型设置成功");
        } else {
            NSLog(@"经纬度类型设置失败");
        }
    }
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
