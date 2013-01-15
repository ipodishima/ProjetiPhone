//
//  DetailWineViewController.h
//  ProjetiPhone
//
//  Created by Johan Delouche on 03/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Commande.h"

@interface DetailWineViewController : UIViewController {
    UILabel *_label;
    UIButton *_commander;
    NSUserDefaults *_pref;
}

@property NSString *textToShow;

@end
