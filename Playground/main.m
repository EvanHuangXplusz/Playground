//
//  main.m
//  Playground
//
//  Created by Paul Colton on 10/23/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PXAppDelegate.h"
#import <PXEngine/PXEngine.h>
#import "../../License.h"

int main(int argc, char *argv[])
{
    @autoreleasepool
    {
        [PXEngine licenseKey:@PX_LICENSE_KEY forUser:@PX_LICENSE_USER];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([PXAppDelegate class]));
    }
}
