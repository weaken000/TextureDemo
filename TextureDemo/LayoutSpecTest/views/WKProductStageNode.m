//
//  ASProductStageNode.m
//  TextureDemo
//
//  Created by mac on 2018/6/15.
//  Copyright © 2018年 weikun. All rights reserved.
//

#import "WKProductStageNode.h"

@implementation WKProductStageNode
{
    ASTextNode *_stageTextNode;
    ASButtonNode *_payButtonNode;
    ASButtonNode *_repairButtonNode;
    
    ASDisplayNode *_lineNode;
}

- (instancetype)init {
    if (self == [super init]) {

        _lineNode = [[ASDisplayNode alloc] init];
        _lineNode.backgroundColor = [UIColor grayColor];
        _lineNode.style.height = ASDimensionMake(1);
        [self addSubnode:_lineNode];
        
        _stageTextNode = [[ASTextNode alloc] init];
        _stageTextNode.layerBacked = YES;
        [self addSubnode:_stageTextNode];
        
        _payButtonNode = [[ASButtonNode alloc] init];
        _payButtonNode.cornerRadius = 11;
        _payButtonNode.backgroundColor = [UIColor grayColor];
        _payButtonNode.borderColor = [UIColor blackColor].CGColor;
        _payButtonNode.borderWidth = 1.0;
        [_payButtonNode setTitle:@"支付" withFont:[UIFont systemFontOfSize:14] withColor:[UIColor blackColor] forState:UIControlStateNormal];
        _payButtonNode.style.preferredSize = CGSizeMake(50, 22);
        [self addSubnode:_payButtonNode];
        
        _repairButtonNode = [[ASButtonNode alloc] init];
        _repairButtonNode.cornerRadius = 11;
        _repairButtonNode.backgroundColor = [UIColor grayColor];
        _repairButtonNode.borderColor = [UIColor blackColor].CGColor;
        _repairButtonNode.borderWidth = 1.0;
        [_repairButtonNode setTitle:@"补登" withFont:[UIFont systemFontOfSize:14] withColor:[UIColor blackColor] forState:UIControlStateNormal];
        _repairButtonNode.style.preferredSize = CGSizeMake(50, 22);
        [self addSubnode:_repairButtonNode];
        
        _stageTextNode.attributedText = [[NSAttributedString alloc] initWithString:@"订金：2000" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
        
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    ASStackLayoutSpec *buttonSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:8 justifyContent:ASStackLayoutJustifyContentEnd alignItems:ASStackLayoutAlignItemsCenter children:@[_repairButtonNode, _payButtonNode]];
    buttonSpec.style.spacingBefore = 15;

    _stageTextNode.style.flexShrink = 1.0;
    ASStackLayoutSpec *content = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsCenter children:@[_stageTextNode, buttonSpec]];
    content.style.height = ASDimensionMake(constrainedSize.max.height - 1);

    return [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:0 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStretch children:@[_lineNode, content]];
}

@end
