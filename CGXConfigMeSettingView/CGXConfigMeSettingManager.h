//
//  CGXConfigMeSettingManager.h
//  CGXConfigMeSettingView
//
//  Created by 曹贵鑫 on 2017/11/20.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, CGXConfigMeSettingManagerTableViewStyle) {
    CGXConfigMeSettingManagerTableViewStyleGrouped,
    CGXConfigMeSettingManagerTableViewStylePlain
};

@interface CGXConfigMeSettingManager : NSObject

/**
 param showStype 初始化选择类型
 return self
 */
- (instancetype)initWithType:(CGXConfigMeSettingManagerTableViewStyle)tableViewStyle;

@property (nonatomic , assign) CGXConfigMeSettingManagerTableViewStyle tableViewStyle;

/*
 数据源数组   格式为  @[@[model,model,model],@[model,model,model],@[model,model,model]];
 
 */
@property (nonatomic , strong) NSMutableArray *modelArray;

@property (nonatomic , strong) NSMutableArray *headerArray;//头部数据源数组

@property (nonatomic , strong) NSMutableArray *footerArray;//脚部数据源数组

@property (nonatomic , strong) UIColor *headerInSectionBG;

@property (nonatomic , strong) UIColor *footerInSectionBG;


@end
