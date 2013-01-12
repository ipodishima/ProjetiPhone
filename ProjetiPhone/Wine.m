//
//  Wine.m
//  ProjetiPhone
//
//  Created by Johan Delouche on 25/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import "Wine.h"

@implementation Wine

-(NSString*) toString {
    return [[_name stringByAppendingString:@" de "] stringByAppendingString:_year];
}

-(NSString*) getInfos {

    return [[[[self.toString stringByAppendingString:@"\nprovenance : "] stringByAppendingString:_origin] stringByAppendingString:@"\nprix : "] stringByAppendingString:_price];
}

@end
