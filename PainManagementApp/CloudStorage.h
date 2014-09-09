//
//  CloudStorage.h
//  SampleServerDemo
//
//  Created by Vishnu on 21/08/14.
//  Copyright (c) 2014 Vishnu. All rights reserved.
//


typedef void (^Success)(NSArray *array);
typedef void (^Failure)(NSError *error);

@interface CloudStorage : NSObject <NSURLConnectionDataDelegate>

    @property (strong, nonatomic) Success successRequestCallBack;
    @property (nonatomic, strong) Failure failureCallback;

    - (void )getRequest:(NSString *)queryString requestSucceeded:(void (^)(NSArray *array))success requestFailed:(void (^)(NSError *error))failure;
@end
