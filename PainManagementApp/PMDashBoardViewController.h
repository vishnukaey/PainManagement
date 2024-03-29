//
//  PMDashBoardViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 01/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMDashBoardViewController : UIViewController
    @property (weak, nonatomic) IBOutlet UITableView *sideMenuTableView;
@property (weak, nonatomic) IBOutlet UIView *sideMenuView;
    @property (weak, nonatomic) IBOutlet UITableView *dashBoardTableView;
@property (strong, nonatomic) IBOutlet UIView *userImage;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *complianceLabel;
@end
