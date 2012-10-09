//
//  DetailVideoViewController.h
//  ProjetiPhone
//
//  Created by Johan Delouche on 09/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBYouTubePlayerViewController.h"

@interface DetailVideoViewController : UIViewController <LBYouTubePlayerControllerDelegate> {
    UILabel *_label;
}

@property (nonatomic, strong) LBYouTubePlayerViewController *controller;
@property NSString *textToShow;

@end
