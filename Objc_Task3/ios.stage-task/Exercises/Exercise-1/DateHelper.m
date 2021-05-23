#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber < 1 || monthNumber > 12) {
        return nil;
    }
    NSArray *months = @[@"January", @"February", @"March", @"April", @"May", @"June", @"Jule", @"August", @"September", @"October", @"November", @"December"];
    return months[monthNumber - 1];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
     NSDate *d = [dateFormatter dateFromString:date];
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * dateComponents = [calendar components: NSCalendarUnitDay | NSCalendarUnitWeekday fromDate: d];
    if (dateComponents != nil) {
        return dateComponents.day;
    }
    return 0;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSArray *weekDays = @[@"Вкр", @"Пн", @"Вт", @"Ср", @"Чт", @"Пт", @"Сб"];
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * dateComponents = [calendar components: NSCalendarUnitDay | NSCalendarUnitWeekday fromDate: date];
    if (dateComponents != nil) {
        return weekDays[dateComponents.weekday - 1];
    }
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *todaysComponents = [gregorian components:NSCalendarUnitWeekOfYear fromDate:[NSDate date]];
    NSUInteger todaysWeek = [todaysComponents weekOfYear];
    NSDateComponents *otherComponents = [gregorian components:NSCalendarUnitWeekOfYear fromDate:date];
    NSUInteger datesWeek = [otherComponents weekOfYear];
    if (todaysWeek == datesWeek){
        return YES;
    }
    return NO;
}

@end
