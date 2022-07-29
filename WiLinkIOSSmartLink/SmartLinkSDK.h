//
//  SmartLinkSDK.h
//  WiLinkIOSSmartLink
//
//  Created by Ben Huang on 2022/7/28.
//

#import <Foundation/Foundation.h>
#import "HFSmartLink.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^SuccessBlock)(NSString *ip, NSString *mac);

@interface SmartLinkSDK : NSObject

- (void)startSmartlinkV7:(NSString *)ssid wifiPwd:(NSString *)wifiPwd processBlock:(SmartLinkProcessBlock)pblock successBlock:(SuccessBlock)sblock failBlock:(SmartLinkFailBlock)fblock endBlock:(SmartLinkEndblock)eblock;

- (void)stopSmartLinkV7;

@end

NS_ASSUME_NONNULL_END
