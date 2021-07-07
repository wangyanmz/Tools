//
//  FontAndColorMacros.h
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/18.
//  Copyright © 2017年 徐阳. All rights reserved.
//

//字体大小和颜色配置

#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h

#pragma mark -  间距区

//默认左右间距
#define KNormalSpace    15.0f
#define kNormalTopSpace 15.0

#pragma mark -  深色模式
// view
#define kDKViewBgColor(view, color)         [view dk_setBackgroundColorPicker:DKColorPickerWithKey(color)]
#define KDKViewBorderColor(view, color)     [view.layer setDk_borderColorPicker:DKColorPickerWithKey(color)]
// label
#define kDKLabelTextColor(label, color)     [label dk_setTextColorPicker:DKColorPickerWithKey(color)]
// button
#define kDKButtonTitleColor(button, color, state)  [button dk_setTitleColorPicker:DKColorPickerWithKey(color) forState:state]

#pragma mark -  颜色区
// 控制器背景色
#define kAppViewBgVColor    [UIColor colorWithHexString:@"FFFFFF"]
// 控制器内view背景色
#define kAppSubViewBgColor  [UIColor colorWithHexString:@"F7F9FA"]
// 边框颜色
#define kAppBorderColor     [UIColor colorWithHexString:@"C0CBD4"]
// 标题颜色
#define kAppTitleColor      [UIColor colorWithHexString:@"333333"]
// 文字内容颜色
#define kAppContentColor    [UIColor colorWithHexString:@"999999"]
// 次级字色
#define kAppSubTitleColor   [UIColor colorWithHexString:@"7F7F7F"]
// App主题色调
#define KAppThemeColor      kColor([RPThemeModel sharedInstance].color)

//主题色 导航栏颜色
#define KNavBgColor         kColor(@"FFFFFF")
//默认控制器背景色
#define KContollerBgColor   [UIColor colorWithHexString:@"F6F7F9"]
//分割线颜色
#define KLineColor          [UIColor colorWithHexString:@"DDDDDD"]
//placeholder字色
#define KPlaceholderColor   [UIColor colorWithHexString:@"BEBEBE"]
//删除按钮颜色
#define kDeleteColor        kColor(@"E93F3F")


#define KClearColor [UIColor clearColor]
#define KWhiteColor [UIColor whiteColor]
#define kRandomColor    KColorRGB(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))        //随机色生成
#define KColorRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:255.0/255.0]
#define kColor(_colorStr_) [UIColor colorWithHexString:_colorStr_]

#pragma mark -  样式区

#define kLoginAreaButtonHeight  50.0
#define KNormalButtonHeight     40.0
#define kLoginAreaButtonCorner  4.0
#define kNormalButtonCorner     4.0

#pragma mark -  字体区
#define kBFont(font)             [UIFont boldSystemFontOfSize:font]
#define KNameFont(NAME, font)    [UIFont fontWithName:(NAME) size:font]
#define kFont(font)              [UIFont systemFontOfSize:font]
#define KString(string)          NSLocalizedString(string, nil)

#endif /* FontAndColorMacros_h */
