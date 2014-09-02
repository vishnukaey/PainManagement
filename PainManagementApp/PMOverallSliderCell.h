//
//  PMOverallSliderCell.h
//  PainManagementApp
//
//  Created by Vishnu on 01/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ASValueTrackingSlider/ASValueTrackingSlider.h>

@interface PMOverallSliderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet ASValueTrackingSlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *description;

@end
