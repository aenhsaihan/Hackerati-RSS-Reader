//
//  Entry.h
//  HackeratiDemo
//
//  Created by Aditya Narayan on 6/11/14.
//  Copyright (c) 2014 TurnToTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSDictionary *price;
@property (nonatomic, strong) NSDictionary *contentType;
@property (nonatomic, strong) NSString *rights;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDictionary *link;
@property (nonatomic, strong) NSDictionary *identification;
@property (nonatomic, strong) NSDictionary *artist;
@property (nonatomic, strong) NSDictionary *category;
@property (nonatomic, strong) NSDictionary *releaseDate;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
