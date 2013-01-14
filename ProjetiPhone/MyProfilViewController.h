//
//  MyProfilViewController.h
//  ProjetiPhone
//
//  Created by Johan Delouche on 03/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>


@interface MyProfilViewController : UIViewController {
    UITextView *_name;
    UITextView *_address;
    UITextView *_number;
    UIButton *_post;
    
    FBLoginView *_loginview;
    NSTimer *_timerForColorAnimation;
    FBProfilePictureView *_profilPictureView;
    
}

@end
