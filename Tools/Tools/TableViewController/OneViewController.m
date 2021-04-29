//
//  OneViewController.m
//  Tools
//
//  Created by wangyan on 2021/4/28.
//

#import "OneViewController.h"
#import "CodeInputView.h"
#import "UIColor+Hex.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CodeInputView *inputView = [[CodeInputView alloc] initWithFrame:CGRectMake(20.0, 100.0, CGRectGetWidth(self.view.frame) - 40.0, 80.0)];
    inputView.codeCount = 6;
    inputView.type = CodeInputTypeLine;
    [self.view addSubview:inputView];
    [inputView setChangeCodeTextBlock:^(NSString * _Nonnull text) {
        NSLog(@"%@", text);
    }];
}



@end
