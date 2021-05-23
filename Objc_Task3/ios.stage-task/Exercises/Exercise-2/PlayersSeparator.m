#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    int teams = 0;
    for (int i = 0; i < ratingArray.count; i++) {
        for (int j = i + 1; j < ratingArray.count; j++) {
            for (int k = j + 1; k < ratingArray.count; k++) {
                if ((ratingArray[j].intValue > ratingArray[i].intValue && ratingArray[k].intValue > ratingArray[j].intValue) || (ratingArray[j].intValue < ratingArray[i].intValue && ratingArray[k].intValue < ratingArray[j].intValue)) {
                    teams += 1;
                }
            }
        }
    }
    NSLog(@"MSg:%d", teams);
    return teams;
}

@end
