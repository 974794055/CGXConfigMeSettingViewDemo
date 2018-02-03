//
//  CGXConfigMeSettingCell.m
//  CGXConfigMeSettingView
//
//  Created by 曹贵鑫 on 2017/11/20.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "CGXConfigMeSettingCell.h"
#import "UIView+CGXSettingFrame.h"



#define CGXMakeColorWithRGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
//获取屏幕尺寸
#define CGXSettingScreenWidth      [UIScreen mainScreen].bounds.size.width
#define CGXSettingScreenHeight     [UIScreen mainScreen].bounds.size.height
#define CGXSettingScreenBounds     [UIScreen mainScreen].bounds

#define CGXSettingScaleHeight(A) A / (double)667 * CGXSettingScreenHeight
#define CGXSettingScaleWidth(W)  W / (double)375 * CGXSettingScreenWidth

//功能图片到左边界的距离
#define CGXFuncImgToLeftGap 15

#define CGXFuncImgToRightGap 15

//功能名称字体
#define CGXFuncLabelFont 14

//功能名称到功能图片的距离,当功能图片funcImg不存在时,等于到左边界的距离
#define CGXFuncLabelToFuncImgGap 15

//指示箭头或开关到右边界的距离
#define CGXConfigToRightGap 15

//详情文字字体
#define CGXDetailLabelFont 12

//详情到指示箭头或开关的距离
#define CGXDetailViewToIndicatorGap 10

#define CGXConfigSpace CGXSettingScaleWidth(5)

@implementation CGXConfigMeSettingCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}





- (UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        if (self.model.lineViewX) {
            _bottomLine.frame =  CGRectMake(self.model.lineViewX, viewH-0.5, viewW-self.model.lineViewX, 0.5);
        } else{
            _bottomLine.frame =  CGRectMake(40, viewH-0.5, viewW-40, 0.5);
        }
        if (self.model.lineViewColor) {
            _bottomLine.backgroundColor = self.model.lineViewColor;
        } else{
            _bottomLine.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
        }

    }
    return _bottomLine;
}

- (UISwitch *)aswitch
{
    if (!_aswitch) {
        _aswitch = [[UISwitch alloc]init];
        _aswitch.tintColor = self.model.switchTintColor;
        _aswitch.onTintColor = self.model.switchOnTintColor;
        _aswitch.thumbTintColor = self.model.switchThumbTintColor;
        _aswitch.layer.cornerRadius = self.model.switchCornerRadius;
        _aswitch.layer.masksToBounds = YES;
        _aswitch.on = self.model.isOn;
        _aswitch.transform = CGAffineTransformMakeScale(1-self.model.switchScale, 1-self.model.switchScale);//缩放
        _aswitch.centerY = self.contentView.centerY;
        _aswitch.x = viewW - _aswitch.width - CGXConfigToRightGap;
        [_aswitch addTarget:self action:@selector(switchTouched:) forControlEvents:UIControlEventValueChanged];
    }
    return _aswitch;
}
- (void)switchTouched:(UISwitch *)sw
{
    __weak typeof(self) weakSelf = self;
    if (self.model.switchValueChanged) {
        self.model.switchValueChanged(weakSelf.aswitch.isOn,self.model);
    }
}
- (UIImageView *)arrowImageView
{
    if (!_arrowImageView) {

        UIImage *im;
        if (self.model.arrowImage) {
            im = [UIImage imageNamed:self.model.arrowImage];
        } else{
            im = [UIImage imageNamed:@"ABMeProfileNewIconArrow"];
        }
        _arrowImageView = [[UIImageView alloc] initWithImage:im];
        _arrowImageView.centerY = self.contentView.centerY;
        _arrowImageView.x = viewW - _arrowImageView.width - CGXDetailViewToIndicatorGap;
    }
    return _arrowImageView;
}
- (UIImageView *)headerImageView
{
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] init];
        _headerImageView.centerY = self.contentView.centerY;
        _headerImageView.image = self.model.headerImage;

    }
    return _headerImageView;
}

