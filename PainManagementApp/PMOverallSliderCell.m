//
//  PMOverallSliderCell.m
//  PainManagementApp
//
//  Created by Vishnu on 01/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMOverallSliderCell.h"

@implementation PMOverallSliderCell

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
}

- (NSString *)slider:(ASValueTrackingSlider *)slider stringForValue:(float)value;
{
    value = roundf(value);
    NSString *s;
    if(value == 0){
        s= @"No pain";
    } else if (value < 25) {
        s = @"Mild Pain";
    } else if (value > 25 && value < 50.0) {
        s = @"Moderate Pain";
    } else if (value >= 50.0 && value < 75) {
        s = @"Intense Pain!";
    }else
        s= @"Chronic pain !";
    return s;
}

@end
