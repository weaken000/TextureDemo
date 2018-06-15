//
//  WKProductDetailNode.m
//  TextureDemo
//
//  Created by mac on 2018/6/15.
//  Copyright © 2018年 weikun. All rights reserved.
//

#import "WKProductDetailNode.h"
#import "WKProductStageNode.h"

@implementation WKProductDetailNode
{
    ASImageNode *_productImageNode;
    
    ASTextNode *_productNameNode;
    ASTextNode *_productDescNode;
    ASTextNode *_priceNode;
    
    WKProductStageNode *_firstStageNode;
    WKProductStageNode *_secondStageNode;
    WKProductStageNode *_thirdStageNode;

    ASDisplayNode *_lineNode;
}

- (instancetype)init {
    if (self == [super init]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _productImageNode = [[ASImageNode alloc] init];
        _productImageNode.backgroundColor = [UIColor grayColor];
        _productImageNode.style.preferredSize = CGSizeMake(120, 90);
        [self addSubnode:_productImageNode];
        
        _productNameNode = [[ASTextNode alloc] init];
        _productNameNode.maximumNumberOfLines = 2.0;
        [self addSubnode:_productNameNode];
        
        _productDescNode = [[ASTextNode alloc] init];
        _productDescNode.style.flexShrink = 1.0;
        [self addSubnode:_productDescNode];
        
        _priceNode = [[ASTextNode alloc] init];
        _priceNode.maximumNumberOfLines = 1.0;
        [self addSubnode:_priceNode];
        
        _firstStageNode = [[WKProductStageNode alloc] init];
        [self addSubnode:_firstStageNode];
        
        _secondStageNode = [[WKProductStageNode alloc] init];
        [self addSubnode:_secondStageNode];
        
        _thirdStageNode = [[WKProductStageNode alloc] init];
        [self addSubnode:_thirdStageNode];
        
        _lineNode = [[ASDisplayNode alloc] init];
        _lineNode.backgroundColor = [UIColor grayColor];
        _lineNode.style.height = ASDimensionMake(1.0);
        [self addSubnode:_lineNode];
        
        _priceNode.attributedText = [[NSAttributedString alloc] initWithString:@"1000（预估价）1000（预估价）1000（预估价）1000（预估价）1000（预估价）1000（预估价）1000（预估价）1000（预估价）1000（预估价）1000（预估价）1000（预估价）" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
        _productDescNode.attributedText = [[NSAttributedString alloc] initWithString:@"商品详情商品详情商品详情商品详情商品详情商品详情商品详情商品详情商品详情商品详情商品详情商品详情商品详情商品详情商品详情" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
        _productNameNode.attributedText = [[NSAttributedString alloc] initWithString:@"商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    _productDescNode.style.spacingBefore = 5.0;
    ASStackLayoutSpec *productDescSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_productNameNode, _productDescNode]];
    productDescSpec.style.flexShrink = 1.0;
    
    _priceNode.style.spacingBefore = 5.0;
    ASStackLayoutSpec *productPriceSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:0 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStretch children:@[productDescSpec, _priceNode]];
    productPriceSpec.style.width = ASDimensionMake(constrainedSize.max.width - 165);
    
    ASStackLayoutSpec *productSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:15 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStretch children:@[_productImageNode, productPriceSpec]];
    productSpec.style.height = ASDimensionMake(90);
    
    _firstStageNode.style.spacingBefore = 15;
    _firstStageNode.style.height  = ASDimensionMake(44);
    _secondStageNode.style.height = ASDimensionMake(44);
    _thirdStageNode.style.height  = ASDimensionMake(44);

    ASStackLayoutSpec *contentSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:0 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStretch children:@[productSpec, _firstStageNode, _secondStageNode, _thirdStageNode, _lineNode]];
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(15, 15, 15, 15) child:contentSpec];
}

@end
