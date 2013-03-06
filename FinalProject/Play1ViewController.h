//
//  Play1ViewController.h
//  FinalProject
//
//  Created by Alexandra Qin on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Play1ViewController : UIViewController {
    
    UIImageView *floorView;
    UIImageView *floorView2;
    UIImageView *guyView;
    UIImageView *mountainsView;
    UIImageView *castleView;
    NSTimer *timer;
    int step;
}

@property (nonatomic, retain) UIImage *floor;
@property (nonatomic, retain) UIImage *floor2;
@property (nonatomic, retain) UIImage *guy;
@property (nonatomic, retain) UIImage *mountains;
@property (nonatomic, retain) UIImage *castle;
@property (strong, nonatomic) IBOutlet UILabel *FirstLabel;

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)moveFloor;

-(void)fadeIn;
-(void)fadeOut;
-(void)checkStep;
-(void)updateLabel:(NSString*)update;
-(void)callSegue;

@end
