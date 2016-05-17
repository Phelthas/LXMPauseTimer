//
//  ViewController.m
//  Demo_PauseTimer
//
//  Created by luxiaoming on 16/5/16.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import "ViewController.h"
#import "NSTimer+LXMPause.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIButton *testButton;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;


@property (nonatomic, strong) NSTimer *testTimer;
@property (nonatomic, assign) NSInteger count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.count = 0;
    [self.testButton addTarget:self action:@selector(handleTestButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.testTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(handleTestTimer:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action

- (void)handleTestButtonTapped:(UIButton *)sender {
    if ([self.testTimer lxm_isPaused]) {
        [self.testTimer lxm_continue];
        [sender setTitle:@"pause" forState:UIControlStateNormal];
    } else {
        [self.testTimer lxm_pause];
        [sender setTitle:@"continue" forState:UIControlStateNormal];
    }
}

- (void)handleTestTimer:(NSTimer *)sender {
    self.count++;
    self.tipLabel.text = [NSString stringWithFormat:@"%@", @(self.count)];
}

@end
