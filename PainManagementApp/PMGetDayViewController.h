//
//  PMGetDayViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 09/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMGetDayViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIPickerView *PickerView;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (assign,nonatomic)  PMMedicationModal *medication;
@property (strong, nonatomic) NSArray *pickerViewDataSource;
@property (assign , nonatomic) NSString *toSelect;
@end
