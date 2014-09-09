//
//  PMPhysicianCell.h
//  PainManagementApp
//
//  Created by Vishnu on 09/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PhysicianCellDelegate <NSObject>

-(void) performSegueForPhysician:(NSString *) physician;

@end

@interface PMPhysicianCell : UITableViewCell
@property (weak,nonatomic) id <PhysicianCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *physicianName;
@property (weak, nonatomic) IBOutlet UILabel *physicianSpecialization;
@property (weak, nonatomic) IBOutlet UILabel *physicianAddress;

@end
