//
//  NSArray+CheckBounds.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/4/16.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "NSArray+CheckBounds.h"

@implementation NSArray (CheckBounds)

+(void)load{
    //替换objectAtIndex、下标
    Method m1 = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
    Method m11 = class_getInstanceMethod(self, @selector(cb_objectAtIndexFromNSArrayI:));
    method_exchangeImplementations(m1, m11);
    Method m2 = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndexedSubscript:));
    Method m22 = class_getInstanceMethod(self, @selector(cb_objectAtIndexedSubscriptFromNSArrayI:));
    method_exchangeImplementations(m2, m22);
    
    Method m3 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndex:));
    Method m33 = class_getInstanceMethod(self, @selector(cb_objectAtIndexFromNSArrayM:));
    method_exchangeImplementations(m3, m33);
    Method m4 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndexedSubscript:));
    Method m44 = class_getInstanceMethod(self, @selector(cb_objectAtIndexedSubscriptFromNSArrayM:));
    method_exchangeImplementations(m4, m44);
    
    //替换insertObject
    Method m5 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(insertObject:atIndex:));
    Method m55 = class_getInstanceMethod(self, @selector(cb_insertObject2NSArrayM:atIndex:));
    method_exchangeImplementations(m5, m55);
    //替换addObject
    Method m6 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(addObject:));
    Method m66 = class_getInstanceMethod(self, @selector(cb_addObject2NSArrayM:));
    method_exchangeImplementations(m6, m66);

}
#pragma mark 替换的方法
-(id)cb_objectAtIndexFromNSArrayI:(NSUInteger)index{
    return [self getObjectAtIndexFromNSArrayI:index];
}
-(id)cb_objectAtIndexedSubscriptFromNSArrayI:(NSUInteger)index{
    return [self getObjectAtIndexedSubscriptFromNSArrayI:index];
}
-(id)cb_objectAtIndexFromNSArrayM:(NSUInteger)index{
    return [self getObjectAtIndexFromNSArrayM:index];
}
-(id)cb_objectAtIndexedSubscriptFromNSArrayM:(NSUInteger)index{
    return [self getObjectAtIndexedSubscriptFromNSArrayM:index];
}
//添加操作
-(void)cb_insertObject2NSArrayM:(id)anObject atIndex:(NSUInteger)index{
    [self insertObject2NSArrayM:anObject atIndex:index];
}
-(void)cb_addObject2NSArrayM:(id)anObject{
    [self addObject2NSArrayM:anObject];
}
#pragma mark 私有方法
-(void)addObject2NSArrayM:(id)anObject{
    if (anObject == nil) {
        NSAssert(false, @"NSArray not allow to add a nil Object" );
        return;
    }
    
    [self cb_addObject2NSArrayM:anObject];
}
-(void)insertObject2NSArrayM:(id)anObject atIndex:(NSUInteger)index{
    if (anObject == nil) {
        NSAssert(false, @"NSArray not allow to insert a nil Object at index %ld ", (unsigned long)index);
        return;
    }
    
    [self cb_insertObject2NSArrayM:anObject atIndex:index];
}

-(id)getObjectAtIndexFromNSArrayI:(NSUInteger)index{
    
    if (self.count == 0 || index > self.count-1) {
        return [self handleOverBounds];
    }
    return [self cb_objectAtIndexFromNSArrayI:index];
}

-(id)getObjectAtIndexedSubscriptFromNSArrayI:(NSUInteger)index{
        
    if (self.count == 0 || index > self.count-1) {
        return [self handleOverBounds];
    }
    return [self cb_objectAtIndexedSubscriptFromNSArrayI:index];
}

-(id)getObjectAtIndexFromNSArrayM:(NSUInteger)index{
        
    if (self.count == 0 || index > self.count-1) {
        return [self handleOverBounds];
    }
    return [self cb_objectAtIndexFromNSArrayM:index];
}

-(id)getObjectAtIndexedSubscriptFromNSArrayM:(NSUInteger)index{
        
    if (self.count == 0 || index > self.count-1) {
        return [self handleOverBounds];
    }
    return [self cb_objectAtIndexedSubscriptFromNSArrayM:index];
}

-(id)handleOverBounds{
    NSLog(@"__%@__数组越界",self);
    if (self.count > 0) {
        if ([self.firstObject isKindOfClass:NSString.class]) {
            return @"";
        }
        else if ([self.firstObject isKindOfClass:NSNumber.class]) {
            return @0;
        }
        else if ([self.firstObject isKindOfClass:NSDictionary.class]) {
            return [NSDictionary new];
        }
        else if ([self.firstObject isKindOfClass:NSArray.class]) {
            return [NSArray new];
        }
    }
    return nil;
}
@end
