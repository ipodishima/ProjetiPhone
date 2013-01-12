//
//  DetailWineViewController.m
//  ProjetiPhone
//
//  Created by Johan Delouche on 03/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import "DetailWineViewController.h"

@interface DetailWineViewController ()

@end

@implementation DetailWineViewController

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
    _label = [[UILabel alloc] initWithFrame:CGRectMake(20,20, 280, 100)];
    [self.view addSubview:_label];
    _label.numberOfLines = 0;
    _label.text = _textToShow;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
