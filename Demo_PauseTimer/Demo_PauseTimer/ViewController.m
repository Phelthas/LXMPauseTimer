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

@property (nonatomic, strong) UIButton *testButton;
@property (nonatomic, strong) NSTimer *testTimer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.testButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.testButton.backgroundColor = [UIColor orangeColor];
    [self.testButton addTarget:self action:@selector(handleTestButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.testButton];
    
    self.testTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(handleTestTimer:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action

- (void)handleTestButtonTapped:(UIButton *)sender {
    if ([self.testTimer lxm_isPaused]) {
        [self.testTimer lxm_continue];
    } else {
        [self.testTimer lxm_pause];
    }
}

- (void)handleTestTimer:(NSTimer *)sender {
    NSLog(@"date is %@", [NSDate date]);
}

@end
