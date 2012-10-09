//
//  AppDelegate.m
//  ProjetiPhone
//
//  Created by Johan Delouche on 01/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import "AppDelegate.h"
#import "CoursListViewController.h"
#import "MyProfilViewController.h"
#import "WineListViewController.h"
#import "VideoListViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.tabBarController = [[UITabBarController alloc] init];

    
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    MyProfilViewController *myProfilVC = [[MyProfilViewController alloc] init];
    UITabBarItem *tabBarItem0 = [[UITabBarItem alloc] initWithTitle:@"Mon Profil" image:[UIImage imageNamed:@"111-user.png"] tag:0];
    myProfilVC.tabBarItem = tabBarItem0;
    
    WineListViewController *wineLVC = [[WineListViewController alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController *wineNC = [[UINavigationController alloc] initWithRootViewController:wineLVC];
    wineLVC.title = @"Vins";
    [wineNC setNavigationBarHidden:NO];
    
    UITabBarItem *tabBatItem1 = [[UITabBarItem alloc] initWithTitle:@"Vins" image:[UIImage imageNamed:@"142-wine-bottle.png"] tag:1];
    wineLVC.tabBarItem = tabBatItem1;
    
    
    CoursListViewController *coursLVC = [[CoursListViewController alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController *coursNC = [[UINavigationController alloc] initWithRootViewController:coursLVC];
    coursLVC.title = @"Cours";
    [coursNC setNavigationBarHidden:NO];
    
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc] initWithTitle:@"Cours" image:[UIImage imageNamed:@"140-gradhat.png"] tag:3];
    coursLVC.tabBarItem = tabBarItem3;
    
    VideoListViewController *videoLVC = [[VideoListViewController alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController *videoNC = [[UINavigationController alloc] initWithRootViewController:videoLVC];
    videoLVC.title = @"Videos";
    [videoNC setNavigationBarHidden:NO];
    
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc] initWithTitle:@"Videos" image:[UIImage imageNamed:@"70-tv.png"] tag:2];
    videoLVC.tabBarItem = tabBarItem2;
    
    
    [self.tabBarController setViewControllers:[NSArray arrayWithObjects:myProfilVC, wineNC, coursNC, videoNC, nil]];
    [self.window setRootViewController:self.tabBarController];
    
    [self.window makeKeyAndVisible];
    
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
