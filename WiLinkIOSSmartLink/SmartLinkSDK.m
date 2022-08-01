//
//  SmartLinkSDK.m
//  WiLinkIOSSmartLink
//
//  Created by Ben Huang on 2022/7/28.
//

#import "SmartLinkSDK.h"
#import "HFSmartLink.h"

@implementation SmartLinkDeviceFound

@end

@interface SmartLinkSDK()

@property (nonatomic, strong) HFSmartLink *smartLinkV7;

@end

@implementation SmartLinkSDK

- (void)initSmartlink {
    [self stopSmartLink];
    self.smartLinkV7 = [HFSmartLink shareInstence];
    self.smartLinkV7.isConfigOneDevice = YES;
    self.smartLinkV7.waitTimers = 20;
}

- (void)startSmartlink:(NSString *)ssid wifiPwd:(NSString *)wifiPwd isConfigOneDeviceOnly:(BOOL)isConfigOneDeviceOnly processBlock:(ProcessBlock)pblock successBlock:(SuccessBlock)sblock failBlock:(FailureBlock)fblock endBlock:(EndBlock)eblock {
    if (self.smartLinkV7 == NULL) {
        [self initSmartlink];
    }
    if (self.smartLinkV7) {
        self.smartLinkV7.isConfigOneDevice = isConfigOneDeviceOnly;

        [self.smartLinkV7 startWithSSID:ssid Key:wifiPwd UserStr:@"" withV3x:true processblock:^(NSInteger pro) {
            pblock(pro);
        }                  successBlock:^(HFSmartLinkDeviceInfo *dev) {
            SmartLinkDeviceFound *deviceFound = [[SmartLinkDeviceFound alloc] init];
            deviceFound.ip = dev.ip;
            deviceFound.mac = dev.mac;
            sblock(deviceFound);
            
            NSLog(@"smartlink success!");
        }                     failBlock:^(NSString *failMsg) {
            fblock(failMsg);
            NSLog(@"smartlink failure : %@", failMsg);
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
        
        self.smartLinkV7 = NULL;
    }
}


@end

