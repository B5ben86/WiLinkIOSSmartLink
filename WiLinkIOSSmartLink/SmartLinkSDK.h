//
//  SmartLinkSDK.h
//  WiLinkIOSSmartLink
//
//  Created by Ben Huang on 2022/7/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SmartLinkDeviceFound : NSObject

@property (nonatomic, strong) NSString* ip;
@property (nonatomic, strong) NSString* mac;

@end

typedef void(^ProcessBlock)(NSInteger progress);
typedef void(^SuccessBlock)(SmartLinkDeviceFound *deviceFound);
typedef void(^FailureBlock)(NSString *failureMessage);
typedef void(^EndBlock)(void);
//typedef void(^EndBlock)(NSArray<SmartLinkDeviceFound *> *deviceFoundList);
//typedef void(^EndBlock)(NSDictionary<NSString *, SmartLinkDeviceFound *> *deviceFoundMap);


@interface SmartLinkSDK : NSObject

- (void)startSmartlink:(NSString *)ssid wifiPwd:(NSString *)wifiPwd isConfigOneDeviceOnly:(BOOL)isConfigOneDeviceOnly processBlock:(ProcessBlock)pblock successBlock:(SuccessBlock)sblock failBlock:(FailureBlock)fblock endBlock:(EndBlock)eblock;

- (void)stopSmartLink;

@end

NS_ASSUME_NONNULL_END
