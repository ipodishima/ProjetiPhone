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
    
    
    _text = [[UITextView alloc] initWithFrame:CGRectMake(20, 20, 200, 50)];
    _address = [[UITextView alloc] initWithFrame:CGRectMake(20, 110, 200, 50)];
    _number = [[UITextView alloc] initWithFrame:CGRectMake(20, 200, 200, 50)];
    
    _text.editable = NO;
    _address.editable = NO;
    _number.editable = NO;
    _address.dataDetectorTypes = UIDataDetectorTypeAddress;
    _number.dataDetectorTypes = UIDataDetectorTypePhoneNumber;

    
    _text.text = @"Johan Delouche\nStatus :\nMembre";
    _address.text = @"Adresse :\n880 route de mimet\n13120 Gardanne";
    _number.text = @"Numéro :\n0698920135";
    
    [self.view addSubview:_text];
    [self.view addSubview:_address];
    [self.view addSubview:_number];
    
    _timerForColorAnimation = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self
                                                             selector:@selector(changeColor:) userInfo:nil repeats:YES];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



- (void)changeColor:(NSTimer*)theTimer {
    [UIView animateWithDuration:3.5  animations:^{
        
        CGFloat redLevel = rand() / (float) RAND_MAX;
        CGFloat greenLevel= rand() / (float) RAND_MAX;
        CGFloat blueLevel= rand() / (float) RAND_MAX;
        
        self.view.backgroundColor = [UIColor colorWithRed: redLevel green: greenLevel blue: blueLevel alpha: 1.0];
    }];
    
    [UIView animateWithDuration:3.5  animations:^{
        
        CGFloat redLevel = rand() / (float) RAND_MAX;
        CGFloat greenLevel= rand() / (float) RAND_MAX;
        CGFloat blueLevel= rand() / (float) RAND_MAX;
        
        _text.backgroundColor = [UIColor colorWithRed: redLevel green: greenLevel blue: blueLevel alpha: 1.0];
    }];
    
    [UIView animateWithDuration:3.5  animations:^{
        
        CGFloat redLevel = rand() / (float) RAND_MAX;
        CGFloat greenLevel= rand() / (float) RAND_MAX;
        CGFloat blueLevel= rand() / (float) RAND_MAX;
        
        _address.backgroundColor = [UIColor colorWithRed: redLevel green: greenLevel blue: blueLevel alpha: 1.0];
    }];
    
    [UIView animateWithDuration:3.5  animations:^{
        
        CGFloat redLevel = rand() / (float) RAND_MAX;
        CGFloat greenLevel= rand() / (float) RAND_MAX;
        CGFloat blueLevel= rand() / (float) RAND_MAX;
        
        _number.backgroundColor = [UIColor colorWithRed: redLevel green: greenLevel blue: blueLevel alpha: 1.0];
    }];
    

}

@end
