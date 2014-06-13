//
//  DetailViewController.h
//  HackeratiDemo
//
//  Created by Aditya Narayan on 6/12/14.
//  Copyright (c) 2014 TurnToTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"
#import "IODAppDelegate.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) Entry *entry;

@property (nonatomic, strong) UIPopoverController *popover;

@property (nonatomic, strong) IODAppDelegate *appDelegate;

@property (nonatomic, strong) UIBarButtonItem *favoritesBarButton;

@property (weak, nonatomic) IBOutlet UIImageView *iphoneImageView;
@property (weak, nonatomic) IBOutlet UIButton *iphoneArtistButton;
@property (weak, nonatomic) IBOutlet UILabel *iphoneCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *iphoneReleaseDateLabel;
@property (weak, nonatomic) IBOutlet UIButton *iphonePriceButton;
@property (weak, nonatomic) IBOutlet UITextView *iphoneSummaryTextView;


@property (weak, nonatomic) IBOutlet UIImageView *ipadImageView;
@property (weak, nonatomic) IBOutlet UIButton *ipadArtistButton;
@property (weak, nonatomic) IBOutlet UILabel *ipadCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *ipadReleaseDateLabel;
@property (weak, nonatomic) IBOutlet UIButton *ipadPriceButton;
@property (weak, nonatomic) IBOutlet UITextView *ipadSummaryTextView;



- (IBAction)viewArtistLink:(id)sender;
- (IBAction)purchaseApplication:(id)sender;











@end
