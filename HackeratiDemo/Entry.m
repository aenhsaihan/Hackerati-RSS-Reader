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
                self.name = [obj objectForKey:@"label"];
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

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init]){
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.images = [aDecoder decodeObjectForKey:@"images"];
        self.summary = [aDecoder decodeObjectForKey:@"summary"];
        self.price = [aDecoder decodeObjectForKey:@"price"];
        self.link = [aDecoder decodeObjectForKey:@"link"];
        self.artist = [aDecoder decodeObjectForKey:@"artist"];
        self.category = [aDecoder decodeObjectForKey:@"category"];
        self.releaseDate = [aDecoder decodeObjectForKey:@"releaseDate"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.images forKey:@"images"];
    [aCoder encodeObject:self.summary forKey:@"summary"];
    [aCoder encodeObject:self.price forKey:@"price"];
    [aCoder encodeObject:self.link forKey:@"link"];
    [aCoder encodeObject:self.artist forKey:@"artist"];
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.releaseDate forKey:@"releaseDate"];
}

@end
