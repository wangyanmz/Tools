//
//  define.h
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/18.
//  Copyright © 2017年 徐阳. All rights reserved.
//

// 全局工具类宏定义

#ifndef define_h
#define define_h

//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define KLog(format, ...) printf("[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define KLog(format, ...)
#endif


//获取系统对象
#define kApplication        [UIApplication sharedApplication]
#define kAppWindow          [UIApplication sharedApplication].delegate.window
#define kAppDelegate        [AppDelegate shareAppDelegate]
#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight kStatusBarHeight  + 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

#define iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

// iPhone X以上机型宏定义
#define kNavBarHeightX       (iPhoneX ? 88.0 : 64.0)
#define kTabBarHeightX       (iPhoneX ? (49.0 + 34.0) : 49.0)
#define kStatusBarHeightX    (iPhoneX ? 44.0 : 20.0)
#define kBottomMargin        (iPhoneX ? 34.0 : 0.0)
#define kSafeAreaViewHeight  KScreenHeight - kNavBarHeightX - kTabBarHeightX
#define kSafeAreaBottomMargin (iPhoneX ? 34 : 0)

//获取屏幕宽高
#define KScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreen_Bounds [UIScreen mainScreen].bounds

#define Iphone6ScaleWidth KScreenWidth/375.0
#define Iphone6ScaleHeight KScreenHeight/667.0
//根据ip6的屏幕来拉伸
#define kRealValue(with) (with)


//强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

//View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

//property 属性快速声明 别用宏定义了，使用代码块+快捷键实现吧

// 当前系统版本
#define CurrentSystemVersion [[UIDevice currentDevice].systemVersion doubleValue]
// 当前APP版本
#define CurrentAppVersion    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//当前语言
#define CurrentLanguage (［NSLocale preferredLanguages] objectAtIndex:0])


//拼接字符串
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

#pragma mark
#pragma mark 边距等其他公用UI数据相关
//自定义弹框的确认按钮tag
#define alertViewTag 101
// 界面边距
#define indexMargin 15
//#define topMargin 12
#define btnMargin 70//按钮左右边距
#define TFMargin 25
// btn 圆角
#define MaincornerRadius 8.0
// btn 高度
#define MainBtnHeight 45

//pickerView 高度
#define PickerViewHeight 211
//有背景图的背景图的高度
#define backImageViewHeight 417/2
//白色view 距离顶部的高度
#define contentDisTopHeight 160

#define mark - App边距等其他公用UI数据相关

// 水平边距
#define kHorizontalMargin 18.0

#pragma mark - 图片和字符串相关
#define PlaceHolderImage [UIImage imageNamed:@"暂无数据"] //公用缺省图片
#define HeaderPlaceHolderImage [UIImage imageNamed:@"默认头像"] //头像缺省图片
#define AddAuthoPlaceHolderImage [UIImage imageNamed:@"add"] //添加图片缺省图
#define setMyImage(_imageStr_) [UIImage imageNamed:_imageStr_]



//定义UIImage对象
#define ImageWithFile(_pointer) [UIImage imageWithContentsOfFile:([[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@%dx", _pointer, (int)[UIScreen mainScreen].nativeScale] ofType:@"png"])]
#define IMAGE_NAMED(name) [UIImage imageNamed:name]

//数据验证
#define StrValid(f) (f!=nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])
#define SafeStr(f) (StrValid(f) ? f:@"")
#define HasString(str,key) ([str rangeOfString:key].location!=NSNotFound)

#define ValidStr(f) StrValid(f)
#define ValidDict(f) (f!=nil && [f isKindOfClass:[NSDictionary class]])
#define ValidArray(f) (f!=nil && [f isKindOfClass:[NSArray class]] && [f count]>0)
#define ValidNum(f) (f!=nil && [f isKindOfClass:[NSNumber class]])
#define ValidClass(f,cls) (f!=nil && [f isKindOfClass:[cls class]])
#define ValidData(f) (f!=nil && [f isKindOfClass:[NSData class]])

//获取一段时间间隔
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime  NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)
//打印当前方法名
#define ITTDPRINTMETHODNAME() ITTDPRINT(@"%s", __PRETTY_FUNCTION__)


//发送通知
#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];

//单例化一个类
#define SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

#endif /* define_h */
