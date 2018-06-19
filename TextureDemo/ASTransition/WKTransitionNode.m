//
//  WKTransitionNode.m
//  TextureDemo
//
//  Created by mac on 2018/6/15.
//  Copyright © 2018年 weikun. All rights reserved.
//

#import "WKTransitionNode.h"

@implementation WKTransitionNode
{
    ASTextNode *_oneTextNode;
    ASTextNode *_twoTextNode;
    ASButtonNode *_buttonNode;
    
    NSInteger _showTag;
}

- (instancetype)init {
    if (![super init]) return nil;
    
    self.backgroundColor = [UIColor whiteColor];
    _showTag = 1;
    
    self.automaticallyManagesSubnodes = YES;
    self.defaultLayoutTransitionDuration = 2.0;
    
    _oneTextNode = [[ASTextNode alloc] init];
    _oneTextNode.backgroundColor = [UIColor grayColor];
    
    _twoTextNode = [[ASTextNode alloc] init];
    _twoTextNode.backgroundColor = [UIColor grayColor];
    
    _buttonNode = [[ASButtonNode alloc] init];
    [_buttonNode setTitle:@"exchanged" withFont:[UIFont systemFontOfSize:15.0] withColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _buttonNode.backgroundColor = [UIColor orangeColor];
    
    return self;
}

- (void)didLoad {
    [super didLoad];
    [_buttonNode addTarget:self action:@selector(click_buttonNode:) forControlEvents:ASControlNodeEventTouchUpInside];
}

- (void)animateLayoutTransition:(id<ASContextTransitioning>)context {
    
    ASDisplayNode *fromNode = [context removedSubnodes].firstObject;
    ASDisplayNode *toNode = [context insertedSubnodes].firstObject;
    
    CGRect toNodeFrame = [context finalFrameForNode:toNode];
    toNodeFrame.origin.x += toNode.frame.size.width;
    toNode.frame = toNodeFrame;
    toNode.alpha = 0.0;
    
    CGRect fromNodeFrame = fromNode.frame;
    fromNodeFrame.origin.x -= fromNodeFrame.size.width;
    
    [UIView animateWithDuration:self.defaultLayoutTransitionDuration animations:^{
        toNode.frame = [context finalFrameForNode:toNode];
        toNode.alpha = 1.0;
        
        fromNode.frame = fromNodeFrame;
        fromNode.alpha = 0.0;
      
    } completion:^(BOOL finished) {
        [context completeTransition:finished];
    }];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASTextNode *file = _showTag == 1 ? _oneTextNode : _twoTextNode;
    file.style.flexGrow = 1.0;
    _buttonNode.style.flexGrow = 1.0;
    
    ASStackLayoutSpec *spec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5.0 justifyContent:ASStackLayoutJustifyContentSpaceAround alignItems:ASStackLayoutAlignItemsStretch children:@[file, _buttonNode]];
    return spec;
}

- (void)click_buttonNode:(ASButtonNode *)sender {
    _showTag = (_showTag == 1 ? 2 : 1);
    [self transitionLayoutWithAnimation:YES shouldMeasureAsync:NO measurementCompletion:nil];
}

@end
