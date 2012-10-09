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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
