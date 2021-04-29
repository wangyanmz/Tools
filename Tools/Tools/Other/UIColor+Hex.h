//
//  UIColor+Hex.h
//  JiJianMobilePlat
//
//  Created by wangyan on 2020/3/18.
//  Copyright © 2020 wangyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)

// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *) colorWithHexString:(NSString *)color;
+ (UIColor *) colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

// 获取RGB数字
+ (NSDictionary *) dictionaryWithHexString:(NSString *)color;

@end

NS_ASSUME_NONNULL_END
