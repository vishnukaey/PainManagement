//
//  PMSampleCollectionViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 10/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMSampleCollectionViewController : UIViewController
    @property (weak, nonatomic) IBOutlet UITableView *frequencyTable;
    @property (weak, nonatomic) IBOutlet UITableView *reccurenceTable;
    @property (weak, nonatomic) IBOutlet UIView *selectionView;
@end
