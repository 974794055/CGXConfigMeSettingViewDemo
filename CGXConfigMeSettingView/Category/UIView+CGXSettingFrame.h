//
//  UIView+CGXSettingFrame.h
//  CGXSettingTableViewController
//
//  Created by 曹贵鑫 on 2017/9/20.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CGXSettingFrame)


@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;




@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic, readonly) CGFloat screenX;
@property (nonatomic, readonly) CGFloat screenY;


@property (nonatomic, assign) CGFloat radius;
@end

