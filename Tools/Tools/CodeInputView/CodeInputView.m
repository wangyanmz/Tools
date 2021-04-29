//
//  CodeInputView.m
//  
//
//  Created by wangyan on 2021/4/27.
//

#import "CodeInputView.h"

@interface CodeInputView ()<UITextViewDelegate>

/// 输入框
@property (nonatomic, strong) UITextView *textView;
/// 光标
@property (nonatomic, strong) NSMutableArray <CAShapeLayer *>*cursors;
/// 输入框背景
@property (nonatomic, strong) NSMutableArray <CALayer *>*layers;
/// 显示的文本
@property (nonatomic, strong) NSMutableArray *labels;

@end

@implementation CodeInputView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.codeCount = 6;
        self.type = CodeInputTypeLine;
        self.space = 10.0;
        self.borderColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        self.borderWidth = 1;
        self.inputBorderColor = [UIColor colorWithRed:0/255.0 green:181/255.0 blue:229/255.0 alpha:1.0];
        self.inputBorderWidth = 2;
        self.fontColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        self.fontSize = 32.0;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    if (self.labels.count == 0) {
        [self setUpUI];
    }
}

- (void)setUpUI {
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat codeBoxWidth = (width - self.space * (self.codeCount - 1)) / self.codeCount;
    
    [self addSubview:self.textView];
    
    //默认编辑第一个.
    [self beginEdit];
    
    for (int i = 0; i < self.codeCount; i ++) {
        UIView *subView = [UIView new];
        subView.frame = CGRectMake((codeBoxWidth + self.space) * i, 0, codeBoxWidth, height);
        subView.userInteractionEnabled = NO;
        [self addSubview:subView];
        
        if (self.type == CodeInputTypeLine) {
            CALayer *layer = [[CALayer alloc] init];
            layer.frame = CGRectMake(0, height -  self.borderWidth, codeBoxWidth, self.borderWidth);
            layer.backgroundColor = self.borderColor.CGColor;
            [subView.layer addSublayer:layer];
            [self.layers addObject:layer];
        } else if (self.type == CodeInputTypeBox) {
            CALayer *layer = [[CALayer alloc] init];
            layer.frame = subView.bounds;
            layer.cornerRadius = 2.0;
            layer.borderWidth =  self.borderWidth;
            layer.borderColor = self.borderColor.CGColor;
            [subView.layer addSublayer:layer];
            [self.layers addObject:layer];
        }
        
        //Label
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(0, 0, codeBoxWidth, height);
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = self.fontColor;
        label.font = [UIFont systemFontOfSize:self.fontSize];
        [subView addSubview:label];
        //光标
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(codeBoxWidth / 2, 15, 2, height - 30)];
        CAShapeLayer *line = [CAShapeLayer layer];
        line.path = path.CGPath;
        line.fillColor =  [UIColor darkGrayColor].CGColor;
        [subView.layer addSublayer:line];
        if (i == 0) {
            [line addAnimation:[self opacityAnimation] forKey:@"kOpacityAnimation"];
            //高亮颜色
            line.hidden = NO;
        }else {
            line.hidden = YES;
        }
        //把光标对象和label对象装进数组
        [self.cursors addObject:line];
        [self.labels addObject:label];
    }
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    NSString *verStr = textView.text;
    if (verStr.length > self.codeCount) {
        textView.text = [textView.text substringToIndex:self.codeCount];
    }
    
    //大于等于最大值时, 结束编辑
    if (verStr.length >= self.codeCount) {
        [self endEdit];
    }
    
    if (self.changeCodeTextBlock) {
        self.changeCodeTextBlock(textView.text);
    }
    
    for (int i = 0; i < self.labels.count; i ++) {
        UILabel *label = self.labels[i];
        CALayer *layer = self.layers[i];
        
        if (i < verStr.length) {
            [self changeViewLayerIndex:i linesHidden:YES];
            label.text = [verStr substringWithRange:NSMakeRange(i, 1)];
            
            if (self.type == CodeInputTypeLine) {
                CGRect frame = layer.frame;
                frame.size.height = self.inputBorderWidth;
                layer.frame = frame;
                layer.backgroundColor = self.inputBorderColor.CGColor;
            }
        } else {
            [self changeViewLayerIndex:i linesHidden:i == verStr.length ? NO : YES];
            //textView的text为空的时候
            if (!verStr && verStr.length == 0) {
                [self changeViewLayerIndex:0 linesHidden:NO];
            }
            label.text = @"";
            
            if (self.type == CodeInputTypeLine) {
                CGRect frame = layer.frame;
                frame.size.height = self.borderWidth;
                layer.frame = frame;
                layer.backgroundColor = self.borderColor.CGColor;
            }
        }
    }
}

//设置光标显示隐藏
- (void)changeViewLayerIndex:(NSInteger)index linesHidden:(BOOL)hidden {
    CAShapeLayer *line = self.cursors[index];
    if (hidden) {
        [line removeAnimationForKey:@"kOpacityAnimation"];
    }else{
        [line addAnimation:[self opacityAnimation] forKey:@"kOpacityAnimation"];
    }
    [UIView animateWithDuration:0.25 animations:^{
        line.hidden = hidden;
    }];
}
//开始编辑
- (void)beginEdit{
    [self.textView becomeFirstResponder];
}
//结束编辑
- (void)endEdit{
    [self.textView resignFirstResponder];
}
//闪动动画
- (CABasicAnimation *)opacityAnimation {
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @(1.0);
    opacityAnimation.toValue = @(0.0);
    opacityAnimation.duration = 0.9;
    opacityAnimation.repeatCount = HUGE_VALF;
    opacityAnimation.removedOnCompletion = YES;
    opacityAnimation.fillMode = kCAFillModeForwards;
    opacityAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    return opacityAnimation;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        _textView.tintColor = [UIColor clearColor];
        _textView.backgroundColor = [UIColor clearColor];
        _textView.textColor = [UIColor clearColor];
        _textView.delegate = self;
        _textView.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _textView;
}

- (NSMutableArray<CAShapeLayer *> *)cursors {
    if (!_cursors) {
        _cursors = [NSMutableArray array];
    }
    return _cursors;
}

- (NSMutableArray *)labels {
    if (!_labels) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}

- (NSMutableArray<CALayer *> *)layers {
    if (!_layers) {
        _layers = [NSMutableArray array];
    }
    return _layers;
}

@end
