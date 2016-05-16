//
//  NSTimer+LXMPause.m
//  LXMPauseTimer
//
//  Created by luxiaoming on 16/5/9.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import "NSTimer+LXMPause.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>


@interface NSTimer ()

@property (nonatomic, strong) NSDate *pauseStartDate;
@property (nonatomic, strong) NSDate *originalFireDate;

@end

@implementation NSTimer (LXMPause)

- (BOOL)lxm_isPaused {
    if (self.pauseStartDate == nil) {
        return NO;
    } else {
        return YES;
    }
    
}

- (void)lxm_pause {
    if ([self lxm_isPaused]) {
        return;
    }
    self.pauseStartDate = [NSDate date];
    self.originalFireDate = self.fireDate;
    [self setFireDate:[NSDate distantFuture]];
}

- (void)lxm_continue {
    if (![self lxm_isPaused]) {
        return;
    }
    NSTimeInterval pausedTimeInterval = [self.pauseStartDate timeIntervalSinceNow];
    [self setFireDate:[NSDate dateWithTimeInterval:-1 * pausedTimeInterval sinceDate:self.originalFireDate]];
    self.pauseStartDate = nil;
    self.originalFireDate = nil;
}

#pragma mark - Property

- (NSDate *)pauseStartDate {
    return objc_getAssociatedObject(self, @selector(pauseStartDate));
}

- (void)setPauseStartDate:(NSDate *)pauseStartDate {
    objc_setAssociatedObject(self, @selector(pauseStartDate), pauseStartDate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDate *)originalFireDate {
    return objc_getAssociatedObject(self, @selector(originalFireDate));
}

- (void)setOriginalFireDate:(NSDate *)originalFireDate {
    objc_setAssociatedObject(self, @selector(originalFireDate), originalFireDate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
