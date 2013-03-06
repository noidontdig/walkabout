//
//  Story1ViewController.m
//  FinalProject
//
//  Created by Alexandra Qin on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Story1ViewController.h"

@implementation Story1ViewController

@synthesize FirstLabel;
@synthesize personImage;
@synthesize guy;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    ////////////////////////////////   
    // REMOVE THIS SOON!!!!
    
     // å[self performSelector:@selector(callSegue) withObject:nil afterDelay:2];
    //////////////////////////////////
    
    t = 0;
    
    centerX = 240;
    centerY = 160;
    personWidth = 220;
    personHeight = 260;
    // 480x320

    // person -> 254x300
    // startx:113 starty:0
    // NEW: 220x260
    guy = [UIImage imageNamed:@"white_little_guy.png"];
    personImage = [UIImage imageNamed:@"person_big.png"];
    FirstLabel.alpha = 0;
    lWidth = FirstLabel.bounds.size.width;
    lHeight = FirstLabel.bounds.size.height;
    
    personView = [[UIImageView alloc] initWithImage:personImage];
    personView.frame = CGRectMake(centerX - (personWidth / 2), 50, personWidth, personHeight);
    personView.alpha = 0;
    [self.view addSubview:personView];
     
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3];
    personView.alpha = 1;
    [UIView commitAnimations];
    
    t += 4; // image fade in + screen time
    FirstLabel.text = @"This is you.";
    [self performSelector:@selector(fadeIn:) withObject:FirstLabel afterDelay:t];
    
    t += 3;
    [self performSelector:@selector(makeSmall) withObject:nil afterDelay:t];
    

    
    }

-(void)makeSmall {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:5];
    personView.frame = CGRectMake(50, 122, 41, 78);
    personView.alpha = 0;
    [UIView commitAnimations];
    
    [self performSelector:@selector(changeGuy) withObject:nil afterDelay:5];
}

-(void)changeGuy {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    personView.alpha = 1;
    [UIView commitAnimations];
    [personView performSelector:@selector(setImage:) withObject:guy afterDelay:0];
    
    [self performSelector:@selector(fadeOut:) withObject:FirstLabel afterDelay:1];
    [self performSelector:@selector(callSegue) withObject:nil afterDelay:2];
    
}

-(void)callSegue {
    [self performSegueWithIdentifier:@"firstSegue" sender:self];
}


- (void)viewDidUnload
{
    [self setFirstLabel:nil];
    [self setPersonImage:nil];
    [self setGuy:nil];
    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

-(void)updateFirstLabel:(NSString*)update {
    [self performSelector:@selector(fadeOut:) withObject:FirstLabel];
    [FirstLabel performSelector:@selector(setText:) withObject:update afterDelay:1];
    [self performSelector:@selector(fadeOut:) withObject:FirstLabel afterDelay:1];
}

-(void)fadeIn:(UIView*)view {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [view setAlpha:1];
    [UIView commitAnimations];    
}

-(void)fadeOut:(UIView*)view {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [view setAlpha:0];
    [UIView commitAnimations];    
}


@end