- (UITextField *)textFiled
{
    if (!_textFiled) {
        _textFiled = [UITextField new];
        _textFiled.returnKeyType = UIReturnKeySearch; //设置按键类型
        _textFiled.enablesReturnKeyAutomatically = YES; //这里设置为无文字就灰色不可点
        _textFiled.backgroundColor = [UIColor clearColor];
        _textFiled.textAlignment = NSTextAlignmentRight;

         _textFiled.clearsOnBeginEditing = YES;
        _textFiled.delegate = self;
         [_textFiled addTarget:self action:@selector(textFiledDidChange:) forControlEvents:UIControlEventEditingChanged];
        //设置占位文字
        _textFiled.placeholder = self.model.placeholder;
        _textFiled.text = self.model.textfiledStr;

        _textFiled.layer.masksToBounds = YES;
        if (self.model.boroedColor) {
            _textFiled.layer.borderColor = [self.model.boroedColor CGColor];
        } else{
            _textFiled.layer.borderColor = [[UIColor colorWithWhite:0.93 alpha:1] CGColor];
        }
        if (self.model.boroedWidth) {
            _textFiled.layer.borderWidth = self.model.boroedWidth;
        }else{
            _textFiled.layer.borderWidth = 0;
        }
        if (self.model.textfiledFont) {
            _textFiled.font = [UIFont systemFontOfSize:self.model.textfiledFont];
        } else{
            _textFiled.font = [UIFont systemFontOfSize:16];
        }
        if (self.model.textfiledColor) {
            _textFiled.textColor = self.model.textfiledColor;
        } else{
            _textFiled.textColor = [UIColor blackColor];
        }
        if (self.model.placeholderColor) {
            [_textFiled setValue:self.model.placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
        } else{
            [_textFiled setValue:[UIColor colorWithWhite:.47 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
        }

        if (self.model.placeholderFont) {
            [_textFiled setValue:[UIFont boldSystemFontOfSize:self.model.placeholderFont] forKeyPath:@"_placeholderLabel.font"];
        }else{
            [_textFiled setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
        }
    }
    return _textFiled;
}
- (void)textFiledDidChange:(UITextField *)textField{
    NSLog(@"%@", textField.text);

    //如果输入框中的文字大于10，就截取前10个作为输入框的文字 if (length > 10) {
        if (self.model.textValueChanged) {
            self.model.textValueChanged(self.textFiled.text, self.model);
        }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    //textField放弃第一响应者 （收起键盘）
    //键盘是textField的第一响应者
    [textField resignFirstResponder];

    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    NSLog(@"%@", NSStringFromRange(range));
    NSLog(@"%@", string);

    //按'a'收起键盘
    if ([string isEqualToString:@"a"]) {

        [textField resignFirstResponder];
    }

    return YES;

}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{

    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    return YES;

}


- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        if (self.model.funcNameColor) {
            _detailLabel.textColor = self.model.detailTextColor;
        } else{
            _detailLabel.textColor = [UIColor blackColor];
        }
        if (self.model.funcNameFont) {
            _detailLabel.font = [UIFont systemFontOfSize:self.model.detailTextFont];
        } else{
            _detailLabel.font = [UIFont systemFontOfSize:14];
        }
        _detailLabel.text = self.model.detailText;
        _detailLabel.size = [self sizeForTitle:self.model.detailText withFont:_detailLabel.font];
        _detailLabel.centerY = self.contentView.centerY;
    }
    return _detailLabel;
}
- (UIImageView *)detailImageView
{
    if (!_detailImageView) {
        _detailImageView = [[UIImageView alloc] initWithImage:self.model.detailImage];
        _detailImageView.centerY = self.contentView.centerY;
    }
    return _detailImageView;
}


- (void)showInfoCell:(CGXConfigMeSettingItemModel *)itemModel CellStyle:(CGXConfigMeSettingManager *)manager
{
    
    self.model = itemModel;
    self.manager = manager;
    
    
    viewH = self.model.rowHeight;
    viewW = CGRectGetWidth(self.frame);
    
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];

    [self loadLeft];

    if (!self.model.isArrow) {
        [self.contentView addSubview:self.arrowImageView];
    }
    
    if (self.model.attributedSrting) {
        self.rightLabel = [UILabel new];
        [self.contentView addSubview:self.rightLabel];
        self.rightLabel.textAlignment = NSTextAlignmentRight;
        self.rightLabel.attributedText = self.model.attributedSrting;
        self.rightLabel.frame = CGRectMake(CGRectGetMaxX(self.funcNameLabel.frame)+CGXConfigSpace, 0, viewW-CGRectGetMaxX(self.funcNameLabel.frame)-CGRectGetWidth(self.arrowImageView.frame)-4*CGXConfigSpace, viewH);
    } else{
        [self loadRight];
    }
}

- (void)loadLeft
{
    if (!self.model.isLineView) {
        [self.contentView addSubview:self.bottomLine];
    }
    
    self.funcNameImgView = [[UIImageView alloc] initWithImage:self.model.funcNameImage];
    self.funcNameImgView.centerY = self.contentView.centerY;
    [self.contentView addSubview:self.funcNameImgView];
    self.funcNameImgView.x = 10;
    
    
    self.funcNameLabel = [UILabel new];
    [self.contentView addSubview:self.funcNameLabel];
    
    self.funcNameLabel.textAlignment = NSTextAlignmentLeft;
    if (self.model.funcNameColor) {
        self.funcNameLabel.textColor = self.model.funcNameColor;
    } else{
        self.funcNameLabel.textColor = [UIColor blackColor];
    }
    if (self.model.funcNameFont) {
        self.funcNameLabel.font = [UIFont systemFontOfSize:self.model.funcNameFont];
    } else{
        self.funcNameLabel.font = [UIFont systemFontOfSize:16];
    }
    
    UIFont *font;
    if (self.model.funcNameFont) {
        font =[UIFont systemFontOfSize:self.model.funcNameFont];
    } else{
        font = [UIFont systemFontOfSize:16];
    }
    self.funcNameLabel.font = font;
    CGSize nameSize = [self sizeForTitle:self.model.funcName withFont:font];
    
    self.funcNameLabel.text = self.model.funcName;
    self.funcNameLabel.frame = CGRectMake(CGRectGetMaxX(self.funcNameImgView.frame)+CGXConfigSpace, 0, ceilf(nameSize.width)+CGXConfigSpace, viewH);
}

- (void)loadRight
{
    if (self.model.isOn) {
         [self.contentView addSubview:self.aswitch];
    }


    if (self.model.headerImage) {
        [self.contentView addSubview:self.headerImageView];
        self.headerImageView.frame = CGRectMake(self.arrowImageView.x-CGXConfigSpace-(viewH-20), 10, viewH-20, viewH-20);
    }


    if (self.model.placeholder || self.model.textfiledStr) {
        [self.contentView addSubview:self.textFiled];
         self.textFiled.frame = CGRectMake(CGRectGetMaxX(self.funcNameLabel.frame)+CGXConfigSpace, 5, viewW-CGRectGetMaxX(self.funcNameLabel.frame)-self.arrowImageView.width-4*CGXConfigSpace, viewH-10);
    }


    if (self.model.detailImage) {
        [self.contentView addSubview:self.detailImageView];
        self.detailImageView.x = self.arrowImageView.x-self.detailImageView.width+CGXConfigSpace;
    }

    if (self.model.detailText) {
        [self.contentView addSubview:self.detailLabel];
         self.detailLabel.x = self.arrowImageView.x-self.detailLabel.width-CGXConfigSpace;
    }

    if (self.model.detailImage && self.model.detailText) {

        self.detailImageView.x = self.arrowImageView.x-self.detailImageView.width+CGXConfigSpace;
        self.detailLabel.x = self.detailImageView.x-self.detailLabel.width-CGXConfigSpace;
    }


}
- (UIViewController*)viewController:(UIView *)view {
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]] || [nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}


