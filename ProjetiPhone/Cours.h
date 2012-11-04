//
//  Cours.h
//  ProjetiPhone
//
//  Created by Johan Delouche on 25/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Wine.h"
#import "Location.h"

@interface Cours : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *agenda;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, assign) NSMutableArray *wines;
@property (nonatomic, assign) Location *location;


@end
