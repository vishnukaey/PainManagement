//
//  PMDataHandler.h
//  PainManagementApp
//
//  Created by Vishnu on 11/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Success)(NSArray *array);
typedef void (^Failure)(NSError *error);

@interface PMDataHandler : NSObject

@property (strong, nonatomic) Success successRequestCallBack;
@property (nonatomic, strong) Failure failureCallback;

- (void )getRequest:(NSString *)queryString requestSucceeded:(void (^)(NSArray *array))success requestFailed:(void (^)(NSError *error))failure;

@end
