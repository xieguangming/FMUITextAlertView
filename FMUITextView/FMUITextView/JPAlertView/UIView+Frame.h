//
//  UIView+Frame.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
// shortcuts for frame properties
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

// shortcuts for positions
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;


@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
/**
 *  等比例拉伸视图
 *
 *  @param width 目标宽
 *
 *  @return 目标高
 */
- (CGFloat)autoresizeHeightToWidth:(CGFloat)width;
/**
 *  等比例拉伸视图
 *
 *  @param width 目标高
 *
 *  @return 目标宽
 */
- (CGFloat)autoresizeWidthToHeight:(CGFloat)height;

@end
