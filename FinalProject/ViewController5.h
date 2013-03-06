//
//  ViewController5.h
//  FinalProject
//
//  Created by Alexandra Qin on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController5 : UIViewController

{
    
    UIImageView *starsView;
    UIImageView *waveView1;
    UIImageView *boatView;
    UIImageView *flawView1;
    UIImageView *flawView2;
    UIImageView *flawView3;
}

@property (nonatomic, retain) UIImage* starsBG;
@property (nonatomic, retain) UIImage* waves1;
@property (nonatomic, retain) UIImage* boat;
@property (nonatomic, retain) UIImage* flaw1;
@property (nonatomic, retain) UIImage* flaw2;
@property (nonatomic, retain) UIImage* flaw3;
@property (nonatomic, retain) UIImage* merit;
@property (strong, nonatomic) IBOutlet UILabel *FirstLabel;

-(void)movingWaves;
-(void)movingWaves2;
-(void)callSegue;
-(void)fadeIn;
-(void)fadeOut;
-(void)updateLabel:(NSString*)update;
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
-(void)attackFirst;
-(void)attackSecond;
-(void)attackThird;
-(void)attack1;
-(void)attack2;
-(void)attack3;
-(void)attackMove;

@end

