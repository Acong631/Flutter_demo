#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@interface AppDelegate()
@property (nonatomic, strong) UINavigationController *navigationController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    
    UIViewController *flutterViewController = self.window.rootViewController;

    self.navigationController = [[UINavigationController alloc] initWithRootViewController:flutterViewController];
    [self.navigationController setNavigationBarHidden:YES];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
