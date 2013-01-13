//
//  MyProfilViewController.m
//  ProjetiPhone
//
//  Created by Johan Delouche on 03/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import "MyProfilViewController.h"

@interface MyProfilViewController ()

@end

@implementation MyProfilViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Mon Profil";
    
    
    _labelText = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 80)];
    _address = [[UITextView alloc] initWithFrame:CGRectMake(20, 110, 200, 80)];
    _number = [[UITextView alloc] initWithFrame:CGRectMake(20, 200, 200, 30)];
    
    _labelText.numberOfLines = 2;
    
    _address.editable = NO;
    _number.editable = NO;
    _address.dataDetectorTypes = UIDataDetectorTypeAddress;
    _number.dataDetectorTypes = UIDataDetectorTypePhoneNumber;

    
    _labelText.text = @"Johan Delouche\nMembre";
    _address.text = @"880 route de mimet\n13120 Gardanne";
    _number.text = @"0698920135";
    
    [self.view addSubview:_labelText];
    [self.view addSubview:_address];
    [self.view addSubview:_number];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
}

@end
