#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *outcome = [NSMutableString new];
    
    int i = 0;
    int j = 0;
    while (i < string1.length && j < string2.length) {
        if ([string1 UTF8String][i] <= [string2 UTF8String][j]) {
            [outcome appendFormat:@"%c", [string1 characterAtIndex:i]];
            i += 1;
        } else {
            [outcome appendFormat:@"%c", [string2 characterAtIndex:j]];
            j += 1;
        }
    }
    if (i < string1.length) {
        for (int k = i; k < string1.length; k++) {
            [outcome appendFormat:@"%c", [string1 characterAtIndex:k]];
        }
    }
    if (j < string2.length) {
        for (int k = j; k < string2.length; k++) {
            [outcome appendFormat:@"%c", [string2 characterAtIndex:k]];
        }
    }
    return outcome;
}

@end
