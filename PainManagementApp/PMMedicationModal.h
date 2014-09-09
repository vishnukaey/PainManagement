//
//  PMMedicationModal.h
//  PainManagementApp
//
//  Created by Vishnu on 05/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMMedicationModal : NSObject
    @property (weak, nonatomic) NSString *medicationName;
    @property (weak, nonatomic) NSString *medicationForm;
    @property (weak, nonatomic) NSString *reminderFrequency;
    @property (weak, nonatomic) NSString *reminderReccurence;
    @property (strong, nonatomic) NSMutableArray *reminderTimings;
    @property (strong, nonatomic) UIImage *medicationImage;
@end
