//
//  CommonHelper.m
//  BeautifulDay
//
//  Created by chenergui on 2019/12/21.
//  Copyright © 2019 yagu. All rights reserved.
//

#import "CommonHelper.h"
#include <CommonCrypto/CommonDigest.h>
#define FileHashDefaultChunkSizeForReadingData 1024*8

@implementation CommonHelper

+ (NSString *)nullToString:(id)string {
    if ([string isEqual:@"NULL"] || [string isKindOfClass:[NSNull class]] || [string isEqual:[NSNull null]] || [string isEqual:NULL] || [[string class] isSubclassOfClass:[NSNull class]] || string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 || [string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"]) {
        return @"";
    } else if([string isKindOfClass:[NSString class]] ) {
        return (NSString *)string;
    }else
        return @"";
}

/**
 获取url的所有参数
 @param url 需要提取参数的url
 @return NSDictionary
 */
+(NSDictionary *) parameterWithURL:(NSURL *) url {
 
    NSMutableDictionary *parm = [[NSMutableDictionary alloc]init];
    
    if (url) {
        //传入url创建url组件类
        NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:url.absoluteString];
     
        //回调遍历所有参数，添加入字典
        [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [parm setObject:obj.value forKey:obj.name];
        }];
    }
    return parm;

}

+ (CGFloat)getStringHeightWithText:(NSString *)text font:(UIFont *)font viewWidth:(CGFloat)width {
    if(text == nil || [text isKindOfClass:[NSNull class]]){
        return 0;
    }
    NSDictionary *attrs = @{NSFontAttributeName :font};
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;
    
    return  ceilf(size.height);
}

+ (CGFloat)getStringWidthWithText:(NSString *)text font:(UIFont *)font
{
    if(text == nil || [text isKindOfClass:[NSNull class]]){
          return 0;
      }
    NSDictionary *attrs = @{NSFontAttributeName :font};
    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;
    
    return  ceilf(size.width);
}

+ (NSString*)getFileMD5WithPath:(NSString*)path
{
    return (__bridge_transfer NSString *)FileMD5HashCreateWithPath((__bridge CFStringRef)path, FileHashDefaultChunkSizeForReadingData);
}

CFStringRef FileMD5HashCreateWithPath(CFStringRef filePath,size_t chunkSizeForReadingData)
{
    // Declare needed variables
    
    CFStringRef result = NULL;
    
    CFReadStreamRef readStream = NULL;
    
    // Get the file URL
    
    CFURLRef fileURL =
    
    CFURLCreateWithFileSystemPath(kCFAllocatorDefault,
                                  
                                  (CFStringRef)filePath,
                                  
                                  kCFURLPOSIXPathStyle,
                                  
                                  (Boolean)false);
    
    if (!fileURL) goto done;
    
    // Create and open the read stream
    
    readStream = CFReadStreamCreateWithFile(kCFAllocatorDefault,
                                            
                                            (CFURLRef)fileURL);
    
    if (!readStream) goto done;
    
    bool didSucceed = (bool)CFReadStreamOpen(readStream);
    
    if (!didSucceed) goto done;
    
    // Initialize the hash object
    
    CC_MD5_CTX hashObject;
    
    CC_MD5_Init(&hashObject);
    
    // Make sure chunkSizeForReadingData is valid
    
    if (!chunkSizeForReadingData)
    {
        chunkSizeForReadingData = FileHashDefaultChunkSizeForReadingData;
    }
    
    // Feed the data to the hash object
    
    bool hasMoreData = true;
    
    while (hasMoreData)
    {
        uint8_t buffer[chunkSizeForReadingData];
        
        CFIndex readBytesCount = CFReadStreamRead(readStream,(UInt8 *)buffer,(CFIndex)sizeof(buffer));
        
        if (readBytesCount == -1) break;
        
        if (readBytesCount == 0)
        {
            hasMoreData = false;
            continue;
        }
        
        CC_MD5_Update(&hashObject,(const void *)buffer,(CC_LONG)readBytesCount);
    }
    
    // Check if the read operation succeeded
    
    didSucceed = !hasMoreData;
    
    // Compute the hash digest
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5_Final(digest, &hashObject);
    
    // Abort if the read operation failed
    
    if (!didSucceed) goto done;
    
    // Compute the string result
    
    char hash[2 * sizeof(digest) + 1];
    
    for (size_t i = 0; i < sizeof(digest); ++i)
    {
        snprintf(hash + (2 * i), 3, "%02x", (int)(digest[i]));
    }
    
    result = CFStringCreateWithCString(kCFAllocatorDefault,(const char *)hash,kCFStringEncodingUTF8);
    
done:
    
    if (readStream)
    {
        CFReadStreamClose(readStream);
        CFRelease(readStream);
    }
    
    if (fileURL)
    {
        CFRelease(fileURL);
    }
    
    return result;
    
}

#pragma mark 数量格式化
+(NSString*) calculateCount:(long)count compare:(long)level unit:(NSString*)unit withLowLevel:(BOOL)withLowLevel{
    NSString *str = @"";
    if(count >= level){
        long sum1 = count / level;
        long remainder = count % level;
        long lowLevel = level / 10;
        if (withLowLevel && remainder >= lowLevel) {
            NSInteger sum2 = remainder / lowLevel;
            if(sum2 > 0){
                str = [NSString stringWithFormat:@"%ld.%ld%@", sum1, (long)sum2, unit];
                return str;
            }
        }
        str = [NSString stringWithFormat:@"%ld%@", sum1, unit];
        return str;
    }
    return [NSString stringWithFormat:@"%ld%@", (long)count, unit];
}
///格式化数量
///<10000：返回对应数量
///>=10000：返回1万、1.5万、10万等等
+(NSString*)formatCount:(long)count{
    if(count >= 10000){//万
        return [self calculateCount:count compare:10000 unit:@"万" withLowLevel:YES];
    }
    return [NSString stringWithFormat:@"%ld", (long)count];
}
@end
