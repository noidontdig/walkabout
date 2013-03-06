//
//  Play1ViewController.m
//  FinalProject
//
//  Created by Alexandra Qin on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Play1ViewController.h"

@interface Play1ViewController ()

@end

@implementation Play1ViewController

@synthesize floor;
@synthesize floor2;
@synthesize guy;
@synthesize mountains;
@synthesize FirstLabel;
@synthesize castle;

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
    
    
    
    mountains = [UIImage imageNamed:@"moutains.png"];
    mountainsView = [[UIImageView alloc] initWithImage:mountains];
    mountainsView.frame = CGRectMake(200,80,311,127);
    [self.view addSubview:mountainsView];
    
    castle = [UIImage imageNamed:@"castle.png"];
    castleView = [[UIImageView alloc] initWithImage:castle];
    castleView.frame = CGRectMake(850,20,300,188);
    [self.view addSubview:castleView];
    
    // screen dim 480 x 320
    // floor dim  825 x 399 
    floor = [UIImage imageNamed:@"floor.png"];
	floorView = [[UIImageView alloc] initWithImage:floor];
    floorView.frame = CGRectMake(0,200,825,399);
    [self.view addSubview:floorView];
    
    floorView.userInteractionEnabled = YES;
    floorView.tag = 1;

    floor2 = [UIImage imageNamed:@"floor.png"];
	floorView2 = [[UIImageView alloc] initWithImage:floor2];
    floorView2.frame = CGRectMake(825,200,825,399);
    [self.view addSubview:floorView2];
    
    floorView2.userInteractionEnabled = YES;
    floorView2.tag = 2;
    
    guy = [UIImage imageNamed:@"white_little_guy.png"];
    guyView = [[UIImageView alloc] initWithImage:guy];
    guyView.frame = CGRectMake(50, 122, 41, 78);
    [self.view addSubview:guyView];
    
    [self.view bringSubviewToFront:FirstLabel]; 
    FirstLabel.text = @"Touch the floor to move forward.";
    [self fadeIn];
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {

    UITouch *touch = [touches anyObject];
    if((touch.view.tag == 1) || (touch.view.tag == 2)) {
        
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
        [self updateLabel:@"Good, now you are moving."];
    }   
    else if (step == 100) {
        [self updateLabel:@"What are you moving toward?"];
    }
    else if (step == 200) {
        [self updateLabel:@"What is it that you want?"];
    }
    else if (step == 300) {
        [self updateLabel:@"You want peace of mind."];
    }
    else if (step == 420) {
        [self updateLabel:@"You want to be free from suffering."];
    }
    else if (step == 530) {
        [self updateLabel:@"But how can you get there?"];
    }
    else if (step == 700) {
        [self updateLabel:@"The way is in knowing yourself"];
    }
    else if (step == 800)
        [self fadeOut];
    else if (step == 900) {
        [self callSegue];
    }
}

-(void)updateLabel:(NSString*)update {
    [self fadeOut];
    [FirstLabel performSelector:@selector(setText:) withObject:update afterDelay:1.0];
    [self performSelector:@selector(fadeIn) withObject:nil afterDelay:2.0];
}

-(void)callSegue {
    [self performSegueWithIdentifier:@"superSegue2" sender:self];
}

-(void)moveFloor {
    step++;
    [self checkStep];
    int originX = floorView.frame.origin.x;
    int originX2 = floorView2.frame.origin.x;
    float mountainX = mountainsView.frame.origin.x;
    float castleX = castleView.frame.origin.x;
    originX -= 1;
    originX2 -= 1;
    mountainX -= 0.7;
    castleX -= 0.9;
    floorView.frame = CGRectMake(originX,200,825,399);
    floorView2.frame = CGRectMake(originX2,200,825,399);
    mountainsView.frame = CGRectMake(mountainX,80,311,127);
    castleView.frame = CGRectMake(castleX,20,300,188);
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
    [super viewDidUnload];
    [self setFloor:nil];
    [self setFloor2:nil];
    [self setGuy:nil];
    [self setMountains:nil];
    [self setCastle:nil];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
