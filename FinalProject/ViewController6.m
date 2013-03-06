//
//  ViewController6.m
//  FinalProject
//
//  Created by Alexandra Qin on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController6.h"

@interface ViewController6 ()

@end

@implementation ViewController6

@synthesize monster;
@synthesize FirstLabel;
@synthesize buddha;

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
    
    buddha = [UIImage imageNamed:@"blackheart.png"];
    buddhaView = [[UIImageView alloc] initWithImage:buddha];
    buddhaView.frame = CGRectMake(120,40,227,292);
    [self.view addSubview:buddhaView];
    buddhaView.alpha = 0;
	
    monster = [UIImage imageNamed:@"monster.png"];
    monsterView = [[UIImageView alloc] initWithImage:monster];
    monsterView.frame = CGRectMake(140,40,182,280);
    [self.view addSubview:monsterView];
    
    FirstLabel.alpha = 0;
    [self updateLabel:@"Search within yourself,"];
    [self performSelector:@selector(updateLabel:)withObject:@"And you will uncover your true nature of light." afterDelay:10];
    [self performSelector:@selector(makeBig) withObject:nil afterDelay:5];
    [self performSelector:@selector(fadeOut:) withObject:monsterView afterDelay:11];
    [self performSelector:@selector(fadeIn:) withObject:buddhaView afterDelay:12];
    [self performSelector:@selector(fadeOut:) withObject:buddhaView afterDelay:15];
     [self performSelector:@selector(fadeOut:) withObject:FirstLabel afterDelay:15];
    [self performSelector:@selector(callSegue)withObject:nil afterDelay:18];
    
}

- (void)viewDidUnload
{
    [self setFirstLabel:nil];
    [self setMonster:nil];
    [self setBuddha:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)makeBig {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:5];
    monsterView.frame = CGRectMake(12,40,455,700);
    [UIView commitAnimations];
}

-(void)callSegue {
    [self performSegueWithIdentifier:@"superSegue7" sender:self];
}

-(void)updateLabel:(NSString*)update {
    [self fadeOut:FirstLabel];
    [FirstLabel performSelector:@selector(setText:) withObject:update afterDelay:1.0];
    [self performSelector:@selector(fadeIn:) withObject:FirstLabel afterDelay:2.0];
}

-(void)fadeIn:(UIView*)view{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [view setAlpha:1];
    [UIView commitAnimations];    
}

-(void)fadeOut:(UIView*)view{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [view setAlpha:0];
    [UIView commitAnimations];    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
