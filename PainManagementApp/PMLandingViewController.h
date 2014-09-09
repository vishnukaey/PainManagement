//
//  PMLandingViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 09/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LandingViewDelegate <NSObject>
-(void) performSegueToMedicationViewController;
-(void) performSegueToPainManagementViewController;
-(void) performSegueToAppoinmentsViewController;
@end

@interface PMLandingViewController : UIViewController
@property (weak,nonatomic) id <LandingViewDelegate> delegate;
@end
