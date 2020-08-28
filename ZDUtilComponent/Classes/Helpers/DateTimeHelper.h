//
//  DateTimeHelper.h
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/4.
//  Copyright © 2020 yagu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateTimeHelper : NSObject

+(NSString*)dateFromTimeString:(NSString*)str;
+(NSString*)customDateFromTimeString:(NSString*)str;
+ (BOOL)isToday:(NSString*)str;
+ (BOOL)isYesterday:(NSString*)str;
+ (BOOL)isThisYear:(NSString*)str;
@end

NS_ASSUME_NONNULL_END
