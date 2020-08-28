//
//  NSDictionary+TypeCheck.h
//  BeautifulDay
//  用途：代替NSDictionary的objectForKey和valueForKey
//  规避key不存在返回nil、返回对象的类型不是想要的类型
//  返回默认值或空字典、空数组，不返回nil
//  Created by linxiaoping on 2020/3/26.
//  Copyright © 2020 yagu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (TypeCheck)

-(NSString*)stringObjectForKey:(NSString*)key;
-(int)intObjectForKey:(NSString*)key;
-(long)longObjectForKey:(NSString*)key;
-(long long)longLongObjectForKey:(NSString*)key;
-(float)floatObjectForKey:(NSString*)key;
-(BOOL)boolObjectForKey:(NSString*)key;
-(NSArray*)arrayObjectForKey:(NSString*)key;
-(NSDictionary*)dictionayObjectForKey:(NSString*)key;

-(NSString*)stringValueForKey:(NSString*)key;
-(int)intValueForKey:(NSString*)key;
-(long)longValueForKey:(NSString*)key;
-(long long)longLongValueForKey:(NSString*)key;
-(float)floatValueForKey:(NSString*)key;
-(BOOL)boolValueForKey:(NSString*)key;
-(NSArray*)arrayValueForKey:(NSString*)key;
-(NSDictionary*)dictionayValueForKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
