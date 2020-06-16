//
//  ACMapView.h
//  acmap
//
//  Created by cong on 2020/6/16.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACMapView : NSObject <FlutterPlatformView>

- (instancetype)initWithviewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger;

@end

NS_ASSUME_NONNULL_END
