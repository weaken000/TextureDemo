//
//  WKAddressNode.m
//  TextureDemo
//
//  Created by mac on 2018/6/15.
//  Copyright © 2018年 weikun. All rights reserved.
//

#import "WKAddressNode.h"

@implementation WKAddressNode
{
    ASImageNode *_imageNode;
    
    ASTextNode2 *_nameNode;
    ASTextNode2 *_phoneNode;
    ASTextNode2   *_addressNode;
}

- (instancetype)init {
    if (self == [super init]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        self.backgroundColor = [UIColor orangeColor];
        
        _imageNode = [[ASImageNode alloc] init];
        _imageNode.contentMode = UIViewContentModeScaleAspectFit;
        _imageNode.style.preferredSize = CGSizeMake(20, 20);
        [self addSubnode:_imageNode];
        
        _nameNode = [[ASTextNode2 alloc] init];
        _nameNode.layerBacked = YES;
        _nameNode.maximumNumberOfLines = 1;
        [self addSubnode:_nameNode];
        
        _phoneNode = [[ASTextNode2 alloc] init];
        _phoneNode.layerBacked = YES;
        [self addSubnode:_phoneNode];
        
        _addressNode = [[ASTextNode2 alloc] init];
        _addressNode.layerBacked = YES;
        _addressNode.style.flexShrink = 1.0;
        _addressNode.maximumNumberOfLines = 2;
        [self addSubnode:_addressNode];
        
        _imageNode.backgroundColor = [UIColor grayColor];
        _nameNode.attributedText = [[NSAttributedString alloc] initWithString:@"联系人：小一联系人：小一联系人：小一联系人：小一联系人：小一联系人：小一" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
        _phoneNode.attributedText = [[NSAttributedString alloc] initWithString:@"178245234234" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
        _addressNode.attributedText = [[NSAttributedString alloc] initWithString:@"联系地址：分公司噶分公司电饭锅第三方哥哥哥热让他问题确认他强任他强特让他去儿童其二他强任他强抢人头其他人全额退群退群退群抢人头去去" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    _nameNode.style.flexShrink = 1.0;
    _nameNode.style.spacingBefore = 28;
    ASStackLayoutSpec *topSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:15 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:@[_nameNode, _phoneNode]];
    
    ASStackLayoutSpec *bottomSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:8 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStart children:@[_imageNode, _addressNode]];
    
    ASStackLayoutSpec *contentSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:8 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStart children:@[topSpec, bottomSpec]];
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(15, 15, 15, 15) child:contentSpec];
    
}

@end
