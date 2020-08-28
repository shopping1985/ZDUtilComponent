//
//  NSString+Encoding.h
//  BeautifulDay
//
//  Created by linxiaoping on 2020/4/11.
//  Copyright © 2020 yagu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Encoding)
+(NSString*)urlEncoding:(NSString*)src;
+ (NSString *)urlDecoded:(NSString *)encodedString;
@end

NS_ASSUME_NONNULL_END
