//
//  PMCouponedMedicationCell.h
//  PainManagementApp
//
//  Created by Vishnu on 16/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMCouponedMedicationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *nurseNavigation;
@property (weak, nonatomic) IBOutlet UILabel *medicationName;
@property (weak, nonatomic) IBOutlet UIImageView *coupon;
@end
