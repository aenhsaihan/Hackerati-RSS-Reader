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
@property (weak, nonatomic) IBOutlet UIButton *iphoneArtistButton;
@property (weak, nonatomic) IBOutlet UILabel *iphoneCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *iphoneReleaseDateLabel;
@property (weak, nonatomic) IBOutlet UIButton *iphonePriceButton;


@property (weak, nonatomic) IBOutlet UIImageView *ipadImageView;
@property (weak, nonatomic) IBOutlet UIButton *ipadArtistButton;
@property (weak, nonatomic) IBOutlet UILabel *ipadCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *ipadReleaseDateLabel;
@property (weak, nonatomic) IBOutlet UIButton *ipadPriceButton;



- (IBAction)viewArtistLink:(id)sender;
- (IBAction)purchaseApplication:(id)sender;











@end
