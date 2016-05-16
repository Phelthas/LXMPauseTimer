//
//  NSTimer+LXMPause.h
//  LXMPauseTimer
//
//  Created by luxiaoming on 16/5/9.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (LXMPause)

- (BOOL)lxm_isPaused;

- (void)lxm_pause;

- (void)lxm_continue;

@end
