//
//  PMCouponedMedicationCell.m
//  PainManagementApp
//
//  Created by Vishnu on 16/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMCouponedMedicationCell.h"

@implementation PMCouponedMedicationCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    self.nurseNavigation.layer.cornerRadius = self.nurseNavigation.frame.size.height /2;
    self.nurseNavigation.layer.masksToBounds = YES;
   self.nurseNavigation.layer.borderWidth = 0;

    // Configure the view for the selected state
}

@end
