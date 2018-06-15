//
//  WKFunctionNode.m
//  TextureDemo
//
//  Created by mac on 2018/6/15.
//  Copyright © 2018年 weikun. All rights reserved.
//

#import "WKFunctionNode.h"

@implementation WKFunctionNode
{
    ASButtonNode *_downloadNode;
    ASButtonNode *_checkContractNode;
    ASButtonNode *_applyRepairNode;
}

- (instancetype)init {
    if (self == [super init]) {
        _downloadNode = [[ASButtonNode alloc] init];
        _downloadNode.backgroundColor = [UIColor orangeColor];
        [_downloadNode setTitle:@"按钮1" withFont:[UIFont systemFontOfSize:14] withColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubnode:_downloadNode];
        
        _checkContractNode = [[ASButtonNode alloc] init];
        _checkContractNode.backgroundColor = [UIColor orangeColor];
        [_checkContractNode setTitle:@"按钮2" withFont:[UIFont systemFontOfSize:14] withColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubnode:_checkContractNode];
        
        _applyRepairNode = [[ASButtonNode alloc] init];
        _applyRepairNode.backgroundColor = [UIColor orangeColor];
        [_applyRepairNode setTitle:@"按钮3" withFont:[UIFont systemFontOfSize:14] withColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubnode:_applyRepairNode];
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    _downloadNode.style.height = ASDimensionMake(44.0);
    
    _downloadNode.style.flexGrow = 1.0;
    _checkContractNode.style.flexGrow = 1.0;
    _applyRepairNode.style.flexGrow = 1.0;
    
    return [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:1.0 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStretch children:@[_downloadNode, _checkContractNode, _applyRepairNode]];
}

@end
