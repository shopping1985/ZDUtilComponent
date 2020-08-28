//
//  UIAlertController+Style.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/21.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "UIAlertController+Style.h"
#import <objc/runtime.h>

@implementation UIAlertAction (Style)
//按钮标题的字体颜色
-(UIColor *)textColor{
    return objc_getAssociatedObject(self, @selector(textColor));
}
-(void)setTextColor:(UIColor *)textColor{
    if (textColor) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(UIAlertAction.class, &count);
        for (int i = 0; i < count; i++) {
            Ivar item = ivars[i];
            NSString *ivarName = [NSString stringWithCString:ivar_getName(item) encoding:NSUTF8StringEncoding];
            if ([ivarName isEqualToString:@"_titleTextColor"]) {
                [self setValue:textColor forKey:@"_titleTextColor"];
                break;
            }
        }
        free(ivars);
        objc_setAssociatedObject(self, @selector(textColor), textColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
@end

@implementation UIAlertController (Style)
//标题颜色
-(UIColor *)titleColor{
    return objc_getAssociatedObject(self, @selector(titleColor));
}
-(void)setTitleColor:(UIColor *)titleColor{
    if (titleColor && self.title && self.title.length > 0) {
        UIFont *titleFont = self.titleFont;
        if (titleFont == nil) {
            titleFont = [UIFont systemFontOfSize:14.0 weight:UIFontWeightBold];//字号默认14，字重默认加粗
        }
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(UIAlertController.class, &count);
        for (int i = 0; i < count; i++) {
            Ivar item = ivars[i];
            NSString *ivarName = [NSString stringWithCString:ivar_getName(item) encoding:NSUTF8StringEncoding];
            if ([ivarName isEqualToString:@"_attributedTitle"]) {
                NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.message attributes:@{NSFontAttributeName:titleFont,NSForegroundColorAttributeName:titleColor}];
                [self setValue:attrStr forKey:@"_attributedTitle"];
                break;
            }
        }
        free(ivars);
        objc_setAssociatedObject(self, @selector(titleColor), titleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
//标题字体
-(UIFont *)titleFont{
    return objc_getAssociatedObject(self, @selector(titleFont));
}
-(void)setTitleFont:(UIFont *)titleFont{
    if (titleFont && self.title && self.title.length > 0) {
        UIColor *titleColor = self.titleColor;
        if (titleColor == nil) {
            titleColor = UIColor.blackColor;//默认黑色
        }
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(UIAlertController.class, &count);
        for (int i = 0; i < count; i++) {
            Ivar item = ivars[i];
            NSString *ivarName = [NSString stringWithCString:ivar_getName(item) encoding:NSUTF8StringEncoding];
            if ([ivarName isEqualToString:@"_attributedTitle"]) {
                NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.title attributes:@{NSFontAttributeName:titleFont,NSForegroundColorAttributeName:titleColor}];
                [self setValue:attrStr forKey:@"_attributedTitle"];
                break;
            }
        }
        free(ivars);
        objc_setAssociatedObject(self, @selector(titleFont), titleFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
//信息颜色
-(UIColor *)messageColor{
    return objc_getAssociatedObject(self, @selector(messageColor));
}
-(void)setMessageColor:(UIColor *)messageColor{
    if (messageColor && self.message && self.message.length > 0) {
        UIFont *msgFont = self.messageFont;
        if (msgFont == nil) {
            msgFont = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];//字号默认14，字重默认常规
        }
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(UIAlertController.class, &count);
        for (int i = 0; i < count; i++) {
            Ivar item = ivars[i];
            NSString *ivarName = [NSString stringWithCString:ivar_getName(item) encoding:NSUTF8StringEncoding];
            if ([ivarName isEqualToString:@"_attributedMessage"]) {
                NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.message attributes:@{NSFontAttributeName:msgFont,NSForegroundColorAttributeName:messageColor}];
                [self setValue:attrStr forKey:@"_attributedMessage"];
                break;
            }
        }
        free(ivars);
        objc_setAssociatedObject(self, @selector(messageColor), messageColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
//信息字体
-(UIFont *)messageFont{
    return objc_getAssociatedObject(self, @selector(messageFont));
}
-(void)setMessageFont:(UIFont *)messageFont{
    if (messageFont && self.message && self.message.length > 0) {
        UIColor *msgColor = self.messageColor;
        if (msgColor == nil) {
            msgColor = UIColor.blackColor;//默认黑色
        }
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(UIAlertController.class, &count);
        for (int i = 0; i < count; i++) {
            Ivar item = ivars[i];
            NSString *ivarName = [NSString stringWithCString:ivar_getName(item) encoding:NSUTF8StringEncoding];
            if ([ivarName isEqualToString:@"_attributedMessage"]) {
                NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.message attributes:@{NSFontAttributeName:messageFont,NSForegroundColorAttributeName:msgColor}];
                [self setValue:attrStr forKey:@"_attributedMessage"];
                break;
            }
        }
        free(ivars);
        objc_setAssociatedObject(self, @selector(messageFont), messageFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

#pragma mark 按钮
//取消按钮文字颜色
-(UIColor *)cancelColor{
    return objc_getAssociatedObject(self, @selector(cancelColor));
}
-(void)setCancelColor:(UIColor *)cancelColor{
    if (cancelColor) {
        __block UIAlertAction *cancelAction;
        [self.actions enumerateObjectsUsingBlock:^(UIAlertAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.style == UIAlertActionStyleCancel) {
                cancelAction = obj;
                *stop = YES;
            }
        }];
        if (cancelAction) {
            unsigned int count = 0;
            Ivar *ivars = class_copyIvarList(UIAlertAction.class, &count);
            for (int i = 0; i < count; i++) {
                Ivar item = ivars[i];
                NSString *ivarName = [NSString stringWithCString:ivar_getName(item) encoding:NSUTF8StringEncoding];
                if ([ivarName isEqualToString:@"_titleTextColor"]) {
                    [cancelAction setValue:cancelColor forKey:@"_titleTextColor"];
                    break;
                }
            }
            free(ivars);
        }
        
        objc_setAssociatedObject(self, @selector(cancelColor), cancelColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
//默认按钮文字颜色
-(UIColor *)defaultColor{
    return objc_getAssociatedObject(self, @selector(defaultColor));
}
-(void)setDefaultColor:(UIColor *)defaultColor{
    if (defaultColor) {
        __block NSMutableArray *defaultActions = [NSMutableArray new];
        [self.actions enumerateObjectsUsingBlock:^(UIAlertAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.style == UIAlertActionStyleDefault) {
                [defaultActions addObject:obj];
            }
        }];
        
        if (defaultActions.count > 0) {
            unsigned int count = 0;
            Ivar *ivars = class_copyIvarList(UIAlertAction.class, &count);
            for (int i = 0; i < count; i++) {
                Ivar item = ivars[i];
                NSString *ivarName = [NSString stringWithCString:ivar_getName(item) encoding:NSUTF8StringEncoding];
                if ([ivarName isEqualToString:@"_titleTextColor"]) {
                    [defaultActions enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        UIAlertAction *action = (UIAlertAction*)obj;
                        if (action) {
                            [action setValue:defaultColor forKey:@"_titleTextColor"];
                        }
                    }];
                    break;
                }
            }
            free(ivars);
        }
        
        objc_setAssociatedObject(self, @selector(defaultColor), defaultColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
//破坏性按钮文字颜色
-(UIColor *)destructiveColor{
    return objc_getAssociatedObject(self, @selector(destructiveColor));
}
-(void)setDestructiveColor:(UIColor *)destructiveColor{
    if (destructiveColor) {
        __block UIAlertAction *destructiveAction;
        [self.actions enumerateObjectsUsingBlock:^(UIAlertAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.style == UIAlertActionStyleDestructive) {
                destructiveAction = obj;
                *stop = YES;
            }
        }];
        if (destructiveAction) {
            unsigned int count = 0;
            Ivar *ivars = class_copyIvarList(UIAlertAction.class, &count);
            for (int i = 0; i < count; i++) {
                Ivar item = ivars[i];
                NSString *ivarName = [NSString stringWithCString:ivar_getName(item) encoding:NSUTF8StringEncoding];
                if ([ivarName isEqualToString:@"_titleTextColor"]) {
                    [destructiveAction setValue:destructiveColor forKey:@"_titleTextColor"];
                    break;
                }
            }
            free(ivars);
        }
        
        objc_setAssociatedObject(self, @selector(destructiveColor), destructiveColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
//按钮文字统一颜色（除破坏性按钮）
-(UIColor *)tintColor
{
    return objc_getAssociatedObject(self, @selector(tintColor));
}

-(void)setTintColor:(UIColor *)tintColor
{
    objc_setAssociatedObject(self, @selector(tintColor), tintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark 方法
+(instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancelTitle:(nullable NSString *)cancelTitle defaultTitles:(nullable NSArray *)defaultTitles destructiveTitle:(nullable NSString *)destructiveTitle handle:(nullable void (^)(NSInteger))handle{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    if (cancelTitle && cancelTitle.length > 0) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (handle) {
                handle(-1);
            }
        }];
        [alertController addAction:action];
    }
    if (defaultTitles && defaultTitles.count > 0) {
        [defaultTitles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (handle) {
                    handle(idx);
                }
            }];
            [alertController addAction:action];
        }];
    }
    if (destructiveTitle && destructiveTitle.length > 0) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:destructiveTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (handle) {
                handle(-2);
            }
        }];
        [alertController addAction:action];
    }
    return alertController;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    //按钮统一颜色
    if (self.tintColor) {
        for (UIAlertAction *action in self.actions) {
            if (!action.textColor || action.style != UIAlertActionStyleDestructive) {
                action.textColor = self.tintColor;
            }
        }
    }
}
@end
