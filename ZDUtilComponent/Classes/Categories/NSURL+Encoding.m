//
//  NSURL+Encoding.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/5/29.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "NSURL+Encoding.h"

@implementation NSURL (Encoding)

+(void)load{
    Method m1 = class_getClassMethod(NSClassFromString(@"NSURL"), @selector(URLWithString:));
    Method m11 = class_getClassMethod(self, @selector(URLWithStringPercentEncoding:));
    method_exchangeImplementations(m1, m11);
    //测试代码
    //NSString *str = @"http://bos.pgzs.com/wscdn/assistant/wyx/pc/{7}5#.p^ic_（007）08【100】09[hd]副本 (2020-07-01).jpg?w=828&h=828&title=淘宝，面膜";
    //[self URLWithString:str];
}

#pragma mark 替换的方法
+(instancetype)URLWithStringPercentEncoding:(NSString *)URLString{
    NSURL *ret = [self encodingURL:URLString];
    return ret;
}

#pragma mark 私有方法
+(instancetype)encodingURL:(NSString *)URLString{
    if (!URLString || ![URLString isKindOfClass:NSString.class] || URLString.length == 0) {
        return nil;
    }
    
    NSURL *urlObj = [self URLWithStringPercentEncoding:URLString];//调用被替换的api
    if (urlObj) {
        return urlObj;
    }
    /**
     常用的NSCharacterSet
     URLFragmentAllowedCharacterSet  "#%<>[\]^`{|}
     URLHostAllowedCharacterSet      "#%/<>?@\^`{|}
     URLPasswordAllowedCharacterSet  "#%/:<>?@[\]^`{|}
     URLPathAllowedCharacterSet      "#%;<>?[\]^`{|}
     URLQueryAllowedCharacterSet     "#%<>[\]^`{|}
     URLUserAllowedCharacterSet      "#%/:<>?@[\]^`
     */
    /**
     stringByAddingPercentEncodingWithAllowedCharacters api
     Returns a new string made from the receiver by replacing all characters not in the allowedCharacters set with percent encoded characters. UTF-8 encoding is used to determine the correct percent encoded characters. Entire URL strings cannot be percent-encoded. This method is intended to percent-encode an URL component or subcomponent string, NOT the entire URL string. Any characters in allowedCharacters outside of the 7-bit ASCII range are ignored.
     百度翻译
     通过将allowedCharacters集中不包含的所有字符替换为百分比编码字符，返回从接收器生成的新字符串。UTF-8编码用于确定编码字符的正确百分比。不能对整个URL字符串进行百分比编码。此方法旨在对URL组件或子组件字符串（而不是整个URL字符串）进行百分比编码。将忽略7位ASCII范围之外的允许字符中的任何字符。
     */
     //例子：http://bos.pgzs.com/wscdn/assistant/wyx/pc/{7}5#.p^ic_（007）08【100】09[hd]副本 (2020-07-01).jpg?w=828&h=828&title=淘宝，面膜
     //编码：http://bos.pgzs.com/wscdn/assistant/wyx/pc/%7B7%7D5%23.p%5Eic_%EF%BC%88007%EF%BC%8908%E3%80%90100%E3%80%9109%5Bhd%5D%E5%89%AF%E6%9C%AC%20(2020-07-01).jpg?w=828&h=828&title=%E6%B7%98%E5%AE%9D%EF%BC%8C%E9%9D%A2%E8%86%9C
    NSString *strEncoded = [URLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    urlObj = [self URLWithStringPercentEncoding:strEncoded];//调用被替换的api
    return urlObj;
}
@end
