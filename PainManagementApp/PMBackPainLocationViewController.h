//
//  PMBackPainLocationViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PainRecorderDelegate <NSObject>

-(void) goToOverallViewController;

@end

@interface PMBackPainLocationViewController : UIViewController
@property (weak, nonatomic) id <PainRecorderDelegate> delegate;

@end
