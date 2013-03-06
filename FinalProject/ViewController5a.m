//
//  ViewController5a.m
//  FinalProject
//
//  Created by Alexandra Qin on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController5a.h"

@interface ViewController5a ()

@end

@implementation ViewController5a

@synthesize floor;
@synthesize FirstLabel;
@synthesize guy;
@synthesize mountains;
@synthesize sea;


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
    
    step = 0;
    FirstLabel.alpha = 0;
    
    
    ////////////////////////////////   
    // REMOVE THIS SOON!!!!
    
      // [self performSelector:@selector(callSegue) withObject:nil afterDelay:2];
    //////////////////////////////////
    [self.view bringSubviewToFront:FirstLabel];    
    
    mountains = [UIImage imageNamed:@"eyes.png"];
    mountainsView = [[UIImageView alloc] initWithImage:mountains];
    mountainsView.frame = CGRectMake(200,-20,300,234);
    [self.view addSubview:mountainsView];
    
    sea = [UIImage imageNamed:@"sea.png"];
    seaView = [[UIImageView alloc] initWithImage:sea];
    seaView.frame = CGRectMake(800,200,600,218);
    seaView.tag = 2;
    [self.view addSubview:seaView];
    
    // screen dim 480 x 320
    // floor dim  825 x 399 
    floor = [UIImage imageNamed:@"floor3.png"];
	floorView = [[UIImageView alloc] initWithImage:floor];
    floorView.frame = CGRectMake(0,200,800,240);
    [self.view addSubview:floorView];
    
    floorView.userInteractionEnabled = YES;
    seaView.userInteractionEnabled =  YES;
    floorView.tag = 1;
    
    
    guy = [UIImage imageNamed:@"black_little_guy.png"];
    guyView = [[UIImageView alloc] initWithImage:guy];
    guyView.frame = CGRectMake(50, 122, 41, 78);
    [self.view addSubview:guyView];
    
    [self.view bringSubviewToFront:FirstLabel];  
    FirstLabel.text = @"   Keep going until you reach the ocean.";
    [self fadeIn];
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    
    UITouch *touch = [touches anyObject];
    if ((touch.view.tag == 1) || (touch.view.tag == 2)) {
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moveFloor)userInfo:nil repeats:YES];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [timer invalidate];
    timer = nil;
}

-(void)checkStep {

    if (step == 5){
        [self updateLabel:@"   You have been led to believe that you are inherently flawed."];
    }   
    else if (step == 100) {
        [self updateLabel:@"   That isn't true."];
    }
    else if (step == 200) {
        [self updateLabel:@"   Your perfection has simply been covered up."];
    }
    else if (step == 300) {
        [self updateLabel:@"   You are inherantly pure, good, beautiful."];
    }
    else if (step == 420) {
        [self updateLabel:@"   You have the capacity to be those things."];
    }
     else if (step == 530) {
        [self updateLabel:@"   You just need to uncover your true nature."];
    }
    else if (step == 680) {
        [self fadeOut];
        floorView.userInteractionEnabled = NO;
        seaView.userInteractionEnabled = NO;
        [self performSelector:@selector(callSegue) withObject:nil afterDelay:2];
    }
}

-(void)updateLabel:(NSString*)update {
    [self fadeOut];
    [FirstLabel performSelector:@selector(setText:) withObject:update afterDelay:1.0];
    [self performSelector:@selector(fadeIn) withObject:nil afterDelay:2.0];
}

-(void)callSegue {
    [self performSegueWithIdentifier:@"superSegue4" sender:self];
}

-(void)moveFloor {
    step++;
    [self checkStep];
    int originX = floorView.frame.origin.x;
    float mountainX = mountainsView.frame.origin.x;
    float seaX = seaView.frame.origin.x;
    originX -= 1;
    mountainX -= 0.7;
    seaX -= 1;
    floorView.frame = CGRectMake(originX,200,800,240);
    mountainsView.frame = CGRectMake(mountainX,-20,300,234);
    seaView.frame = CGRectMake(seaX,200,600,218);
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

- (void)viewDidUnload
{
    [self setFirstLabel:nil];
    [self setFirstLabel:nil];
    [super viewDidUnload];
    [self setFloor:nil];
    [self setGuy:nil];
    [self setMountains:nil];
    [self setSea:nil];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
