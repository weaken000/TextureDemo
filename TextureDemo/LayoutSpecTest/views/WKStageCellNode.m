//
//  WKStageCellNode.m
//  TextureDemo
//
//  Created by mac on 2018/6/12.
//  Copyright © 2018年 weikun. All rights reserved.
//

#import "WKStageCellNode.h"

@implementation WKStageCellNode
{
    ASDisplayNode *_lineNode;
    
    ASDisplayNode *_leftCircleNode;
    ASTextNode    *_leftTitleNode;
    ASTextNode    *_leftStateNodel;
    
    ASDisplayNode *_centerCircleNode;
    ASTextNode    *_centerTitleNode;
    ASTextNode    *_centerStateNodel;
    
    ASDisplayNode *_rightCircleNode;
    ASTextNode    *_rightTitleNode;
    ASTextNode    *_rightStateNodel;
    
    ASDisplayNode *_bottomLineNode;
}
- (instancetype)init {
    if (self == [super init]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        [self setupSubNode];
    }
    return self;
}

- (void)setupSubNode {
    
    self.backgroundColor = [UIColor orangeColor];
    
    _lineNode = [[ASDisplayNode alloc] initWithLayerBlock:^CALayer * _Nonnull{
        CAGradientLayer *line_layer = [CAGradientLayer layer];
        line_layer.colors = @[((__bridge id)[UIColor colorWithWhite:1.0 alpha:0.3].CGColor),
                              ((__bridge id)[UIColor colorWithWhite:1.0 alpha:1.0].CGColor),
                              ((__bridge id)[UIColor colorWithWhite:1.0 alpha:1.0].CGColor),
                              ((__bridge id)[UIColor colorWithWhite:1.0 alpha:0.3].CGColor)];
        line_layer.locations = @[@(0.0), @(1.0/6), @(5.0/6), @(1.0)];
        line_layer.startPoint = CGPointZero;
        line_layer.endPoint = CGPointMake(1.0, 0);
        return line_layer;
    }];
    [self addSubnode:_lineNode];
    
    _leftCircleNode = [[ASDisplayNode alloc] init];
    _leftCircleNode.layerBacked = YES;
    _leftCircleNode.cornerRadius = 6.5;
    _leftCircleNode.style.preferredSize = CGSizeMake(13, 13);
    _leftCircleNode.borderWidth = 3.0;
    _leftCircleNode.borderColor = [UIColor whiteColor].CGColor;
    [self addSubnode:_leftCircleNode];
    
    _leftTitleNode = [[ASTextNode alloc] init];
    _leftTitleNode.layerBacked = YES;
    [self addSubnode:_leftTitleNode];
    
    _leftStateNodel = [[ASTextNode alloc] init];
    _leftStateNodel.layerBacked = YES;
    _leftStateNodel.backgroundColor = [UIColor whiteColor];
    [self addSubnode:_leftStateNodel];
    //
    _centerCircleNode = [[ASDisplayNode alloc] init];
    _centerCircleNode.layerBacked = YES;
    _centerCircleNode.cornerRadius = 6.5;
    _centerCircleNode.style.preferredSize = CGSizeMake(13, 13);
    _centerCircleNode.borderWidth = 3.0;
    _centerCircleNode.borderColor = [UIColor whiteColor].CGColor;
    [self addSubnode:_centerCircleNode];
    
    _centerTitleNode = [[ASTextNode alloc] init];
    _centerTitleNode.layerBacked = YES;
    [self addSubnode:_centerTitleNode];
    
    _centerStateNodel = [[ASTextNode alloc] init];
    _centerStateNodel.layerBacked = YES;
    _centerStateNodel.backgroundColor = [UIColor whiteColor];
    [self addSubnode:_centerStateNodel];
    //
    _rightCircleNode = [[ASDisplayNode alloc] init];
    _rightCircleNode.layerBacked = YES;
    _rightCircleNode.cornerRadius = 6.5;
    _rightCircleNode.style.preferredSize = CGSizeMake(13, 13);
    _rightCircleNode.borderWidth = 3.0;
    _rightCircleNode.borderColor = [UIColor whiteColor].CGColor;
    [self addSubnode:_rightCircleNode];
    
    _rightTitleNode = [[ASTextNode alloc] init];
    _rightTitleNode.layerBacked = YES;
    [self addSubnode:_rightTitleNode];
    
    _rightStateNodel = [[ASTextNode alloc] init];
    _rightStateNodel.layerBacked = YES;
    _rightStateNodel.backgroundColor = [UIColor whiteColor];
    [self addSubnode:_rightStateNodel];
    
    _bottomLineNode = [[ASDisplayNode alloc] init];
    _bottomLineNode.backgroundColor = [UIColor greenColor];
    _bottomLineNode.layerBacked = YES;
    [self addSubnode:_bottomLineNode];
    
    
    _leftTitleNode.attributedText = [[NSAttributedString alloc] initWithString:@"订金订金订金" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
    _leftStateNodel.attributedText = [[NSAttributedString alloc] initWithString:@"订金订金订金" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
    _centerTitleNode.attributedText = [[NSAttributedString alloc] initWithString:@"订金" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
    _centerStateNodel.attributedText = [[NSAttributedString alloc] initWithString:@"订金" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
    _rightTitleNode.attributedText = [[NSAttributedString alloc] initWithString:@"订金" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
    _rightStateNodel.attributedText = [[NSAttributedString alloc] initWithString:@"订金" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    _lineNode.style.preferredSize = CGSizeMake(constrainedSize.max.width - 30, 2.0);
    
    ASStackLayoutSpec *circleStackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0.0 justifyContent:ASStackLayoutJustifyContentSpaceAround alignItems:ASStackLayoutAlignItemsCenter children:@[_leftCircleNode, _centerCircleNode, _rightCircleNode]];
    
    ASCenterLayoutSpec *lineCenterSpec = [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY sizingOptions:ASCenterLayoutSpecSizingOptionDefault child:_lineNode];
    lineCenterSpec.style.preferredSize = CGSizeMake(constrainedSize.max.width - 30, 13);
    
    ASOverlayLayoutSpec *topSpec = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:lineCenterSpec overlay:circleStackSpec];
    
    CGFloat itemW = (constrainedSize.max.width - 30) / 3.0;
    ASStackLayoutSpec *leftSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsCenter children:@[_leftTitleNode, _leftStateNodel]];
    leftSpec.style.width = ASDimensionMake(itemW);
    
    ASStackLayoutSpec *centerSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsCenter children:@[_centerTitleNode, _centerStateNodel]];
    centerSpec.style.width = ASDimensionMake(itemW);

    ASStackLayoutSpec *rightSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsCenter children:@[_rightTitleNode, _rightStateNodel]];
    rightSpec.style.width = ASDimensionMake(itemW);

    ASStackLayoutSpec *bottomSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0 justifyContent:ASStackLayoutJustifyContentCenter alignItems:ASStackLayoutAlignItemsCenter children:@[leftSpec, centerSpec, rightSpec]];
    
    ASStackLayoutSpec *contentSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStretch children:@[topSpec, bottomSpec]];
    
    _bottomLineNode.style.height = ASDimensionMake(3);
    ASStackLayoutSpec *totalSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:15 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStretch children:@[contentSpec, _bottomLineNode]];
    
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(15, 15, 0, 15) child:totalSpec];
}

@end
