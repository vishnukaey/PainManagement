//
//  PMPhysicianCell.m
//  PainManagementApp
//
//  Created by Vishnu on 09/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMPhysicianCell.h"

@implementation PMPhysicianCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (IBAction)addAppointment:(id)sender {
    [self.delegate performSegueForPhysician:self.physicianName.text];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
