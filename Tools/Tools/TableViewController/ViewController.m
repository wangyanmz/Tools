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
    
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    // 获取日历标示符
//    NSString *calendarIdentifier =  calendar.calendarIdentifier;
//    // 获取地区信息
//        /*
//            语言地区
//        */
//    NSString *localeIdentifier = calendar.locale.localeIdentifier;
//    NSString *localeIdentifier2 = [calendar.locale objectForKey:NSLocaleIdentifier];
//
//    // 获取时区信息
//    NSTimeZone *timeZone = calendar.timeZone;
//
//    // 获取每周的第一天从星期几开始
//    /*
//     缺省为星期天
//     */
//    NSUInteger firstWeekday = calendar.firstWeekday;
//
//    // 获取第一周必须包含的最少天数
//    /*
//     缺省为 1
//     */
//    NSUInteger minimumDaysInFirstWeek = calendar.minimumDaysInFirstWeek;
//
//    NSLog(@"-%@", calendarIdentifier);
//    NSLog(@"--%@", localeIdentifier);
//    NSLog(@"---%@", localeIdentifier2);
//    NSLog(@"----%@", timeZone);
//    NSLog(@"----%lu", (unsigned long)firstWeekday);
//    NSLog(@"----%lu", (unsigned long)minimumDaysInFirstWeek);
//
//    NSArray *month1 = calendar.monthSymbols;
//    NSArray *month2 = calendar.shortMonthSymbols;
//    NSString *dateStr1 = @"";
//    NSString *dateStr2 = @"";
//    for (NSString *str in month1) {
//        dateStr1 = [dateStr1 stringByAppendingFormat:@"-%@-", str];
//
//    }
//
//    for (NSString *str in month2) {
//        dateStr2 = [dateStr2 stringByAppendingFormat:@"-%@-", str];
//    }

//    BRDatePickerView *datePickerView = [[BRDatePickerView alloc] init];
//    datePickerView.pickerMode = BRDatePickerModeDate;
//    datePickerView.minDate = [NSDate br_setYear:1900 month:1 day:1];
//    datePickerView.maxDate = [NSDate br_setYear:2100 month:12 day:31];
//    [datePickerView show];
    [self.view addSubview:self.datePicker];
    [self.datePicker setFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 216)];
    [self.datePicker setBackgroundColor:[UIColor orangeColor]];
}

- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc]init];
        _datePicker.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 80);
        _datePicker.backgroundColor = [UIColor whiteColor];
        _datePicker.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        _datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
        _datePicker.datePickerMode = UIDatePickerModeDate;
//        _datePicker.minimumDate = [NSDate br_setYear:1900 month:1 day:1];
//        _datePicker.maximumDate = [NSDate br_setYear:2099 month:12 day:31];
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
