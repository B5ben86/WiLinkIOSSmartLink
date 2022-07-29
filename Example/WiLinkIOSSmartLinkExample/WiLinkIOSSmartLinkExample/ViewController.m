//
//  ViewController.m
//  WiLinkIOSSmartLinkExample
//
//  Created by Ben Huang on 2022/7/29.
//

#import "ViewController.h"
#import <WiLinkIOSSmartLink/SmartLinkSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
}


@end
