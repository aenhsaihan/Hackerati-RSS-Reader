//
//  DetailViewController.m
//  HackeratiDemo
//
//  Created by Aditya Narayan on 6/12/14.
//  Copyright (c) 2014 TurnToTech. All rights reserved.
//

#import "DetailViewController.h"
#import "EntryEntity.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.appDelegate = [UIApplication sharedApplication].delegate;
    
    self.title = self.entry.name;
    
    [self setImage];
    
    
    UIBarButtonItem *shareBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(displayActivityControllerWithDataObject)];
    self.favoritesBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(setAsFavorite)];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:self.favoritesBarButton, shareBarButton, nil]];
    
    if ([self checkFavoriteStatus]) {
        self.favoritesBarButton.enabled = NO;
    }
    
    NSString *category = [[self.entry.category objectForKey:@"attributes"] objectForKey:@"term"];
    NSString *releaseDate = [[self.entry.releaseDate objectForKey:@"attributes"] objectForKey:@"label"];
    NSString *price = [self.entry.price objectForKey:@"label"];
    
    if (![price isEqualToString:@"Free"]) {
        
        NSString *amount = [[self.entry.price objectForKey:@"attributes"] objectForKey:@"amount"];
        float floatAmount = [amount floatValue];
        NSString *amountWithTwoDecimals = [NSString stringWithFormat:@"%0.2f", floatAmount];
        NSString *currency = [[self.entry.price objectForKey:@"attributes"] objectForKey:@"currency"];
        
        price = [NSString stringWithFormat:@"%@ %@", currency, amountWithTwoDecimals];
    }
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [self.ipadArtistButton setTitle:[self.entry.artist objectForKey:@"label"] forState:UIControlStateNormal];
        self.ipadCategoryLabel.text = category;
        self.ipadReleaseDateLabel.text = releaseDate;
        [self.ipadPriceButton setTitle:price forState:UIControlStateNormal];
        self.ipadSummaryTextView.text = self.entry.summary;
        self.ipadSummaryTextView.editable = NO;
    } else {
        [self.iphoneArtistButton setTitle:[self.entry.artist objectForKey:@"label"] forState:UIControlStateNormal];
        self.iphoneCategoryLabel.text = category;
        self.iphoneReleaseDateLabel.text = releaseDate;
        [self.iphonePriceButton setTitle:price forState:UIControlStateNormal];
        self.iphoneSummaryTextView.text = self.entry.summary;
        self.iphoneSummaryTextView.editable = NO;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImage *)downloadImage
{
    NSURL *url = [NSURL URLWithString:[[self.entry.images objectAtIndex:2] objectForKey:@"label"]];
    
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    UIImage *image = [UIImage imageWithData:imageData];
    
    return image;
}

-(void)setImage
{
    
    __block UIImage *image;
    
    dispatch_queue_t imageDownloadQueue = dispatch_queue_create("imageDownloadQueue", NULL);
    dispatch_async(imageDownloadQueue, ^{
        
        image = [self downloadImage];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                // The device is an iPad running iOS 3.2 or later.
                
                if (!image) {
                    self.ipadImageView.image = [UIImage imageNamed:@"noimage.png"];
                } else {
                    self.ipadImageView.image = image;
                }
            }
            else {
                // The device is an iPhone or iPod touch.
                
                if (!image) {
                    self.iphoneImageView.image = [UIImage imageNamed:@"noimage.png"];
                } else {
                    self.iphoneImageView.image = image;
                }
            }
        });
    });
    
}
- (IBAction)viewArtistLink:(id)sender {
    
    NSString *url = [[self.entry.artist objectForKey:@"attributes"] objectForKey:@"href"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    
}

- (IBAction)purchaseApplication:(id)sender {
    NSString *url = [[self.entry.link objectForKey:@"attributes"] objectForKey:@"href"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (void)displayActivityControllerWithDataObject {
    
    NSString *url = [[self.entry.link objectForKey:@"attributes"] objectForKey:@"href"];
    
    UIActivityViewController* vc = [[UIActivityViewController alloc]
                                    initWithActivityItems:@[url] applicationActivities:nil];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        self.popover = [[UIPopoverController alloc] initWithContentViewController:vc];
        
        [self.popover presentPopoverFromRect:CGRectMake(self.view.frame.size.width - 128, self.navigationController.navigationBar.frame.origin.y - 55, 100, 100) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    } else {
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    
}

-(void)setAsFavorite {
    
    EntryEntity *entryEntity = [NSEntityDescription insertNewObjectForEntityForName:@"EntryEntity" inManagedObjectContext:self.appDelegate.managedObjectContext];
    entryEntity.entryObj = self.entry;
    
    NSError *error;
    
    if ([self.appDelegate.managedObjectContext save:&error]) {
        
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            
            NSLog(@"Entry has been saved into Core Data as a favorite");
            
            self.favoritesBarButton.enabled = NO;
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"App added!" message:@"App has been added to favorites" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }

    }

}

-(BOOL)checkFavoriteStatus
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"EntryEntity" inManagedObjectContext:self.appDelegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Error: %@", [error localizedDescription]);
        return NO;
    }
    
    if (fetchedObjects == nil) {
        NSLog(@"No objects have been found during the fetch request");
        return NO;
    }
    
    NSMutableArray *entries = [[NSMutableArray alloc] init];
    
    [fetchedObjects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        EntryEntity *entryEntity = obj;
        Entry *entry = entryEntity.entryObj;
        [entries addObject:[self extractIdentificationOfEntry:entry]];
    }];
    
    
    if ([entries containsObject:[self extractIdentificationOfEntry:self.entry]]) {
        return YES;
    } else {
        return NO;
    }
}

-(NSString *)extractIdentificationOfEntry:(Entry *)entry
{
    NSString *identificationString = [[entry.identification objectForKey:@"attributes"] objectForKey:@"im:id"];
    return identificationString;
}

@end
