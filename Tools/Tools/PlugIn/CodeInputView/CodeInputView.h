//
//  CodeInputView.h
//  
//
//  Created by wangyan on 2021/4/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    CodeInputTypeLine,  // 下划线
    CodeInputTypeBox,   // 输入框
} CodeInputType;

typedef void(^ChangeCodeTextBlock)(NSString *text);

@interface CodeInputView : UIView

/// 验证码位数，默认6位
@property (nonatomic, assign) NSInteger codeCount;
/// 输入框类型，默认下划线
@property (nonatomic, assign) CodeInputType type;
/// 输入框间隔，默认10
@property (nonatomic, assign) CGFloat space;
/// 输入框的颜色，默认#999999
@property (nonatomic, strong) UIColor *borderColor;
/// 输入后输入框的颜色，默认#00B5E5
@property (nonatomic, strong) UIColor *inputBorderColor;
/// 输入框边框的高度，默认1
@property (nonatomic, assign) CGFloat borderWidth;
/// 输入后输入框边框的高度，默认2
@property (nonatomic, assign) CGFloat inputBorderWidth;
/// 字体颜色，默认#333333
@property (nonatomic, strong) UIColor *fontColor;
/// 字体大小，默认32
@property (nonatomic, assign) CGFloat fontSize;

@property (nonatomic, copy) ChangeCodeTextBlock changeCodeTextBlock;


@end

NS_ASSUME_NONNULL_END
