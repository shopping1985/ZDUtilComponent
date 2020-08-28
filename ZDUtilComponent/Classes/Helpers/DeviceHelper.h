//
//  DeviceHelper.h
//
//  Created by yagu on 2019/9/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface DeviceHelper : NSObject

+ (NSString*)getDeviceModel;
+ (BOOL)isPhoneXSMAX;
+ (BOOL)isPhone5S;
+ (BOOL)isPhoneXAfter;
/*
 * 是否是刘海屏
 * */
+ (BOOL) isHairHead;

@end

NS_ASSUME_NONNULL_END
