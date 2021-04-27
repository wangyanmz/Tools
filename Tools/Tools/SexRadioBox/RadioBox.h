//
//  SexRadioBox.h
//  Tools
//
//  Created by wangyan on 2021/4/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickRadioBoxBlock)(NSInteger index);

@interface SexRadioBox : UIView

@property (nonatomic, strong) NSString *curImageName;
@property (nonatomic, strong) UIColor *curFontColor;
@property (nonatomic, copy) ClickRadioBoxBlock clickRadioBoxBlock;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(NSString *)image;

@end

NS_ASSUME_NONNULL_END
