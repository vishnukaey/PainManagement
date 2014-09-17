//
//  ConfirmView.h
//  PainManagementApp
//
//  Created by Vishnu on 10/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ConfirmMedicationViewDelegate <NSObject>
    -(void) pushToReminderViewController;
@end

@interface ConfirmView : UIView
    @property (nonatomic, weak) id <ConfirmMedicationViewDelegate> delegate;
    @property (weak, nonatomic) IBOutlet UILabel *medicationName;
    @property (weak, nonatomic) IBOutlet UILabel *medicationForm;
    @property (weak, nonatomic) IBOutlet UIButton *confirmMedication;
    @property (weak, nonatomic) IBOutlet UIPageControl *pageController;
    @property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
    @property  (weak, nonatomic) NSArray *imagesArray;
+ (id)initFromNib;
@end
