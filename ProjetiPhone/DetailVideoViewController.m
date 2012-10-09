//
//  DetailVideoViewController.m
//  ProjetiPhone
//
//  Created by Johan Delouche on 09/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import "DetailVideoViewController.h"

@interface DetailVideoViewController ()

@end

@implementation DetailVideoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(20,20, 200, 30)];
    [self.view addSubview:_label];
    _label.text = _textToShow;
    
    
    LBYouTubePlayerViewController* controller = [[LBYouTubePlayerViewController alloc] initWithYouTubeURL:[NSURL URLWithString:@"http://www.youtube.com/watch?v=1fTIhC1WSew&list=FLEYfH4kbq85W_CiOTuSjf8w&feature=mh_lolz"] quality:LBYouTubeVideoQualityLarge];
    controller.delegate = self;
    controller.view.frame = CGRectMake(0.0f, 0.0f, 200.0f, 200.0f);
    controller.view.center = self.view.center;
    self.controller = controller;
    
    [self.view addSubview:controller.view];
    

}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_controller.view.videoController stop];
    self.controller = nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)youTubePlayerViewController:(LBYouTubePlayerViewController *)controller didSuccessfullyExtractYouTubeURL:(NSURL *)videoURL
{
    
}

- (void)youTubePlayerViewController:(LBYouTubePlayerViewController *)controller failedExtractingYouTubeURLWithError:(NSError *)error
{
    
}

@end
