//
//  TwoViewController.m
//  Tools
//
//  Created by wangyan on 2021/4/28.
//

#import "TwoViewController.h"
#import "SexRadioBoxGroup.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SexRadioBoxGroup *btn = [[SexRadioBoxGroup alloc] initWithFrame:CGRectMake(25.0, 100.0, CGRectGetWidth(self.view.frame) - 50.0, 50.0)];
    [btn setClickRadioBoxBlock:^(NSInteger index) {
        NSLog(@"%ld", index);
    }];
    [self.view addSubview:btn];
}



@end
