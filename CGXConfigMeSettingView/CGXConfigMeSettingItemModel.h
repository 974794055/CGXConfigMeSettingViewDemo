//
//  CGXConfigMeSettingItemModel.h
//  CGXConfigMeSettingView
//
//  Created by 曹贵鑫 on 2017/11/20.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CGXConfigMeSettingItemModel : NSObject


@property (nonatomic , assign) CGFloat  rowHeight; /**<    分区cell高度*/

@property (nonatomic,strong) NSString *arrowImage;          /**< 右侧箭头图标  */

/**
 必须传的项目
 **/
@property (nonatomic,copy) NSString  *funcName;     /**<      功能名称*/
@property (nonatomic , assign) CGFloat funcNameFont;
@property (nonatomic , strong) UIColor *funcNameColor;/**<      功能名称颜色*/
@property (nonatomic,strong) UIImage *funcNameImage;          /**< 功能图片  */


@property (nonatomic,copy) NSString *detailText;    /**< 更多信息-提示文字  */
@property (nonatomic , strong) UIColor *detailTextColor;/**<      更多信息名称颜色*/
@property (nonatomic,strong) UIImage *detailImage;  /**< 更多信息-提示图片  */
@property (nonatomic , assign) CGFloat detailTextFont;


@property (nonatomic,strong) UIImage *headerImage;          /**<头像图片  */


@property (nonatomic , strong) UIColor *switchTintColor;/**<      switch颜色*/
@property (nonatomic , strong) UIColor *switchOnTintColor;/**<      switch颜色*/
@property (nonatomic , strong) UIColor *switchThumbTintColor;/**<      switch颜色*/
@property (nonatomic , assign) CGFloat switchCornerRadius;/**<      switch圆角*/
@property (nonatomic , assign) CGFloat switchScale;/**<      switch缩放的比例*/


@property (nonatomic , strong) NSString *textfiledStr;/**<      文本框文字*/
@property (nonatomic , assign) CGFloat textfiledFont;/**<      文本框大小*/
@property (nonatomic , strong) UIColor *textfiledColor;/**<      文本框字体颜色*/
@property (nonatomic , assign) NSInteger textfiledNumbert;/**<      文本框字数限制*/
@property (nonatomic , strong) UIColor *boroedColor;/**<      文本框边框颜色*/
@property (nonatomic , assign) NSInteger boroedWidth;/**<      文本框边框宽度*/


@property (nonatomic , strong) NSString *placeholder;/**<      占位文字*/
@property (nonatomic , strong) UIColor *placeholderColor;/**<      占位文字颜色*/
@property (nonatomic , assign) CGFloat placeholderFont;/**<      s占位文字范围字体大小*/
@property (nonatomic , assign) CGRect *placeholderRect;/**<      占位文字范围*/

@property (nonatomic,assign) BOOL  isOn;    /**< switch默认不选中 */

@property (nonatomic,assign) BOOL  isArrow;    /**< switch默认右箭头 */


@property (nonatomic,assign) BOOL  isLineView;    /**< 下划线 */
@property (nonatomic,assign) CGFloat  lineViewX;    /**< 下划线默认开头 */
@property (nonatomic,strong) UIColor  *lineViewColor;    /**< 下划线颜色 */

/*
 #park 右侧自定义其他样式 富文本显示
 */
@property (nonatomic , strong) NSMutableAttributedString *attributedSrting;

@property (nonatomic,copy) void (^switchValueChanged)(BOOL isOn,CGXConfigMeSettingItemModel *model); /**<  XBSettingAccessoryTypeSwitch下开关变化 */

@property (nonatomic,copy) void (^executeCode)(CGXConfigMeSettingItemModel *model); /**<      点击item要执行的代码*/

@property (nonatomic,copy) void (^textValueChanged)(NSString *text,CGXConfigMeSettingItemModel *model); /**<  XBSettingAccessoryTypeText下开关变化 */

@end
