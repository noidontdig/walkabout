//
//  ViewController5a.h
//  FinalProject
//
//  Created by Alexandra Qin on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController5a : UIViewController {
    
    int step;
    NSTimer *timer;
    UIImageView *guyView;
    UIImageView *floorView;
    UIImageView *seaView;
    UIImageView *mountainsView;
}

@property (nonatomic,retain) UIImage *mountains;
@property (nonatomic,retain) UIImage *guy;
@property (nonatomic,retain) UIImage *floor;
@property (nonatomic,retain) UIImage *sea;
@property (strong, nonatomic) IBOutlet UILabel *FirstLabel;

@end
