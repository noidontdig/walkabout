//
//  FPAppDelegate.h
//  FinalProject
//
//  Created by Alexandra Qin on 5/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface FPAppDelegate : UIResponder <UIApplicationDelegate> {
    AVAudioPlayer *audioPlayer;
}

@property (strong, nonatomic) UIWindow *window;

-(void)SetupSound;

@end
