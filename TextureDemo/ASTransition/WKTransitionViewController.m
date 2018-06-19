//
//  WKTransitionViewController.m
//  TextureDemo
//
//  Created by mac on 2018/6/15.
//  Copyright © 2018年 weikun. All rights reserved.
//

#import "WKTransitionViewController.h"

#import "WKTransitionNode.h"

@interface WKTransitionViewController ()

@property (nonatomic, strong) WKTransitionNode *transitionNode;

@end

@implementation WKTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    _transitionNode = [[WKTransitionNode alloc] init];
    [self.view addSubnode:_transitionNode];
    _transitionNode.frame = CGRectMake(0, 0, 100, 100);
    _transitionNode.position = CGPointMake(self.view.frame.size.width*0.5, self.view.frame.size.height*0.5);
 
}


@end
