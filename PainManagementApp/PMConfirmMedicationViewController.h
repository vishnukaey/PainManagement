//
//  PMConfirmMedicationViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PMConfirmMedicationViewControllerDelegate <NSObject>
    -(void) pushToReminderViewController;
@end

@interface PMConfirmMedicationViewController : UIViewController
    @property (nonatomic, weak) id <PMConfirmMedicationViewControllerDelegate> delegate;
    @property (weak, nonatomic) IBOutlet UILabel *medicationName;
    @property (weak, nonatomic) IBOutlet UILabel *medicationForm;
    @property (weak, nonatomic) IBOutlet UIImageView *medicationImage;
    @property (weak, nonatomic) IBOutlet UIButton *confirmMedication;
    @property(assign, nonatomic) PMMedicationModal *medication;
@end
