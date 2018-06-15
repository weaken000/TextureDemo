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

- (instancetype)init {
    if (self == [super init]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubNode];
    }
    return self;
}

- (void)setupSubNode {
    
    self.automaticallyManagesSubnodes = YES;
    
    _stateNode = [[ASTextNode alloc] init];
    _stateNode.layerBacked = YES;
    _stateNode.style.flexShrink = 1.0;

    NSString *str = @"已完成";
    _stateNode.attributedText = [[NSAttributedString alloc] initWithString:str attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:19.0]}];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    ASCenterLayoutSpec *centerSpec = [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY sizingOptions:0 child:_stateNode];
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(20, 15, 20, 15) child:centerSpec];
}


@end
