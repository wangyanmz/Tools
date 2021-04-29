//
//  PGDatePicker+YearMonthWeek.h
//  Demo
//
//  Created by wangyan on 2020/10/8.
//  Copyright © 2020 piggybear. All rights reserved.
//

#import "PGDatePicker.h"

NS_ASSUME_NONNULL_BEGIN

@interface PGDatePicker (YearMonthWeek)
- (void)yearMonthWeek_setupSelectedDate;
- (void)yearMonthWeek_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)yearMonthWeek_didSelectWithComponent:(NSInteger)component;

@end

NS_ASSUME_NONNULL_END
