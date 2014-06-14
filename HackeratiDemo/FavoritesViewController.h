//
//  FavoritesViewController.h
//  HackeratiDemo
//
//  Created by Aditya Narayan on 6/13/14.
//  Copyright (c) 2014 TurnToTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritesViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end
