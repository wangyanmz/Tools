//
//  ViewController.m
//  Tools
//
//  Created by wangyan on 2021/4/27.
//

#import "ViewController.h"

#import "SexRadioBoxGroup.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SexRadioBoxGroup *btn = [[SexRadioBoxGroup alloc] initWithFrame:CGRectMake(25.0, 100.0, self.view.frame.size.width - 50.0, 50.0)];
    [btn setClickRadioBoxBlock:^(NSInteger index) {
        NSLog(@"%ld", index);
    }];
    [self.view addSubview:btn];
}


@end
