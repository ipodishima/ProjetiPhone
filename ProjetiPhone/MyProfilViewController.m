//
//  MyProfilViewController.m
//  ProjetiPhone
//
//  Created by Johan Delouche on 03/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import "MyProfilViewController.h"
#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface MyProfilViewController () <FBLoginViewDelegate>

@property (strong, nonatomic) id<FBGraphUser> loggedInUser;

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
    
    _loginview = [[FBLoginView alloc] init];
    
    _loginview.frame = CGRectOffset(_loginview.frame, 20, 280);
    _loginview.delegate = self;
    
    
    
    [_loginview sizeToFit];
    _post = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _post.frame = CGRectMake(190, 150, 80, 30);
    [_post setTitle:@"Post" forState:UIControlStateNormal];
    [_post addTarget:self action:@selector(postStatusUpdate:) forControlEvents:UIControlEventTouchUpInside];
    _post.backgroundColor = [UIColor whiteColor];
    [_post setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    _name = [[UITextView alloc] initWithFrame:CGRectMake(20, 20, 150, 50)];
    _address = [[UITextView alloc] initWithFrame:CGRectMake(20, 110, 150, 50)];
    _number = [[UITextView alloc] initWithFrame:CGRectMake(20, 200, 150, 50)];
    
    _name.editable = NO;
    _address.editable = NO;
    _number.editable = NO;
    _address.dataDetectorTypes = UIDataDetectorTypeAddress;
    _number.dataDetectorTypes = UIDataDetectorTypePhoneNumber;

    
    _name.text = @"Johan Delouche";
    _address.text = @"Adresse :\n880 route de mimet\n13120 Gardanne";
    _number.text = @"Numéro :\n0698920135";
    
    _profilPictureView = [[FBProfilePictureView alloc] initWithFrame:CGRectMake(190, 20, 100, 100)];
   
    
    [self.view addSubview:_name];
    [self.view addSubview:_address];
    [self.view addSubview:_number];
    [self.view addSubview:_profilPictureView];
    [self.view addSubview:_loginview];
    [self.view addSubview:_post];

    
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
        
        _name.backgroundColor = [UIColor colorWithRed: redLevel green: greenLevel blue: blueLevel alpha: 1.0];
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

#pragma mark - FBLoginViewDelegate

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
     _post.enabled = YES;
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    _name.text = user.name;
    _profilPictureView.profileID = user.id;
    self.loggedInUser = user;

    
    
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {

    _name.text = @"Johan Delouche";
    _address.text = @"Adresse :\n880 route de mimet\n13120 Gardanne";
    _number.text = @"Numéro :\n0695950136";
    _profilPictureView.profileID = nil;
    self.loggedInUser = nil;
    _post.enabled = NO;
}

#pragma mark -

// Convenience method to perform some action that requires the "publish_actions" permissions.
- (void) performPublishAction:(void (^)(void)) action {
    // we defer request for permission to post to the moment of post, then we check for the permission
    if ([FBSession.activeSession.permissions indexOfObject:@"publish_actions"] == NSNotFound) {
        // if we don't already have the permission, then we request it now
        [FBSession.activeSession reauthorizeWithPublishPermissions:[NSArray arrayWithObject:@"publish_actions"]
                                                   defaultAudience:FBSessionDefaultAudienceFriends
                                                 completionHandler:^(FBSession *session, NSError *error) {
                                                     if (!error) {
                                                         action();
                                                     }
                                                     //For this example, ignore errors (such as if user cancels).
                                                 }];
    } else {
        action();
    }
    
}

// Post Status Update button handler; will attempt to invoke the native
// share dialog and, if that's unavailable, will post directly
- (void)postStatusUpdate:(UIButton *)sender {
    // Post a status update to the user's feed via the Graph API, and display an alert view
    // with the results or an error.
 
    NSString *message = @"Mais c'est trop bien le projet iOS !";
    
    // if it is available to us, we will post using the native dialog
    BOOL displayedNativeDialog = [FBNativeDialogs presentShareDialogModallyFrom:self
                                                                    initialText:nil
                                                                          image:nil
                                                                            url:nil
                                                                        handler:nil];
    if (!displayedNativeDialog) {
        
        [self performPublishAction:^{
            // otherwise fall back on a request for permissions and a direct post
            [FBRequestConnection startForPostStatusUpdate:message
                                        completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                            
                                            [self showAlert:message result:result error:error];
                                            _post.enabled = YES;
                                        }];
            
            _post.enabled = NO;
        }];
    }
}


// UIAlertView helper for post buttons
- (void)showAlert:(NSString *)message
           result:(id)result
            error:(NSError *)error {
    
    NSString *alertMsg;
    NSString *alertTitle;
    if (error) {
        alertMsg = error.localizedDescription;
        alertTitle = @"Error";
    } else {
        NSDictionary *resultDict = (NSDictionary *)result;
        alertMsg = [NSString stringWithFormat:@"Successfully posted '%@'.\nPost ID: %@",
                    message, [resultDict valueForKey:@"id"]];
        alertTitle = @"Success";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle
                                                        message:alertMsg
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}


@end
