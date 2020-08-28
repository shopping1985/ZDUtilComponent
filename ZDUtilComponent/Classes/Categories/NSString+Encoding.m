//
//  NSString+Encoding.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/4/11.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "NSString+Encoding.h"

@implementation NSString (Encoding)

+(NSString *)urlEncoding:(NSString *)src{
    if (!src || ![src isKindOfClass:NSString.class] || src.length == 0) {
        return src;
    }
    //对下面的字符做编码：?!@#$^&%*+,:;='\"`<>()[]{}/\\| 包括空格、中文
    NSString *encodedString = [src stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"?!@#$^&%*+,:;='\"`<>()[]{}/\\| "].invertedSet];
    return encodedString;
}

+ (NSString *)urlDecoded:(NSString *)src {
    if (!src || ![src isKindOfClass:NSString.class] || src.length == 0) {
        return src;
    }
    NSString *decodedString = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapes(NULL, (__bridge CFStringRef)src, CFSTR(""));
    //NSString *replaceSrc = [src stringByReplacingOccurrencesOfString:@"%" withString:@""];//含有百分号的非编码过的字符串解码后返回nil，例如：分享成功！已为您提高50%中奖率
    //NSString *decodedString = [replaceSrc stringByRemovingPercentEncoding];//这个同样有效果
    return decodedString;
}
@end
