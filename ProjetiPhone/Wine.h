//
//  Wine.h
//  ProjetiPhone
//
//  Created by Johan Delouche on 25/10/12.
//  Copyright (c) 2012 Johan Delouche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wine : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger price;

@end
