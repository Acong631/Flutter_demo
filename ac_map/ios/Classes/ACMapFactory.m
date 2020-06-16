//
//  ACMapFactory.m
//  acmap
//
//  Created by cong on 2020/6/16.
//

#import "ACMapFactory.h"

#import "ACMapView.h"

@interface ACMapFactory ()

@property (strong, nonatomic) NSObject<FlutterBinaryMessenger> *messenger;

@end

@implementation ACMapFactory

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
{
    self = [super init];
    if (self) {
        self.messenger = messenger;
    }
    return self;
}

- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args {
    
    return [[ACMapView alloc] initWithviewIdentifier:viewId arguments:args binaryMessenger:self.messenger];
}


- (NSObject<FlutterMessageCodec>*)createArgsCodec
{
    return [FlutterStandardMessageCodec sharedInstance];
}

@end
