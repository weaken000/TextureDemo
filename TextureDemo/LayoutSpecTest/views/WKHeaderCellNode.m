//
//  WKHeaderCellNode.m
//  TextureDemo
//
//  Created by mac on 2018/6/12.
//  Copyright © 2018年 weikun. All rights reserved.
//

#import "WKHeaderCellNode.h"

@implementation WKHeaderCellNode {
    ASTextNode *_stateNode;
}
//init方法在通过block方法来创建的时候会在一部线程调用，不要添加UIKit相关的方法在init内，而是应该放在didLoad
- (instancetype)init {
    if (self == [super init]) {
        [self setupSubNode];
    }
    return self;
}

- (void)didLoad {
    [super didLoad];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setupSubNode {
    
    self.automaticallyManagesSubnodes = YES;
    
    _stateNode = [[ASTextNode alloc] init];
    _stateNode.layerBacked = YES;
    _stateNode.style.flexShrink = 1.0;

    NSString *str = @"已完成";
    _stateNode.attributedText = [[NSAttributedString alloc] initWithString:str attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:19.0]}];
}
//异步线程调用
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    ASCenterLayoutSpec *centerSpec = [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY sizingOptions:0 child:_stateNode];
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(20, 15, 20, 15) child:centerSpec];
}

- (void)didEnterVisibleState {
    [super didEnterVisibleState];
    NSLog(@"进入可见");
}
- (void)didExitVisibleState {
    [super didExitVisibleState];
    NSLog(@"不可见");
}


@end
