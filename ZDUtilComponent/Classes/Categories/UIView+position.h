//
//  UIView+position.h
//  BeautifulDay
//
//  Created by lin cong on 2020/2/6.
//  Copyright © 2020 yagu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (position)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
- (void)setRadius:(float)radius borderColor:(nullable UIColor* )color borderWidth:(CGFloat)width;
- (void)setRadius:(float)radius  corners: (UIRectCorner)corners;
- (void)setHalfRadius;
@end

NS_ASSUME_NONNULL_END
