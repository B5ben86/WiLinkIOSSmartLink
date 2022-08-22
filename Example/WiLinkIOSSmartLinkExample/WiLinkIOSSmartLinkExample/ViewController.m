//
//  ViewController.m
//  WiLinkIOSSmartLinkExample
//
//  Created by Ben Huang on 2022/7/29.
//

#import "ViewController.h"
#import <WiLinkIOSSmartLink/SmartLinkSDK.h>

@interface ViewController ()

@property (nonatomic, strong) SmartLinkSDK *smartLinkSDK;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.smartLinkSDK = [[SmartLinkSDK alloc] init];
}

- (IBAction)startButtonAction:(id)sender {
    
    if (self.smartLinkSDK != NULL) {
        NSString *ssid = @"SENTRAY";
        NSString *pwd = @"whsentray";
        
        [self.smartLinkSDK startSmartlink:ssid wifiPwd:pwd isConfigOneDeviceOnly:TRUE timeoutSeconds:20 processBlock:^(NSInteger progress) {
                    
                } successBlock:^(SmartLinkDeviceFound * _Nonnull deviceFound) {
                    NSLog(@"SmartLink Success : %@ : %@", deviceFound.mac, deviceFound.ip);
                } failBlock:^(NSString * _Nonnull failureMessage) {
                    NSLog(@"SmartLink Failure : %@", failureMessage);
                } endBlock:^{
                    NSLog(@"SmartLink End");
                }];
    }
}

@end
