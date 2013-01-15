//
//  DetailCommandeViewController.h
//  ProjetiPhone
//
//  Created by Johan Delouche on 09/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Commande.h"

@interface DetailCommandeViewController : UIViewController {
    UITextView *_text;
}

@property Commande *commande;

@end
