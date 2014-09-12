//
//  PMOsteoMedication.h
//  PainManagementApp
//
//  Created by Vishnu on 12/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMOsteoMedication : NSObject
@property (strong, nonatomic) NSString *medicationName;
@property (strong, nonatomic) NSString *lastReminder;
@property (strong, nonatomic) NSString *nextReminder;
@end
