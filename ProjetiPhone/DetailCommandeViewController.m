//
//  DetailCommandeViewController.m
//  ProjetiPhone
//
//  Created by Johan Delouche on 09/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import "DetailCommandeViewController.h"

@interface DetailCommandeViewController ()

@end

@implementation DetailCommandeViewController

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
    
    _text = [[UITextView alloc] initWithFrame:CGRectMake(20,20, 250, 50)];
    [self.view addSubview:_text];
    self.title = _commande.name;
    _text.text = [NSString stringWithFormat: @"Vous avez commandez %@ %@" , _commande.number, _commande.name];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

@end
