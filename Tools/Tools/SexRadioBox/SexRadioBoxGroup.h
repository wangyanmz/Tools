//
//  SexRadioBoxGroup.h
//  Tools
//
//  Created by wangyan on 2021/4/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickRadioBoxBlock)(NSInteger index);

@interface SexRadioBoxGroup : UIView

/// 标题，默认男、女
@property (nonatomic, strong) NSArray <NSString *>*titles;
/// 选中图片
@property (nonatomic, strong) NSArray <NSString *>*selectedImages;
/// 未选中图片
@property (nonatomic, strong) NSArray <NSString *>*unselectedImages;
/// 选中背景色，默认#00B5E5
@property (nonatomic, strong) UIColor *selectedBGColor;
/// 选中文字颜色，默认#FFFFFF
@property (nonatomic, strong) UIColor *selectedFontColor;
/// 未选中文字颜色，默认#333333
@property (nonatomic, strong) UIColor *unselectedFontColor;
/// 点击回调闭包
@property (nonatomic, copy) ClickRadioBoxBlock clickRadioBoxBlock;

@end

NS_ASSUME_NONNULL_END
