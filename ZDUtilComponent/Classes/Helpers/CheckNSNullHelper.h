//
//  CheckNSNullHelper.h
//  BeautifulDay
//  用途：递归处理对象中的NSNull类型，转为@“”
//  一般用于解决服务器返回的json串中的<null>
//  Created by linxiaoping on 2020/3/28.
//  Copyright © 2020 yagu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CheckNSNullHelper : NSObject
+(id)recurseChange:(id)obj defaultType:(Class)class;
@end

NS_ASSUME_NONNULL_END
