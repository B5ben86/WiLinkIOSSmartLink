//
//  SmartLinkSDK.h
//  WiLinkIOSSmartLink
//
//  Created by Ben Huang on 2022/7/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ProcessBlock)(NSInteger progress);
typedef void(^SuccessBlock)(NSString *ip, NSString *mac);
typedef void(^FailureBlock)(NSString *msg);
typedef void(^EndBlock)(void);

@interface SmartLinkSDK : NSObject

- (void)startSmartlink:(NSString *)ssid wifiPwd:(NSString *)wifiPwd processBlock:(ProcessBlock)pblock successBlock:(SuccessBlock)sblock failBlock:(FailureBlock)fblock endBlock:(EndBlock)eblock;

- (void)stopSmartLink;

@end

NS_ASSUME_NONNULL_END
