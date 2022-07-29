//
//  SmartLinkSDK.m
//  WiLinkIOSSmartLink
//
//  Created by Ben Huang on 2022/7/28.
//

#import "SmartLinkSDK.h"
#import "HFSmartLink.h"

@interface SmartLinkSDK()

@property(nonatomic, retain) NSString *ssid;
@property(nonatomic, retain) NSString *pwd;
@property(nonatomic, retain) NSString *ip;
@property (nonatomic, strong) NSString *macNew;
@property (nonatomic, strong) HFSmartLink *smartLinkV7;

@end

@implementation SmartLinkSDK

- (void)initSmartlink {
    NSLog(@"初始化 Smartlink");
    self.smartLinkV7 = [HFSmartLink shareInstence];
    [self stopSmartLink];

    self.smartLinkV7.isConfigOneDevice = YES;
    self.smartLinkV7.waitTimers = 20;
    NSLog(@"初始化 Smartlink 结束");
}

- (void)startSmartlink:(NSString *)ssid wifiPwd:(NSString *)wifiPwd processBlock:(ProcessBlock)pblock successBlock:(SuccessBlock)sblock failBlock:(FailureBlock)fblock endBlock:(EndBlock)eblock {
    if (self.smartLinkV7 == NULL) {
        [self initSmartlink];
    }
    if (self.smartLinkV7) {
        self.ip = @"";
        self.macNew = @"";

        [self.smartLinkV7 startWithSSID:ssid Key:self.pwd UserStr:@"" withV3x:true processblock:^(NSInteger pro) {
            
            pblock(pro);
        }                  successBlock:^(HFSmartLinkDeviceInfo *dev) {
            self.ip = dev.ip;
            self.macNew = dev.mac;

            dispatch_async(dispatch_get_main_queue(), ^{
                sblock(self.ip, self.macNew);
                NSLog(@"smartlink success!");
            });
        }                     failBlock:^(NSString *failMsg) {
            dispatch_async(dispatch_get_main_queue(), ^{
                fblock(failMsg);
                NSLog(@"smartlink failure : %@", failMsg);
            });
        }                      endBlock:^(NSDictionary *deviceDic) {
            [self stopSmartLink];
            eblock();
        }];
    }
}

- (void)stopSmartLink {
    if (self.smartLinkV7) {
        [self.smartLinkV7 stopWithBlock:^(NSString *stopMsg, BOOL isOk) {
        }];

        [self.smartLinkV7 closeWithBlock:^(NSString *closeMsg, BOOL isOK) {
        }];
    }
}


@end

