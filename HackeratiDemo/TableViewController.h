//
//  TableViewController.h
//  HackeratiDemo
//
//  Created by Aditya Narayan on 6/11/14.
//  Copyright (c) 2014 TurnToTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "DetailViewController.h"

@interface TableViewController : UITableViewController

@property (nonatomic, strong) DataModel *dataModel;

@property (nonatomic, strong) NSMutableArray *images;

@property (nonatomic, strong) UIActivityIndicatorView *spinner;

@property (nonatomic, strong) DetailViewController *detailViewController;


-(void)startSpinner;
-(void)stopSpinner;

@end
