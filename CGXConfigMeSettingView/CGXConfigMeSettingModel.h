//
//  CGXConfigMeSettingModel.h
//  CGXConfigMeSettingView
//
//  Created by 曹贵鑫 on 2017/11/20.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CGXConfigMeSettingModel : NSObject

@property (nonatomic,strong) NSMutableArray  *itemArray; /**< item模型数组*/

@property (nonatomic,assign) CGFloat  sectionHeaderHeight; /**<      分组header高度*/

@property (nonatomic,assign) CGFloat  sectionFooterHeight; /**<      分组footer高度*/

@property (nonatomic,strong) NSMutableArray *sectionHeaderArray;

@property (nonatomic,strong) NSMutableArray *sectionFooterArray;

@end
