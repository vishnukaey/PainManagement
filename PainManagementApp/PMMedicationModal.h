//
//  PMMedicationModal.h
//  PainManagementApp
//
//  Created by Vishnu on 05/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMMedicationModal : NSObject
    @property (strong, nonatomic) NSString *medicationName;
    @property (strong, nonatomic) NSString *medicationForm;
    @property (strong, nonatomic) NSString *reminderFrequency;
    @property (strong, nonatomic) NSString *reminderReccurence;
    @property (strong, nonatomic) NSMutableArray *days;
    @property (strong, nonatomic) NSMutableArray *reminderTimings;
    @property (strong, nonatomic) UIImage *medicationImage;
@end
