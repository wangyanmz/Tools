//
//  testViewController.m
//  Tools
//
//  Created by ywang on 2021/6/21.
//

#import "testViewController.h"

#define COLOR_WITH_RGB(R,G,B,A) [UIColor colorWithRed:R green:G blue:B alpha:A]

@interface testViewController ()

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.backView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 200, 200.0)];
//    self.backView.backgroundColor = COLOR_WITH_RGB(arc4random()%255/255.0, arc4random()%255/255.0, arc4random()%255/255.0, 1);
//    [self.view addSubview:self.backView];
    
//    [self.view setBackgroundColor:COLOR_WITH_RGB(arc4random()%255/255.0, arc4random()%255/255.0, arc4random()%255/255.0, 1)];
}

- (UIView *)listView {
    return self.backView;
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 200, 200.0)];
        _backView.backgroundColor = COLOR_WITH_RGB(arc4random()%255/255.0, arc4random()%255/255.0, arc4random()%255/255.0, 1);
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 20.0, 160.0, 160.0)];
        self.label.text = self.str;
        self.label.font = [UIFont boldSystemFontOfSize:20.0];
        self.label.textColor = [UIColor whiteColor];
        [_backView addSubview:self.label];
    }
    return _backView;
}

@end
