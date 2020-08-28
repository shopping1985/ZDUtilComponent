//
//  UIBarButtonItem+Extension.m
//  TabBarAppTemplate
//
//  Created by linxiaoping on 2020/4/6.
//  Copyright © 2020 linxiaoping. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem(Extension)
+(instancetype)itemWithImage:(NSString *)imageName target:(id)target selector:(SEL)selector{
    //创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:imageName];
    [button setImage:image forState:UIControlStateNormal];
    //设置button的frame,一定要设置frame，才能显示
    button.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    //设置button事件
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [UIBarButtonItem new];
    item.customView = button;
    return item;
}
@end
