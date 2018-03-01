//
//  CGXConfigMeSettingView.h
//  CGXConfigMeSettingView
//
//  Created by 曹贵鑫 on 2017/11/20.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CGXConfigMeSettingManager;
@class CGXConfigMeSettingView;
@class CGXConfigMeSettingModel;
@class CGXConfigMeSettingItemModel;

@protocol CGXConfigMeSettingViewDelegate;

@protocol CGXConfigMeSettingViewDelegate <NSObject>
@optional


- (void)cgxConfigMeSettingShowCellView:(CGXConfigMeSettingView *)pView AtIndexPath:(NSIndexPath *)indexPath MOdel:(CGXConfigMeSettingModel *)model ItemModel:(CGXConfigMeSettingItemModel *)itemModel;
- (void)cgxConfigMeSettingSelectCellView:(CGXConfigMeSettingView *)pView AtIndexPath:(NSIndexPath *)indexPath Model:(CGXConfigMeSettingModel *)model ItemModel:(CGXConfigMeSettingItemModel *)itemModel;



/*
 isheader:YES为头部
 tableViewArray:数据源
 tView:设置frame  自定义UI
 */

- (void)cgxConfigMeSettingShowHeaderView:(CGXConfigMeSettingView *)pView InSection:(NSInteger)section TView:(UIView *)tView Model:(CGXConfigMeSettingModel *)model;
- (void)cgxConfigMeSettingShowFooterView:(CGXConfigMeSettingView *)pView InSection:(NSInteger)section TView:(UIView *)tView Model:(CGXConfigMeSettingModel *)model;


- (void)cgxConfigMeSettingSelectSwitchCellView:(CGXConfigMeSettingView *)pView AtIndexPath:(NSIndexPath *)indexPath ItemModel:(CGXConfigMeSettingItemModel *)itemModel SwitchIsOn:(BOOL)isOn;

- (void)cgxConfigMeSettingSelectTextViewCellView:(CGXConfigMeSettingView *)pView AtIndexPath:(NSIndexPath *)indexPath ItemModel:(CGXConfigMeSettingItemModel *)itemModel;

@end

@interface CGXConfigMeSettingView : UIView
/*
 初始化view
 */
- (instancetype)initWithFrame:(CGRect)frame WithManager:(CGXConfigMeSettingManager *)manager;


@property (nonatomic , strong) CGXConfigMeSettingManager *manager;

@property(nonatomic,weak)id <CGXConfigMeSettingViewDelegate>delegate;

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) UIView *headerView;
@property (nonatomic , strong) UIView *footerView;

- (void)replaceObjectAtIndexPath:(NSIndexPath *)indexPath AtIndexModel:(CGXConfigMeSettingModel *)model ItemModel:(CGXConfigMeSettingItemModel *)itemModel;

@end
