//
//  AppDelegate.m
//  ASLayoutSpecPlayground
//
//  Created by Hannah Troisi on 3/11/16.
//  Copyright © 2016 Hannah Troisi. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ASLayoutableInspectorNode.h"
#import "Utilities.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  UIViewController *rootVC = nil;
  
  UIDevice *device = [UIDevice currentDevice];
  if (device.userInterfaceIdiom == UIUserInterfaceIdiomPad) {

    ASViewController *masterVC        = [[ASViewController alloc] initWithNode:[ASLayoutableInspectorNode sharedInstance]];
    masterVC.view.backgroundColor     = [UIColor customOrangeColor];
    UINavigationController *masterNav = [[UINavigationController alloc] initWithRootViewController:masterVC];

    ViewController *detailVC          = [[ViewController alloc] init];
    UINavigationController *detailNav = [[UINavigationController alloc] initWithRootViewController:detailVC];
    
    UISplitViewController *splitVC    = [[UISplitViewController alloc] init];
    splitVC.viewControllers           = @[masterNav, detailNav];
    splitVC.preferredDisplayMode      = UISplitViewControllerDisplayModeAllVisible;
    splitVC.maximumPrimaryColumnWidth = 250;
    
    rootVC = splitVC;
    
  } else {
    
    // FIXME: make this work for iPhones
    NSAssert(YES, @"App optimized for iPad only.");
  }
  
  [self.window setRootViewController:rootVC];
  [self.window makeKeyAndVisible];
  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
