//
//  DataModel.h
//  HackeratiDemo
//
//  Created by Aditya Narayan on 6/11/14.
//  Copyright (c) 2014 TurnToTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong) NSDictionary *author;
@property (nonatomic, strong) NSMutableDictionary *entries;
@property (nonatomic, strong) NSString *updated;
@property (nonatomic, strong) NSString *rights;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSArray *link;
@property (nonatomic, strong) NSString *identification;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
