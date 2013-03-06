//
//  ViewController5.m
//  FinalProject
//
//  Created by Alexandra Qin on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()

@end

@implementation ViewController5

@synthesize waves1;
@synthesize boat;
@synthesize FirstLabel;
@synthesize starsBG;
@synthesize flaw1;
@synthesize flaw2;
@synthesize flaw3;
@synthesize merit;

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
    
    FirstLabel.alpha = 0;
    
    
    waves1 = [UIImage imageNamed:@"waves_big.png"];
    starsBG = [UIImage imageNamed:@"stars_background.png"];
    boat = [UIImage imageNamed:@"boat_big.png"];
    flaw1 = [UIImage imageNamed:@"flaw1.png"];
    flaw2 = [UIImage imageNamed:@"flaw2.png"];
    flaw3 = [UIImage imageNamed:@"flaw3.png"];
    merit = [UIImage imageNamed:@"merit.png"];
    
    starsView = [[UIImageView alloc] initWithImage:starsBG];
    starsView.frame = CGRectMake(0,0,480,320);
    [self.view addSubview:starsView];
    
    boatView = [[UIImageView alloc] initWithImage:boat];
    boatView.frame = CGRectMake(100,50,270,263);
    [self.view addSubview:boatView];
    

    waveView1 = [[UIImageView alloc] initWithImage:waves1];
    waveView1.frame = CGRectMake(-5,200,685,155);
    [self.view addSubview:waveView1];
    
    flawView1 = [[UIImageView alloc] initWithImage:flaw1];
    flawView1.frame = CGRectMake(0,-45,45,45);
    [self.view addSubview:flawView1];
    
    flawView2 = [[UIImageView alloc] initWithImage:flaw2];
    flawView2.frame = CGRectMake(480,-45,45,45);
    [self.view addSubview:flawView2];
    
    flawView3 = [[UIImageView alloc] initWithImage:flaw3];
    flawView3.frame = CGRectMake(240,320,45,45);
    [self.view addSubview:flawView3];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(movingWaves) userInfo:nil repeats:YES];
    
    [self.view bringSubviewToFront:FirstLabel]; 
    [self updateLabel:@"Visualize your three biggest flaws."]; 
    [self performSelector:@selector(updateLabel:) withObject:@"At the touch of a finger, you can make them disappear." afterDelay:5];
    [self performSelector:@selector(updateLabel:) withObject:@"That is how perfect you are." afterDelay:10];
    
    
    flawView1.userInteractionEnabled = YES;
    flawView2.userInteractionEnabled = YES;
    flawView3.userInteractionEnabled = YES;
    flawView1.tag = 1;
    flawView2.tag = 2;
    flawView3.tag = 3;
    
    
    [self performSelector:@selector(attackMove) withObject:nil afterDelay:8];
    

    // CHANGE THIS SOON
    
    [self performSelector:@selector(callSegue) withObject:nil afterDelay:20];
    
    ////////////////////////////////////////
    // CHANGE THIS SOON
    
     // [self performSelector:@selector(callSegue) withObject:nil afterDelay:2];
    /////////////////////////////////////////
    
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    
    UITouch *touch = [touches anyObject];
    
    if(touch.view.tag == 1) 
        [flawView1 setImage:nil];
    else if (touch.view.tag == 2) 
        [flawView2 setImage:nil];
    else if (touch.view.tag == 3)
        [flawView3 setImage:nil];
    
}


-(void)callSegue {
    [self performSegueWithIdentifier:@"superSegue6" sender:self];
}

-(void)attackFirst {
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(attack1) userInfo:nil repeats:YES];
}

-(void)attackSecond{
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(attack2) userInfo:nil repeats:YES];
}

-(void)attackThird{
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(attack3) userInfo:nil repeats:YES];
}

-(void)attack1 {
    int x = flawView1.frame.origin.x;
    int y = flawView1.frame.origin.y;
    x++;
    y++;
    flawView1.frame = CGRectMake(x,y,45,45);
}

-(void)attack2 {
    int x = flawView2.frame.origin.x;
    int y = flawView2.frame.origin.y;
    x--;
    y ++;
    flawView2.frame = CGRectMake(x,y,45,45);
}

-(void)attack3 {
    int x = flawView3.frame.origin.x;
    int y = flawView3.frame.origin.y;
    x--;
    y--;
    flawView3.frame = CGRectMake(x,y,45,45);
}

-(void)attackMove {
    
    [self performSelector:@selector(attackFirst)withObject:nil afterDelay:1];
    
    [self performSelector:@selector(attackSecond)withObject:nil afterDelay:3];
    
    [self performSelector:@selector(attackThird)withObject:nil afterDelay:5];
}

-(void)movingWaves {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    waveView1.frame = CGRectMake(0,195,685,155);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    boatView.frame = CGRectMake(103,52,270,263);
    [UIView commitAnimations];
    
    [self performSelector:@selector(movingWaves2) withObject:nil afterDelay:1];
}

-(void)movingWaves2 {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    waveView1.frame = CGRectMake(-5,200,685,155);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    boatView.frame = CGRectMake(100,50,270,263);
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
    [self setBoat:nil];
    [self setFlaw1:nil];
    [self setFlaw2:nil];
    [self setFlaw3:nil];
    [self setMerit:nil];
    
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
