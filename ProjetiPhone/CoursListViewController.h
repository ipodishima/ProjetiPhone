//
//  CoursListViewController.h
//  ProjetiPhone
//
//  Created by Johan Delouche on 03/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadManager.h"
#import "Cours.h"

@interface CoursListViewController : UITableViewController <DownloadDelegate> {
    UIActivityIndicatorView *_activity;
    NSMutableArray *_listOfCours;
}

@end
