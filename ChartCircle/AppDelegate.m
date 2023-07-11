//
//  AppDelegate.m
//  ChartCircle
//
//  Created by clt on 2023/7/11.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    _window.rootViewController = [[ViewController alloc] init];

    
    [_window makeKeyAndVisible];
    
    
    return YES;
}



@end
