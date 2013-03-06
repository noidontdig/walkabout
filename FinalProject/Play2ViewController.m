//
//  Play2ViewController.m
//  FinalProject
//
//  Created by Alexandra Qin on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Play2ViewController.h"

@interface Play2ViewController ()

@end

@implementation Play2ViewController

@synthesize dog;
@synthesize human;
@synthesize FirstLabel;
@synthesize ansLabel1;
@synthesize ansLabel2;

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
    //////////////////////////
    
     // [self performSelector:@selector(callSegue) withObject:nil afterDelay:2];
    
    /////////////////////////
    
    
    t = 0;
    step = 0;
    
    FirstLabel.alpha = 0;
    ansLabel1.alpha = 0;
    ansLabel2.alpha = 0;
    ansLabel1.tag = 1;
    ansLabel2.tag = 2;
    
    // dog dim 327x300
    // human dim 27x100
    dog = [UIImage imageNamed:@"dog.png"];
    human = [UIImage imageNamed:@"human.png"];
    
    humanView = [[UIImageView alloc] initWithImage:human];
    humanView.frame = CGRectMake(145,140,27,100);
    humanView.alpha = 0;
    [self.view addSubview:humanView];
    
    dogView = [[UIImageView alloc] initWithImage:dog];
    dogView.frame = CGRectMake(153,20,327,300);
    dogView.alpha = 0;
    [self.view addSubview:dogView];
    
    t += 1; // wait time
    [self performSelector:@selector(fadeIn:) withObject:dogView afterDelay:t];
    t += 2; // fade time + wait time
    [self performSelector:@selector(fadeIn:) withObject:humanView afterDelay:t];
    
    t += 2; // fade time + screen time
    [self performSelector:@selector(moveRight) withObject:nil afterDelay:t];
    
    t += 2; // move right animation time
    FirstLabel.text = @"Hi, there.";
    [self performSelector:@selector(fadeIn:) withObject:FirstLabel afterDelay:t];
    t += 2; // fade in + screen time
    [self performSelector:@selector(fadeOut:) withObject:FirstLabel afterDelay:t];
    t += 2; // fade out + wait time
    
    [FirstLabel performSelector:@selector(setText:) withObject:@"Do you think you know yourself?" afterDelay:t];
    ansLabel1.text = @"- Yes.";
    ansLabel2.text = @"- I'm not sure.";
    [self performSelector:@selector(fadeInAll) withObject:nil afterDelay:t];
    
    t += 3; // fade time;

}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    
    UITouch *touch = [touches anyObject];
    
    if((touch.view.tag == 1) || (touch.view.tag == 2)) {
        [self fadeOutAll];
        [self performSelector:@selector(checkStep) withObject:nil afterDelay:2];
        if (touch.view.tag == 1) 
            ansLabel1.alpha = 0;
        else 
            ansLabel2.alpha = 0;
    }
}

-(void)checkStep {
    step++;
    if (step == 1) {
        FirstLabel.text = @"You don't.";
        ansLabel1.text = @"- I really think I do.";
        ansLabel2.text = @"- Why not?";
        [self fadeInAll];
    }
    else if (step == 2) {
        FirstLabel.text = @"You don't know the potential you have.";
        ansLabel1.text = @"- Maybe not.";
        ansLabel2.text = @"- What do you mean?";
        [self fadeInAll];
    }
    else if (step == 3) {
        FirstLabel.text = @"You are pure, beautiful potential for love. You are perfect.";
        ansLabel1.text = @"- Okay...";
        ansLabel2.text = @"- Sure, why not.";
        [self fadeInAll];
    }
    else if (step == 4) {
        FirstLabel.text = @"It's true. Believe me.";
        ansLabel1.text = @"- Why should I believe you?";
        ansLabel2.text = @"- Um... Okay.";
        [self fadeInAll];
    }
    else if (step == 5) {
        FirstLabel.text = @"Because I am pure perfection as well.";
        ansLabel1.text = @"- So we are both perfect?";
        ansLabel2.text = @"";
        [self fadeInAll];
    }
    else if (step == 6) {
        FirstLabel.text = @"That's right. But not just us. Everyone is.";
        ansLabel1.text = @"- Go on...";
        ansLabel2.text = @"";
        [self fadeInAll];
    }
    else if (step == 7) {
        FirstLabel.text = @"Just keep moving.";
        ansLabel1.text = @"- Thanks...";
        ansLabel2.text = @"";
        [self fadeInAll];
    }
    else if (step == 8) {
        [self performSelector:@selector(fadeOut:) withObject:humanView];
        [self performSelector:@selector(fadeOut:) withObject:dogView afterDelay:1];
        [self performSelector:@selector(callSegue) withObject:nil afterDelay:2];
    }
    else {
        FirstLabel.text = @"POOP?";
        ansLabel1.text = @"- YES.";
        ansLabel2.text = @"- NO.";
        [self fadeInAll];
    }
}

-(void)callSegue {
    [self performSegueWithIdentifier:@"superSegue3" sender:self];
}

-(void)moveRight {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.0];
    humanView.frame = CGRectMake(260,140,27,100);
    [UIView commitAnimations]; 
}

-(void)fadeInAll {
    [self performSelector:@selector(fadeIn:) withObject:FirstLabel];
    [self performSelector:@selector(fadeIn:) withObject:ansLabel1 afterDelay:2];
    [self performSelector:@selector(fadeIn:) withObject:ansLabel2 afterDelay:2];
}

-(void)fadeOutAll {
    [self performSelector:@selector(fadeOut:) withObject:FirstLabel];
    [self performSelector:@selector(fadeOut:) withObject:ansLabel1];
    [self performSelector:@selector(fadeOut:) withObject:ansLabel2];
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

- (void)viewDidUnload
{
    [self setFirstLabel:nil];
    [self setAnsLabel1:nil];
    [self setAnsLabel2:nil];
    [super viewDidUnload];
    [self setDog:nil];
    [self setHuman:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
