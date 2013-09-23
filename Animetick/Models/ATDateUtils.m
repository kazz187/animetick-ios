#import "ATDateUtils.h"

static const NSUInteger ATDateUtilsDayStartHourConsiderMidnight = 5;

@implementation ATDateUtils

+ (NSInteger)daysDifferenceConsiderMidnight:(NSDate*)currentDate with:(NSDate*)animeStartDate
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *currentDayStartDate = [self adjustToDayStartHour:currentDate withCalendar:calendar];
    
    NSDateComponents *components = [calendar components:NSDayCalendarUnit
                                               fromDate:currentDayStartDate
                                                 toDate:animeStartDate
                                                options:0];
    NSInteger daysDifference = [components day];
    return daysDifference;
}

#pragma mark - Internals

+ (NSDate*)adjustToDayStartHour:(NSDate*)date withCalendar:(NSCalendar*)calendar
{
    NSDateComponents *components = [calendar
                                    components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit
                                    fromDate:date];
    if (components.hour < ATDateUtilsDayStartHourConsiderMidnight) {
        components.day -= 1;
    }
    components.hour = ATDateUtilsDayStartHourConsiderMidnight;
    return [calendar dateFromComponents:components];
}

@end
