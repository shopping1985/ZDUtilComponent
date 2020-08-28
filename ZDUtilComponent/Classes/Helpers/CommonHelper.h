//
//  CommonHelper.h
//  BeautifulDay
//
//  Created by chenergui on 2019/12/21.
//  Copyright © 2019 yagu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommonHelper : NSObject

+ (NSString *)nullToString:(id)string;

/**
 获取url的所有参数
 @param url 需要提取参数的url
 @return NSDictionary
 */
+(NSDictionary *) parameterWithURL:(NSURL *) url;

+ (CGFloat)getStringHeightWithText:(NSString *)text font:(UIFont *)font viewWidth:(CGFloat)width;

+ (CGFloat)getStringWidthWithText:(NSString *)text font:(UIFont *)font;

+ (NSString*)getFileMD5WithPath:(NSString*)path;

///格式化数量
///<10000：返回对应数量
///>=10000：返回1万、1.5万、10万等等
+(NSString*)formatCount:(long)count;
@end

NS_ASSUME_NONNULL_END
