//
//  VectorGraphicsPreview.m
//  Playground
//
//  Created by Paul Colton on 12/17/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import "VectorGraphicsPreview.h"
#import "VectorGraphicsController.h"
#import <PXEngine/PXEngine.h>

@implementation VectorGraphicsPreview
{
    NSTimer *timer;
    VectorGraphicsController *previewController_;
    float angle_;
}

- (void) initializeCustomController
{
    angle_ = 0.0f;
    
    previewController_ = [[VectorGraphicsController alloc] initWithNibName:@"VectorGraphicsPreview" bundle:nil];

    /*
    // Stop any already running timers
    [timer invalidate];
    
    // Start the timer that randomly updates the sliders
    timer = [NSTimer scheduledTimerWithTimeInterval:.1
                                             target:self
                                           selector:@selector(updateGearRotation)
                                           userInfo:nil
                                            repeats:YES];
     */
}

-(UIView *)previewView
{
    return previewController_.view;
}

-(void)updateGearRotation
{
    if((angle_ += 1.0) > 360) { angle_ = 0.0f; }
    
    previewController_.view.styleCSS = [NSString stringWithFormat: @"transform: rotate(%f)", angle_];

    // We use a beta function here to improve performance. It restyles a single view. Use at your own
    // risk as it is currently not supported.
    [[NSNotificationCenter defaultCenter] postNotificationName:kPXUpdateStyleNotification
                                                        object:previewController_.view];
}

-(void)dealloc
{
    [timer invalidate];

}

@end
