//
//  PGDatePicker+YearMonthWeek.m
//  Demo
//
//  Created by wangyan on 2020/10/8.
//  Copyright © 2020 piggybear. All rights reserved.
//

#import "PGDatePicker+YearMonthWeek.h"
#import "PGDatePickerHeader.h"
#import "PGDatePicker+Logic.h"
#import "PGDatePicker+Common.h"

@implementation PGDatePicker (YearMonthWeek)

- (void)yearMonthWeek_setupSelectedDate {
    NSString *yearString = [self.pickerView textOfSelectedRowInComponent:0];
    yearString = [yearString componentsSeparatedByString:self.yearString].firstObject;
    
    NSString *monthString = [self.pickerView textOfSelectedRowInComponent:1];
    monthString = [monthString componentsSeparatedByString:self.monthString].firstObject;
    
    NSString *weekString = [self.pickerView textOfSelectedRowInComponent:2];
    weekString = [weekString componentsSeparatedByString:self.weekString].firstObject;
    weekString = [weekString substringFromIndex:1];
    
    self.selectedComponents.year = [yearString integerValue];
    self.selectedComponents.month = [monthString integerValue];
    self.selectedComponents.weekOfMonth = [weekString integerValue];
}

- (void)yearMonthWeek_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated {
    if (components.year > self.maximumComponents.year) {
        components.year = self.maximumComponents.year;
    } else if (components.year < self.minimumComponents.year) {
        components.year = self.minimumComponents.year;
    }
    
    NSInteger row = components.year - self.minimumComponents.year;
    [self.pickerView selectRow:row inComponent:0 animated:animated];
    {
        NSInteger row = 0;
        NSString *string = [NSString stringWithFormat:@"%ld", (long)components.month];
        BOOL isExist = [self.monthList containsObject:string];
        if (isExist) {
            row = [self.monthList indexOfObject:string];
        }
        [self.pickerView selectRow:row inComponent:1 animated:animated];
        
        NSInteger week = 0;
        NSString *str = [NSString stringWithFormat:@"%ld", (long)components.weekday];
        BOOL isExistWeek = [self.weekList containsObject:str];
        if (isExistWeek) {
            week = [self.weekList indexOfObject:str];
        }

        [self.pickerView selectRow:week inComponent:2 animated:animated];
    }
}

- (void)yearMonthWeek_didSelectWithComponent:(NSInteger)component {
    NSDateComponents *dateComponents = [self.calendar components:self.unitFlags fromDate:[NSDate date]];
    NSString *str = [[self.pickerView textOfSelectedRowInComponent:0] componentsSeparatedByString:self.yearString].firstObject;
    dateComponents.year = [str integerValue];
    if (component == 0) {
        BOOL refresh = [self setMonthListWithComponents:dateComponents refresh:true];
        [self.pickerView reloadComponent:1 refresh:refresh];
    }
}

@end
