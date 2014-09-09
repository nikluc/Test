//
//  AppDelegate.m
//  TaxiLogging
//
//  Created by PPTS on 06/06/14.
//  Copyright (c) 2014 ppts. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
     //ASSIGNING TAB BAR ITEM WITH TITLES
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    
    tabBarItem1.title =@"Pre Shift";
    tabBarItem2.title=@"Post Shift";
    tabBarItem3.title=@"Expected";
    tabBarItem4.title=@"View";
        [tabBarItem1 setImage:[[UIImage imageNamed:@"preshift.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
        [tabBarItem2 setImage:[[UIImage imageNamed:@"postshift.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
        [tabBarItem3 setImage:[[UIImage imageNamed:@"expense.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
        [tabBarItem4 setImage:[[UIImage imageNamed:@"view.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //depreciated in ios 7
    //[tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@""] withFinishedUnselectedImage:[UIImage imageNamed:@""]];
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

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
