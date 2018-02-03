//
//  CGXConfigMeSettingCell.h
//  CGXConfigMeSettingView
//
//  Created by 曹贵鑫 on 2017/11/20.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXConfigMeSettingManager.h"
#import "CGXConfigMeSettingItemModel.h"
@interface CGXConfigMeSettingCell : UITableViewCell<UITextFieldDelegate>
{
    CGFloat viewW;
    CGFloat viewH;
    CGRect rect;
}

@property (strong, nonatomic) UILabel *funcNameLabel;//左侧功能名称
@property (nonatomic,strong) UIImageView *funcNameImgView;//左侧功能图片

@property (nonatomic,strong) UIImageView *arrowImageView;

@property (nonatomic, strong)UIView *topLine;  ///<顶部分割线
@property (nonatomic, strong)UIView *bottomLine;  ///<底部分割线

@property (nonatomic,strong) UISwitch *aswitch;

@property (nonatomic,strong) UIImageView *headerImageView;//用户头像
@property (nonatomic,strong) UILabel *detailLabel;
@property (nonatomic,strong) UIImageView *detailImageView;


@property (nonatomic,strong) UILabel *rightLabel;//自定义富文本显示时使用


@property (nonatomic , strong) UITextField *textFiled;

@property (nonatomic , strong) CGXConfigMeSettingManager *manager;
@property (nonatomic , strong) CGXConfigMeSettingItemModel *model;

//- (CGSize)sizeForTitle:(NSString *)title withFont:(UIFont *)font;
- (void)showInfoCell:(CGXConfigMeSettingItemModel *)itemModel CellStyle:(CGXConfigMeSettingManager *)manager;
@end
