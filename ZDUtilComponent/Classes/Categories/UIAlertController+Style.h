//
//  UIAlertController+Style.h
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/21.
//  Copyright © 2020 yagu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (Style)
@property(nonatomic, strong) UIColor *titleColor;/**< 标题的颜色,默认黑色 */
@property(nonatomic, strong) UIColor *messageColor;/**< 信息的颜色,默认黑色 */
@property(nonatomic, strong) UIColor *tintColor;/**< 统一按钮样式 不写系统默认的蓝色 */
@property(nonatomic, strong) UIColor *cancelColor;/**< 取消按钮样式 不写系统默认的蓝色 */
@property(nonatomic, strong) UIColor *defaultColor;/**< 默认按钮样式 不写系统默认的蓝色 */
@property(nonatomic, strong) UIColor *destructiveColor;/**< 破坏性按钮样式 不写系统默认的红色 */

@property(nonatomic, strong) UIFont *titleFont;/**< 标题的字体,默认字号14加粗 */
@property(nonatomic, strong) UIFont *messageFont;/**< 信息的字体,默认字号14常规*/

/*
 按钮添加顺序：cancel_default_destructive
 handle idx取值如下
-2 :点击destructiveAction
-1 :点击cancelAction
0,1:点击defaultAction(数组下标)
 */
+(instancetype)alertControllerWithTitle:(nullable NSString *)title
                 message:(nullable NSString *)message
                 preferredStyle:(UIAlertControllerStyle)preferredStyle
                 cancelTitle:(nullable NSString*)cancelTitle
                 defaultTitles:(nullable NSArray*)defaultTitles
                 destructiveTitle:(nullable NSString*)destructiveTitle
                 handle:(nullable void(^)(NSInteger idx))handle;
@end

@interface UIAlertAction (Style)
@property(nonatomic, strong) UIColor *textColor;
@end
NS_ASSUME_NONNULL_END
