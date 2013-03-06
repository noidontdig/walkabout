//
//  Story1ViewController.h
//  FinalProject
//
//  Created by Alexandra Qin on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Story1ViewController : UIViewController {
    
    UIImageView* personView;
    int t;
    int personWidth;
    int personHeight;
    int lWidth;
    int lHeight;
    int centerX;
    int centerY;

}
@property (strong, nonatomic) IBOutlet UILabel *FirstLabel;
@property (nonatomic, retain) UIImage* personImage;
@property (nonatomic, retain) UIImage* guy;

-(void)fadeIn:(UIView*)view;
-(void)fadeOut:(UIView*)view;
-(void)updateFirstLabel:(NSString*)update;
-(void)changeGuy;
-(void)makeSmall;
-(void)callSegue;

@end
