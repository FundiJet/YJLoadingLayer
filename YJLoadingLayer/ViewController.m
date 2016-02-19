//
//  ViewController.m
//  YJLoadingLayer
//
//  Created by Jet on 16/1/21.
//  Copyright © 2016年 Jet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CAReplicatorLayer *loadingLayer = [CAReplicatorLayer layer];
    loadingLayer.bounds = CGRectMake(0, 0, 60, 60);
    loadingLayer.position = self.view.center;
    [self.view.layer addSublayer:loadingLayer];
    
    CALayer *block = [CALayer layer];
    CGFloat wh = 6;
    block.backgroundColor = [UIColor orangeColor].CGColor;
    block.bounds = CGRectMake(0, 0, wh, wh);
    block.position = CGPointMake(30, 10);
    block.cornerRadius = wh / 2;
    [loadingLayer addSublayer:block];
    
    NSInteger count = 15;
    CGFloat angle = M_PI * 2 / count;
    CGFloat duration = 1;
    loadingLayer.instanceCount = count;
    loadingLayer.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0);
    loadingLayer.instanceDelay = duration / count;
    
    CABasicAnimation *shrink = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shrink.fromValue = @(1.0);
    shrink.toValue = @(0.1);
    shrink.duration = duration;
    shrink.repeatCount = CGFLOAT_MAX;
    
    [block addAnimation:shrink forKey:@"Shrink"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
