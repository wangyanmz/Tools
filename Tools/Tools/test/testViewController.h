//
//  testViewController.h
//  Tools
//
//  Created by ywang on 2021/6/21.
//

#import <UIKit/UIKit.h>
#import "JXCategoryListContainerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface testViewController : UIViewController<JXCategoryListContentViewDelegate>

@property (nonatomic, strong) NSString *str;

@end

NS_ASSUME_NONNULL_END
