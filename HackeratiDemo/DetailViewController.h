//
//  DetailViewController.h
//  HackeratiDemo
//
//  Created by Aditya Narayan on 6/12/14.
//  Copyright (c) 2014 TurnToTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) Entry *entry;



@property (weak, nonatomic) IBOutlet UIImageView *iphoneImageView;




@end
