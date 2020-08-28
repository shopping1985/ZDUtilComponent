//
//  CheckNSNullHelper.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/28.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "CheckNSNullHelper.h"

@implementation CheckNSNullHelper

#pragma mark public method
//递归对象
+(id)recurseChange:(id)obj defaultType:(Class)class{
    
    if ([obj isKindOfClass:NSDictionary.class]) {
        return [self recurseDictionary:obj];
    }
    else if ([obj isKindOfClass:NSArray.class]) {
        return [self recurseArray:obj];
    }
    else if ([obj isKindOfClass:NSString.class]){
        return [self changeString:obj];
    }
    else if ([obj isKindOfClass:NSNull.class])  {
        return [self changeNullToClassDefault:class];
    }
    
    return obj;
}

#pragma mark private method
//递归字典
+(NSDictionary*)recurseDictionary:(NSDictionary*)dict{
    
    NSMutableDictionary *mutDict = [NSMutableDictionary new];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        Class defaultType = NSDictionary.class;//默认字典类型
        if ([obj isKindOfClass:NSNull.class] && [key isKindOfClass:NSString.class]) {
            NSString *strKey = key;
            if ([strKey rangeOfString:@"count" options:NSCaseInsensitiveSearch].location != NSNotFound ||
                [strKey rangeOfString:@"price" options:NSCaseInsensitiveSearch].location != NSNotFound ||
                [strKey rangeOfString:@"width" options:NSCaseInsensitiveSearch].location != NSNotFound ||
                [strKey rangeOfString:@"height" options:NSCaseInsensitiveSearch].location != NSNotFound ||
                [strKey caseInsensitiveCompare:@"id"] == NSOrderedSame ||
                [strKey caseInsensitiveCompare:@"itemid"] == NSOrderedSame ) {
                defaultType = NSNumber.class;
            }
            else if ([strKey rangeOfString:@"list" options:NSCaseInsensitiveSearch].location != NSNotFound ||
                [strKey rangeOfString:@"tags" options:NSCaseInsensitiveSearch].location != NSNotFound ) {
                defaultType = NSArray.class;
            }
            else if ([strKey rangeOfString:@"title" options:NSCaseInsensitiveSearch].location != NSNotFound ||
                [strKey rangeOfString:@"name" options:NSCaseInsensitiveSearch].location != NSNotFound ||
                [strKey rangeOfString:@"descript" options:NSCaseInsensitiveSearch].location != NSNotFound ||
                [strKey rangeOfString:@"url" options:NSCaseInsensitiveSearch].location != NSNotFound ||
                [strKey rangeOfString:@"time" options:NSCaseInsensitiveSearch].location != NSNotFound ||
                [strKey rangeOfString:@"date" options:NSCaseInsensitiveSearch].location != NSNotFound ) {
                defaultType = NSString.class;
            }
        }
        id iterator_obj = [self recurseChange:obj defaultType:defaultType];
        [mutDict setObject:iterator_obj forKey:key];
    }];
    
    return mutDict;
}
//递归数组
+(NSArray*)recurseArray:(NSArray*)array{
    
    NSMutableArray *mutArray = [NSMutableArray new];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Class defaultType = NSDictionary.class;//默认字典类型
        if ([obj isKindOfClass:NSNull.class]) {
            if (idx > 0) {
                NSUInteger lastItemIndex = idx - 1;
                defaultType = [array[lastItemIndex] class];
            }
            else if (idx == 0 && array.count > 1){
                NSUInteger nextItemIndex = idx + 1;
                defaultType = [array[nextItemIndex] class];
            }
        }
        id iterator_obj = [self recurseChange:obj defaultType:defaultType];
        [mutArray addObject:iterator_obj];
    }];
    
    return mutArray;
}
//NSString处理:不处理，直接返回
+(NSString*)changeString:(NSString*)string{
    
    return string;
}
//将Null类型的转化成对应类型的默认值
+(id)changeNullToClassDefault:(Class)defaultClass{
    
    if ([defaultClass isEqual:NSArray.class]) {
        return [[NSArray alloc] init];
    }
    else if ([defaultClass isEqual:NSDictionary.class]) {
        return [[NSDictionary alloc] init];
    }
    else if ([defaultClass isEqual:NSNumber.class]) {
        return @0;
    }
    
    return @"";
}
@end
