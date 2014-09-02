//
//  DEMOAppDelegate.m
//  RESideMenuStoryboardsExample
//
//  Created by Roman Efimov on 10/12/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "MARAppDelegate.h"
#import <Parse/Parse.h>

@implementation MARAppDelegate

/* * * * * * * * * * * * * * * * *
 * Facebook
 * * * * * * * * * * * * * * * * */

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[PFFacebookUtils session] close];
}

/* * * * * * * * * * * * * * * * *
 * Default methods
 * * * * * * * * * * * * * * * * */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [Parse setApplicationId:@"alZRiWd2nZkGbC1Rc1rrOEUr9Aani4AmRJZtVdyF"
                  clientKey:@"n06hhmkG5JBOMSPiko9Tt7e4KRSMTwScB7VcQISK"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

@end
