//
//  ViewController6.h
//  FinalProject
//
//  Created by Alexandra Qin on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController6 : UIViewController {
    
    UIImageView *monsterView;
    UIImageView *buddhaView;
}

@property (nonatomic, retain) UIImage *monster;
@property (nonatomic, retain) UIImage *buddha;
@property (strong, nonatomic) IBOutlet UILabel *FirstLabel;

-(void)fadeIn:(UIView*)view;
-(void)fadeOut:(UIView*)view;
-(void)updateLabel:(NSString*)update;
-(void)callSegue;
-(void)makeBig;

@end
