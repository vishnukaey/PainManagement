//
//  PMFrequencyViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 03/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMFrequencyViewController : UIViewController
    @property (weak, nonatomic) IBOutlet UILabel *frequencyLabel;
    @property (weak, nonatomic) IBOutlet UILabel *reccurenceLabel;
    @property (assign,nonatomic)  PMMedicationModal *medication;
    @property (weak, nonatomic) IBOutlet UITableView *frequencyTable;
    @property (weak, nonatomic) IBOutlet UITableView *reccurenceTable;
@property (weak, nonatomic) IBOutlet UIView *selectionView;

@property (weak, nonatomic) IBOutlet UIView *containerView;


@end
