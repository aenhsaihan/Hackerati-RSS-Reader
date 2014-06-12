//
//  DetailViewController.m
//  HackeratiDemo
//
//  Created by Aditya Narayan on 6/12/14.
//  Copyright (c) 2014 TurnToTech. All rights reserved.
//

#import "DetailViewController.h"

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
    
    self.title = self.entry.name;
    [self setImage];
    
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
                self.ipadImageView.image = image;
            }
            else {
                // The device is an iPhone or iPod touch.
                self.iphoneImageView.image = image;
            }
        });
    });
    
}
- (IBAction)viewArtistLink:(id)sender {
}
@end
