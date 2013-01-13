//
//  AppDelegate.h
//  ProjetiPhone
//
//  Created by Johan Delouche on 01/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>


@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) FBSession *session;


@end
