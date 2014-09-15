//
//  PMFrequencyPickerView.h
//  PainManagementApp
//
//  Created by Vishnu on 15/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMFrequencyPickerView : UIView
    @property (weak, nonatomic) IBOutlet UITableView *frequencyTable;
    @property (weak, nonatomic) IBOutlet UITableView *reccurenceTable;
    @property (weak, nonatomic) IBOutlet UIView *containerView;
    @property (weak, nonatomic) IBOutlet UIView *selectionView;
@end
