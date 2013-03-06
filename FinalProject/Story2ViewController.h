//
//  Story2ViewController.h
//  FinalProject
//
//  Created by Alexandra Qin on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Story2ViewController : UIViewController{
    
    UIImageView *starsView;
    UIImageView *waveView1;
    UIImageView *waveView2;
    UIImageView *boatView;
}

@property (nonatomic, retain) UIImage* starsBG;
@property (nonatomic, retain) UIImage* waves1;
@property (nonatomic, retain) UIImage* waves2;
@property (nonatomic, retain) UIImage* boat;
@property (strong, nonatomic) IBOutlet UILabel *FirstLabel;

-(void)movingWaves;
-(void)movingWaves2;
-(void)callSegue;
-(void)fadeIn;
-(void)fadeOut;
-(void)updateLabel:(NSString*)update;

@end
