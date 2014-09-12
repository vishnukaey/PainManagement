//
//  PMSignInViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 11/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SignInDelegate <NSObject>
-(void) saveMyMedications;
@end

@interface PMSignInViewController : UIViewController
@property (weak, nonatomic) id <SignInDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@end
