//
//  WKOrderViewController.m
//  TextureDemo
//
//  Created by mac on 2018/6/12.
//  Copyright © 2018年 weikun. All rights reserved.
//

#import "WKOrderViewController.h"

#import "WKHeaderCellNode.h"
#import "WKStageCellNode.h"
#import "WKAddressNode.h"
#import "WKProductDetailNode.h"
#import "WKFunctionNode.h"

@interface WKOrderViewController()<ASTableDelegate, ASTableDataSource>

@property (nonatomic, strong) ASTableNode *tableNode;

@end

@implementation WKOrderViewController

- (instancetype)init {
    if (self == [super initWithNode:self.tableNode]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

#pragma mark - ASTableDataSource
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return ^ ASCellNode *() {
        if (indexPath.item == 0) {
            WKHeaderCellNode *cell = [[WKHeaderCellNode alloc] init];
            return cell;
        }
        else if (indexPath.item == 1) {
            WKStageCellNode *cell = [[WKStageCellNode alloc] init];
            return cell;
        }
        else if (indexPath.item == 2) {
            return [[WKAddressNode alloc] init];
        }
        else if (indexPath.item == 3) {
            return [[WKProductDetailNode alloc] init];
        }
        else if (indexPath.item == 4) {
            return [[WKFunctionNode alloc] init];
        }
        else {
            ASCellNode *cell = [[ASCellNode alloc] init];
            return cell;
        }
    };
}


- (ASTableNode *)tableNode {
    if (!_tableNode) {
        _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
        _tableNode.delegate = self;
        _tableNode.dataSource = self;
    }
    return _tableNode;
}

@end
