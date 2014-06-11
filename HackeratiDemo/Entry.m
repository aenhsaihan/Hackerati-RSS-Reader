//
//  Entry.m
//  HackeratiDemo
//
//  Created by Aditya Narayan on 6/11/14.
//  Copyright (c) 2014 TurnToTech. All rights reserved.
//

#import "Entry.h"

@implementation Entry


-(id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        

        [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            
            if ([key isEqual: @"im:name"]) {
                self.name = obj;
            } else if ([key isEqual: @"title"]) {
                self.title = [obj objectForKey:@"label"];
            } else if ([key isEqual: @"im:image"]) {
                self.images = obj;
            } else if ([key isEqual:@"summary"]) {
                self.summary = [obj objectForKey:@"label"];
            } else if ([key isEqual:@"im:price"]) {
                self.price = obj;
            } else if ([key isEqual:@"im:contentType"]) {
                self.contentType = obj;
            } else if ([key isEqual:@"rights"]) {
                self.rights = [obj objectForKey:@"label"];
            } else if ([key isEqual:@"link"]) {
                self.link = obj;
            } else if ([key isEqual:@"id"]) {
                self.identification = obj;
            } else if ([key isEqual:@"im:artist"]) {
                self.artist = obj;
            } else if ([key isEqual:@"category"]) {
                self.category = obj;
            } else if ([key isEqual:@"im:releaseDate"]) {
                self.releaseDate = obj;
            }
            
        }];

        
    }
    
    return self;
}

@end
