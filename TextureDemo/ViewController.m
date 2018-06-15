//
//  ViewController.m
//  TextureDemo
//
//  Created by mac on 2018/6/12.
//  Copyright © 2018年 weikun. All rights reserved.
//

#import "ViewController.h"
#import "WKOrderViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    WKOrderViewController *next = [WKOrderViewController new];
    [self presentViewController:next animated:YES completion:nil];
}
@end
