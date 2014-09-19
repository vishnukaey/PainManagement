//
//  PMStep2PainManagerViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 19/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Step2VCDelegate <NSObject>

-(void) goTopainRecorder;

@end



@interface PMStep2PainManagerViewController : UIViewController
@property (weak,nonatomic) id <Step2VCDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
