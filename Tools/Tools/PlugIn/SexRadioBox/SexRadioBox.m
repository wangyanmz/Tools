//
//  SexRadioBox.m
//  Tools
//
//  Created by wangyan on 2021/4/27.
//

#import "SexRadioBox.h"

@interface SexRadioBox ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLbl;

@end

@implementation SexRadioBox

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(NSString *)image {
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer setBackgroundColor:[UIColor clearColor].CGColor];
        [self.layer setCornerRadius:frame.size.height / 2];
        
        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
        [self.imageView setFrame:CGRectMake(self.frame.size.width * 0.28, 7.5, 30.0, 35.0)];
        [self addSubview:self.imageView];
        
        self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.imageView.frame), 15.0, self.frame.size.width - CGRectGetMaxX(self.imageView.frame), 20.0)];
        [self.titleLbl setText:title];
        [self.titleLbl setFont:[UIFont fontWithName:@"Avenir Roman" size:16.0]];
        [self.titleLbl setTextAlignment:NSTextAlignmentLeft];
        [self.titleLbl setTextColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]];
        [self addSubview:self.titleLbl];
    }
    return self;
}

- (void)setCurImageName:(NSString *)curImageName {
    [self.imageView setImage:[UIImage imageNamed:curImageName]];
}

- (void)setCurFontColor:(UIColor *)curFontColor {
    [self.titleLbl setTextColor:curFontColor];
}

@end
