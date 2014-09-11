//
//  PMDataHandler.m
//  PainManagementApp
//
//  Created by Vishnu on 11/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMDataHandler.h"

@implementation PMDataHandler{
    NSMutableData *responseData;
    NSString *requestMethodType;
}

#pragma mark - Overridden Methods

- (void )getRequest:(NSString *)queryString requestSucceeded:(void (^)(NSArray *array))success requestFailed:(void (^)(NSError *error))failure{
    
    NSLog(@"GET - CLOUD");
    self.successRequestCallBack = success;
    self.failureCallback = failure;
    [self sendGetRequest:queryString ofType:@"GET"];
}


#pragma mark - Helping Methods
-(void) sendGetRequest:(NSString*)queryString ofType:(NSString*)methodType{
    requestMethodType = methodType;
    NSMutableString *query = [[NSMutableString alloc] initWithString:@"http://10.3.0.145:9000/Sample3/PainMedication"];
    responseData = [[NSMutableData alloc] init];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                                    [NSURL URLWithString:query]];
    [request setHTTPMethod:methodType];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(!conn){
        NSLog(@"No Connection");
    }
}

#pragma mark - NSURL delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [responseData setLength:0];
    NSLog(@"Resposnse Received");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
    NSLog(@"Data Received");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError %@",error);
    self.failureCallback(error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
    NSLog(@"Succeeded! Received %d bytes of data",[responseData length]);
    if([responseData length] != 0){
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:Nil];
        self.successRequestCallBack(array);
    }
}

@end
