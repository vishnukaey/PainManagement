//
//  PMFrontPainLocationViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "Utilities.h"
#import <Foundation/Foundation.h>

@implementation Utilities

+ (void) showAlert:(NSString *)message withTitle:(NSString *)title {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:title
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}

@end
