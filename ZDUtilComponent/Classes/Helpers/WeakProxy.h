//
//  WeakProxy.h
//  BeautifulDay
//
//  Created by yagu on 2019/12/12.
//  Copyright © 2019 yagu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakProxy : NSObject

@property (nonatomic, weak, readonly) id weakTarget;

+ (instancetype)proxyWithTarget:(id)target;
- (instancetype)initWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
