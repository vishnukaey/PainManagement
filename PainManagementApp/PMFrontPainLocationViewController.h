//
//  PMFrontPainLocationViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PMFrontPainLocationViewControllerDelegate <NSObject>
    -(void) manageOverallPain;
@end

@interface PMFrontPainLocationViewController : UIViewController
@property (nonatomic, weak) id <PMFrontPainLocationViewControllerDelegate> delegate;
@end
