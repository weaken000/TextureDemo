//
//  WKListViewController.m
//  TextureDemo
//
//  Created by mac on 2018/6/15.
//  Copyright © 2018年 weikun. All rights reserved.
//

#import "WKListViewController.h"
#import "WKSampleNode.h"

@interface WKListViewController ()<ASTableDelegate, ASTableDataSource>

@property (nonatomic, strong) ASTableNode *tableNode;

@property (nonatomic, strong) NSMutableArray<NSString *> *tableDatas;

@end

@implementation WKListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.tableDatas = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil];
    
    self.tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    self.tableNode.view.tableFooterView = [UIView new];
    self.tableNode.delegate = self;
    self.tableNode.dataSource = self;
    self.tableNode.leadingScreensForBatching = 1.0;
    [self.view addSubnode:self.tableNode];
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.tableNode.frame = self.view.bounds;
}

- (void)tableNode:(ASTableNode *)tableNode willBeginBatchFetchWithContext:(ASBatchContext *)context {
    [context beginBatchFetching];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *tmp = @[@"q", @"e", @"r", @"g", @"t"];
        [self.tableDatas insertObjects:tmp atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, tmp.count)]];
        NSMutableArray *indexPaths = [NSMutableArray arrayWithCapacity:tmp.count];
        for (int i = 0; i < tmp.count; i++) {
            [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        [self.tableNode insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
        [context completeBatchFetching:YES];
    });
}

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.tableDatas.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ^ {
        WKSampleNode *cell = [[WKSampleNode alloc] init];
        cell.textNode.attributedText = [[NSAttributedString alloc] initWithString:self.tableDatas[indexPath.row] attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
        return cell;
    };
}


@end
