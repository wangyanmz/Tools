//
//  SexRadioBoxGroup.m
//  Tools
//
//  Created by wangyan on 2021/4/27.
//

#import "SexRadioBoxGroup.h"
#import "SexRadioBox.h"

@interface SexRadioBoxGroup ()

@property (nonatomic, strong) NSMutableArray <SexRadioBox *>*btns;
@property (nonatomic, strong) UIView *animatView;

@end

@implementation SexRadioBoxGroup

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer setCornerRadius:frame.size.height / 2];
        [self.layer setBorderWidth:1.0];
        [self.layer setBorderColor:[UIColor colorWithRed:231/255.0 green:231/255.0 blue:231/255.0 alpha:1.0].CGColor];
        [self.layer setBackgroundColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor];
        
        self.titles = @[@"男", @"女"];
        self.selectedImages = @[@"boy", @"girl"];
        self.unselectedImages = @[@"boy", @"girl"];
        self.selectedBGColor = [UIColor colorWithRed:0/255.0 green:181/255.0 blue:229/255.0 alpha:1.0];
        self.selectedFontColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        self.unselectedFontColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self setUpUI];
}

- (void)setUpUI {
    for (NSInteger i = 0; i < self.titles.count; i++) {
        CGFloat btnWidth = self.frame.size.width / 2;
        CGFloat btnHeight = self.frame.size.height;
        
        UITapGestureRecognizer *tapGresture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnClick:)];
        SexRadioBox *btn = [[SexRadioBox alloc] initWithFrame:CGRectMake(i * btnWidth, 0.0, btnWidth, btnHeight) title:self.titles[i] image:self.unselectedImages[i]];
        btn.tag = i;
        [btn addGestureRecognizer:tapGresture];
        [self addSubview:btn];
        [self.btns addObject:btn];
        
        if (i == 0) {
            btn.curImageName = self.selectedImages[i];
            btn.curFontColor = self.selectedFontColor;
        }
    }
    
    self.animatView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width / 2, self.frame.size.height)];
    [self.animatView.layer setCornerRadius:self.frame.size.height / 2];
    self.animatView.layer.backgroundColor = self.selectedBGColor.CGColor;
    [self addSubview:self.animatView];
    
    for (SexRadioBox *btn in self.btns) {
        [self bringSubviewToFront:btn];
    }
}

- (void)btnClick:(UITapGestureRecognizer *)tapGresture {
    SexRadioBox *selectedBox = (SexRadioBox *)tapGresture.view;
    for (NSInteger i = 0; i < self.btns.count; i++) {
        SexRadioBox *btn = self.btns[i];
        if (btn != selectedBox) {
            btn.curImageName = self.unselectedImages[btn.tag];
            btn.curFontColor = self.unselectedFontColor;
        }
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        selectedBox.curImageName = self.selectedImages[selectedBox.tag];
        selectedBox.curFontColor = self.selectedFontColor;
        
        [self.animatView setFrame:CGRectMake(selectedBox.tag * self.frame.size.width / 2, 0, self.frame.size.width / 2, self.frame.size.height)];
    }];
    
    if (self.clickRadioBoxBlock) {
        self.clickRadioBoxBlock(selectedBox.tag);
    }
}

- (NSMutableArray<SexRadioBox *> *)btns {
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

@end
