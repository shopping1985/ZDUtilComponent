//
//  NSDictionary+TypeCheck.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/26.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "NSDictionary+TypeCheck.h"

@implementation NSDictionary (TypeCheck)

#pragma mark objectForkey
-(NSString*)stringObjectForKey:(NSString *)key{
    NSObject *obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:NSString.class]) {
        NSString *str = [NSString stringWithFormat:@"%@", obj];
        return str;
    }
    return @"";
}

-(int)intObjectForKey:(NSString *)key{
    NSObject *obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:NSNumber.class]) {
        NSNumber *number = (NSNumber*)obj;
        return [number intValue];
    }
    return 0;
}

-(long)longObjectForKey:(NSString *)key{
    NSObject *obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:NSNumber.class]) {
        NSNumber *number = (NSNumber*)obj;
        return [number longValue];
    }
    return 0;
}

- (long long)longLongObjectForKey:(NSString *)key{
    NSObject *obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:NSNumber.class]) {
        NSNumber *number = (NSNumber*)obj;
        return [number longLongValue];
    }
    return 0;
}

-(float)floatObjectForKey:(NSString *)key{
    NSObject *obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:NSNumber.class]) {
        NSNumber *number = (NSNumber*)obj;
        return [number floatValue];
    }
    return 0;
}

-(BOOL)boolObjectForKey:(NSString *)key{
    NSObject *obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:NSNumber.class]) {
        NSNumber *number = (NSNumber*)obj;
        return [number boolValue];
    }
    return NO;
}

-(NSArray *)arrayObjectForKey:(NSString *)key{
    NSObject *obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:NSArray.class]) {
        NSArray *array = (NSArray*)obj;
        return array;
    }
    return [NSArray new];
}

-(NSDictionary *)dictionayObjectForKey:(NSString *)key{
    NSObject *obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:NSDictionary.class]) {
        NSDictionary *dict = (NSDictionary*)obj;
        return dict;
    }
    return [NSDictionary new];
}

#pragma mark valueForkey
-(NSString*)stringValueForKey:(NSString *)key{
    NSObject *obj = [self valueForKey:key];
    if (obj && [obj isKindOfClass:NSString.class]) {
        NSString *str = [NSString stringWithFormat:@"%@", obj];
        return str;
    }
    return @"";
}

-(int)intValueForKey:(NSString *)key{
    NSObject *obj = [self valueForKey:key];
    if (obj && [obj isKindOfClass:NSNumber.class]) {
        NSNumber *number = (NSNumber*)obj;
        return [number intValue];
    }
    return 0;
}

-(long)longValueForKey:(NSString *)key{
    NSObject *obj = [self valueForKey:key];
    if (obj && [obj isKindOfClass:NSNumber.class]) {
        NSNumber *number = (NSNumber*)obj;
        return [number longValue];
    }
    return 0;
}

- (long long)longLongValueForKey:(NSString *)key{
    NSObject *obj = [self valueForKey:key];
    if (obj && [obj isKindOfClass:NSNumber.class]) {
        NSNumber *number = (NSNumber*)obj;
        return [number longLongValue];
    }
    return 0;
}

-(float)floatValueForKey:(NSString *)key{
    NSObject *obj = [self valueForKey:key];
    if (obj && [obj isKindOfClass:NSNumber.class]) {
        NSNumber *number = (NSNumber*)obj;
        return [number floatValue];
    }
    return 0;
}

-(BOOL)boolValueForKey:(NSString *)key{
    NSObject *obj = [self valueForKey:key];
    if (obj && [obj isKindOfClass:NSNumber.class]) {
        NSNumber *number = (NSNumber*)obj;
        return [number boolValue];
    }
    return NO;
}

-(NSArray *)arrayValueForKey:(NSString *)key{
    NSObject *obj = [self valueForKey:key];
    if (obj && [obj isKindOfClass:NSArray.class]) {
        NSArray *array = (NSArray*)obj;
        return array;
    }
    return [NSArray new];
}

-(NSDictionary *)dictionayValueForKey:(NSString *)key{
    NSObject *obj = [self valueForKey:key];
    if (obj && [obj isKindOfClass:NSDictionary.class]) {
        NSDictionary *dict = (NSDictionary*)obj;
        return dict;
    }
    return [NSDictionary new];
}
@end
