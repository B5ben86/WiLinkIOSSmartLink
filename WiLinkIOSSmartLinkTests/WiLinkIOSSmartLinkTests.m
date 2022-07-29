//
//  WiLinkIOSSmartLinkTests.m
//  WiLinkIOSSmartLinkTests
//
//  Created by Ben Huang on 2022/7/28.
//

#import <XCTest/XCTest.h>
#import "WiLinkIOSSmartLink/SmartLinkSDK.h"

@interface WiLinkIOSSmartLinkTests : XCTestCase

@end

@implementation WiLinkIOSSmartLinkTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *ssid = @"SENTRAY";
    NSString *pwd = @"whsentray";
    
    [[[SmartLinkSDK alloc]init] startSmartlink:ssid wifiPwd:pwd processBlock:^(NSInteger progress) {
        NSLog(@"progress : %ld", (long)progress);
        } successBlock:^(NSString * _Nonnull ip, NSString * _Nonnull mac) {
            NSLog(@"succeed : ip : %@ , mac : %@", ip, mac);
        } failBlock:^(NSString * _Nonnull msg) {
            NSLog(@"failure : %@", msg);
        } endBlock:^{
            NSLog(@"end");
        }];
    
    sleep(1000);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        
    }];
}

@end
