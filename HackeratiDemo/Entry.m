//
//  Entry.m
//  HackeratiDemo
//
//  Created by Aditya Narayan on 6/11/14.
//  Copyright (c) 2014 TurnToTech. All rights reserved.
//

#import "Entry.h"

@implementation Entry


-(id)initWithArray:(NSArray *)array
{
    if (self = [super init]) {
        
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            NSLog(@"%lu", (unsigned long)idx);
            
            [obj enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            }];
            
        }];
        
    }
    
    return self;
}

@end
