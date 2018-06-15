//
//  WKSampleNode.m
//  TextureDemo
//
//  Created by mac on 2018/6/15.
//  Copyright © 2018年 weikun. All rights reserved.
//

#import "WKSampleNode.h"

@implementation WKSampleNode
- (instancetype)init {
    if (self == [super init]) {
        _textNode = [[ASTextNode alloc] init];
        [self addSubnode:_textNode];
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    _textNode.style.height = ASDimensionMake(44);
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 15, 10, 15) child:_textNode];
}

@end
