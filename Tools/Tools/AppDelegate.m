//
//  AppDelegate.m
//  Tools
//
//  Created by wangyan on 2021/4/27.
//

#import "AppDelegate.h"
#import "TableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    TableViewController *tableVC = [[TableViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tableVC];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController:navController];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
