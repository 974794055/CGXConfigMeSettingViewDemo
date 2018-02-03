//
//  CGXConfigMeSettingManager.m
//  CGXConfigMeSettingView
//
//  Created by 曹贵鑫 on 2017/11/20.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "CGXConfigMeSettingManager.h"
#define CGXConfigMeSettingBG   [UIColor colorWithWhite:0.93 alpha:1]
@implementation CGXConfigMeSettingManager

- (instancetype)initWithType:(CGXConfigMeSettingManagerTableViewStyle)tableViewStyle
{
    if (self = [super init]) {
        self.tableViewStyle = tableViewStyle;
        
        [self setUpManager];
        
        
        self.modelArray = [NSMutableArray array];
        self.headerArray = [NSMutableArray array];
        self.footerArray = [NSMutableArray array];
        
        self.headerInSectionBG = CGXConfigMeSettingBG;
        self.footerInSectionBG = CGXConfigMeSettingBG;
    }
    return self;
}

- (void)setUpManager
{
    
}
@end
