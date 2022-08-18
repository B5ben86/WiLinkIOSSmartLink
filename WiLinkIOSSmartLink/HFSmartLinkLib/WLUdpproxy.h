//
//  udpproxy.h
//  smartlinklib_7x
//
//  Created by Peter on 16/5/20.
//  Copyright © 2016年 Peter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLHFSmartLinkDeviceInfo.h"

@interface WLUdpproxy : NSObject

+(instancetype)shareInstence;
-(void)CreateBindSocket;
-(void)send:(char*)shit;
-(void)sendMCast:(char*)shit withAddr:(char *)addr andSN:(int)sn;
-(void)sendSmartLinkFind;
//-(WLHFSmartLinkDeviceInfo *)recv;
-(WLHFSmartLinkDeviceInfo *)recv:(unsigned char)random;
-(void)close;

@end
