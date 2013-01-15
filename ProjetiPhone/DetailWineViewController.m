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
    
    _pref = [NSUserDefaults standardUserDefaults];
	// Do any additional setup after loading the view.
    _label = [[UILabel alloc] initWithFrame:CGRectMake(20,20, 280, 100)];
    _commander = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _commander.frame = CGRectMake(20,140, 100, 30);
    [_commander setTitle:@"Commander" forState:UIControlStateNormal];
    [_commander addTarget:self action:@selector(commander:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_commander];
    [self.view addSubview:_label];
    _label.numberOfLines = 0;
    _label.text = _textToShow;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)commander:(UIButton *)sender {
    NSLog(@"commande");
    
    NSString *s = [_pref objectForKey:self.title];
    if (s == nil) {
        NSLog(@"s == nil");
        s = [[NSString alloc] init];
        s = @"0";
    }
    s = [NSString stringWithFormat:@"%d", [s intValue]+1];
    
    [_pref  setObject:s forKey:self.title];
    [_pref synchronize];
}

@end
