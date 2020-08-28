//
//  UIBarButtonItem+Extension.h
//  TabBarAppTemplate
//
//  Created by linxiaoping on 2020/4/6.
//  Copyright © 2020 linxiaoping. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem(Extension)
+(instancetype)itemWithImage:(NSString*)imageName target:(id)target selector:(SEL)selector;
@end

NS_ASSUME_NONNULL_END
