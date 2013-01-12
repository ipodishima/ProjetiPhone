//
//  AboutViewController.m
//  ProjetiPhone
//
//  Created by Johan Delouche on 09/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    
	_textView = [[UITextView alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 280.0)];
    _textView.textColor = [UIColor blackColor];
    _textView.font = [UIFont boldSystemFontOfSize:15.0];
    _textView.text = @"Appli créé par Johan Delouche pour le projet iOS de l'ISMIN M&S.\nÀ destination de Marian Paul.\n";
    [self.view addSubview:_textView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
