//
//  DataModel.m
//  HackeratiDemo
//
//  Created by Aditya Narayan on 6/11/14.
//  Copyright (c) 2014 TurnToTech. All rights reserved.
//

#import "DataModel.h"
#import "Entry.h"

@implementation DataModel

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    
    if (self = [super init]) {
        
        [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            
            [obj enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                
                if ([key  isEqual: @"author"]) {
                    self.author = obj;
                } else if ([key isEqual: @"title"]) {
                    self.title = [obj objectForKey:@"label"];
                } else if ([key isEqual: @"entry"]) {
                    Entry *entry = [[Entry alloc] initWithArray:obj];
                }
                

            }];
            
        }];
        
    }
    
    return self;
}

@end
