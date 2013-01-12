//
//  Wine.h
//  ProjetiPhone
//
//  Created by Johan Delouche on 25/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wine : NSObject

-(NSString*) toString;
-(NSString*) getInfos;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *origin;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *price;

@end
