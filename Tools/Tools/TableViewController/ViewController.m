//
//  ViewController.m
//  Tools
//
//  Created by wangyan on 2021/4/27.
//

#import "ViewController.h"
#import "BRPickerView.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    BRDatePickerView *datePickerView = [[BRDatePickerView alloc] init];
    datePickerView.pickerMode = BRDatePickerModeDate;
    datePickerView.minDate = [NSDate br_setYear:1900 month:1 day:1];
    datePickerView.maxDate = [NSDate br_setYear:2100 month:12 day:31];
    [datePickerView show];
//    [self.view addSubview:self.datePicker];
//    [self.datePicker setFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 216)];
//    [self.datePicker setBackgroundColor:[UIColor orangeColor]];
}

- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc]init];
        _datePicker.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 80);
        _datePicker.backgroundColor = [UIColor whiteColor];
        _datePicker.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        _datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
        _datePicker.datePickerMode = UIDatePickerModeDate;
        [_datePicker addTarget:self action:@selector(didSelectValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _datePicker;
}

- (void)didSelectValueChanged:(UIDatePicker *)datePicker {
    NSDate *date = datePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [formatter stringFromDate:date];
    NSLog(@"%@", dateStr);
}

@end