- (CGSize)sizeForTitle:(NSString *)title withFont:(UIFont *)font
{
    CGRect titleRect = [title boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : font}
                                           context:nil];
    
//    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
//
//    CGSize textSize;
//
//#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
//    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
//        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
//        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
//        NSDictionary *attributes = @{NSFontAttributeName: textFont,
//                                     NSParagraphStyleAttributeName: paragraph};
//        textSize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
//                                      options:(NSStringDrawingUsesLineFragmentOrigin |
//                                               NSStringDrawingTruncatesLastVisibleLine)
//                                   attributes:attributes
//                                      context:nil].size;
//    } else {
//        textSize = [self sizeWithFont:textFont
//                    constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
//                        lineBreakMode:NSLineBreakByWordWrapping];
//    }
//#else
//    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
//    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
//    NSDictionary *attributes = @{NSFontAttributeName: textFont,
//                                 NSParagraphStyleAttributeName: paragraph};
//    textSize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
//                                  options:(NSStringDrawingUsesLineFragmentOrigin |
//                                           NSStringDrawingTruncatesLastVisibleLine)
//                               attributes:attributes
//                                  context:nil].size;
//#endif
//
//
    
    return CGSizeMake(ceil(titleRect.size.width),
                      ceil(titleRect.size.height));
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
