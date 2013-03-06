//
//  Story2ViewController.m
//  FinalProject
//
//  Created by Alexandra Qin on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Story2ViewController.h"

@implementation Story2ViewController

@synthesize waves1;
@synthesize waves2;
@synthesize boat;
@synthesize FirstLabel;
@synthesize starsBG;

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
    
    FirstLabel.alpha = 0;
    
    waves1 = [UIImage imageNamed:@"waves.png"];
    waves2 = [UIImage imageNamed:@"waves.png"];
    starsBG = [UIImage imageNamed:@"stars_background.png"];
    boat = [UIImage imageNamed:@"little_boat.png"];
    
    starsView = [[UIImageView alloc] initWithImage:starsBG];
    starsView.frame = CGRectMake(0,0,480,320);
    [self.view addSubview:starsView];
    
    boatView = [[UIImageView alloc] initWithImage:boat];
    boatView.frame = CGRectMake(-40,165,51,70);
    [starsView addSubview:boatView];
    
    waveView2 = [[UIImageView alloc] initWithImage:waves2];
    waveView2.frame = CGRectMake(0,207,485,93);
    [starsView addSubview:waveView2];
    
    waveView1 = [[UIImageView alloc] initWithImage:waves1];
    waveView1.frame = CGRectMake(-5,237,485,93);
    [starsView addSubview:waveView1];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(movingWaves) userInfo:nil repeats:YES];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:60];
    boatView.frame = CGRectMake(480,175,51,70);
    [UIView commitAnimations];
    
    [self.view bringSubviewToFront:FirstLabel]; 
    [self updateLabel:@"This ocean is as vast as your capacity for love."];
    [self performSelector:@selector(updateLabel:) withObject:@"Seriously, you can love every human being." afterDelay:5];
    [self performSelector:@selector(updateLabel:) withObject:@"Even the ones you think you hate." afterDelay:10];
    [self performSelector:@selector(updateLabel:) withObject:@"Whenever you feel hatred or jealousy" afterDelay:15];
    [self performSelector:@selector(updateLabel:) withObject:@"It is simply because your perception of reality is distorted" afterDelay:20];
    [self performSelector:@selector(updateLabel:) withObject:@"You are not flawed." afterDelay:25];
    [self performSelector:@selector(updateLabel:) withObject:@"And others aren't flawed either." afterDelay:30];
    [self performSelector:@selector(updateLabel:) withObject:@"You can be pure Love." afterDelay:35];
    
    // CHANGE THIS SOON
    
    [self performSelector:@selector(callSegue) withObject:nil afterDelay:60];
    
    ////////////////////////////////////////
     // CHANGE THIS SOON
    
      // [self performSelector:@selector(callSegue) withObject:nil afterDelay:2];
    /////////////////////////////////////////
    
}

-(void)callSegue {
    [self performSegueWithIdentifier:@"superSegue5" sender:self];
}

-(void)movingWaves {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    waveView1.frame = CGRectMake(0,237,485,93);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    waveView2.frame = CGRectMake(-5,207,485,93);
    [UIView commitAnimations];
    
    [self performSelector:@selector(movingWaves2) withObject:nil afterDelay:1];
}

-(void)movingWaves2 {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    waveView1.frame = CGRectMake(-5,237,485,93);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    waveView2.frame = CGRectMake(0,207,485,93);
    [UIView commitAnimations];
}


- (void)viewDidUnload
{
    [self setFirstLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self setStarsBG:nil];
    [self setWaves1:nil];
    [self setWaves2:nil];
    [self setBoat:nil];
    

}

-(void)updateLabel:(NSString*)update {
    [self fadeOut];
    [FirstLabel performSelector:@selector(setText:) withObject:update afterDelay:1.0];
    [self performSelector:@selector(fadeIn) withObject:nil afterDelay:2.0];
}

-(void)fadeIn{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [FirstLabel setAlpha:1];
    [UIView commitAnimations];    
}

-(void)fadeOut{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [FirstLabel setAlpha:0];
    [UIView commitAnimations];    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
