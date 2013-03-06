//
//  Play2ViewController.h
//  FinalProject
//
//  Created by Alexandra Qin on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Play2ViewController : UIViewController {
    
    UIImageView* humanView;
    UIImageView* dogView;
    int t;
    int step;
}

@property (nonatomic, retain) UIImage* dog;
@property (nonatomic, retain) UIImage* human;
@property (strong, nonatomic) IBOutlet UILabel *FirstLabel;
@property (strong, nonatomic) IBOutlet UILabel *ansLabel1;
@property (strong, nonatomic) IBOutlet UILabel *ansLabel2;

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
-(void)fadeIn:(UIView*)view;
-(void)fadeOut:(UIView*)view;
-(void)moveRight;
-(void)fadeInAll;
-(void)fadeOutAll;
-(void)checkStep;
-(void)callSegue;

@end
