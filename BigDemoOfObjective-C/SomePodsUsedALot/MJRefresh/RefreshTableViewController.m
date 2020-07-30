//
//  RefreshTableViewController.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/28.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "RefreshTableViewController.h"

@interface RefreshTableViewController ()
@property (nonatomic, assign) int refreshCount;
@end

@implementation RefreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
    //加载次数
    _refreshCount = 1;
    //设置默认的下拉刷新组件
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       //Call this Block When enter the refresh status automatically
        Log(@"");
        self.refreshCount = 1;
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
    
    //一些属性
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = NO;
    
    //DIY the title
    /**
     // Set title
     [header setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];
     [header setTitle:@"Release to refresh" forState:MJRefreshStatePulling];
     [header setTitle:@"Loading ..." forState:MJRefreshStateRefreshing];

     // Set font
     header.stateLabel.font = [UIFont systemFontOfSize:15];
     header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];

     // Set textColor
     header.stateLabel.textColor = [UIColor redColor];
     header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
     */
    
    self.tableView.mj_header = header;
    // Set the callback（Once you enter the refresh status，then call the action of target，that is call [self loadNewData]）
    
    /**
     第二种设置下拉刷新组件的方式
     
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

    // Enter the refresh status immediately
    [self.tableView.mj_header beginRefreshing];
     
     */
    
    /**
     设置下拉刷新动图模式
     // Set the callback（一Once you enter the refresh status，then call the action of target，that is call [self loadNewData]）
     MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
     // Set the ordinary state of animated images
     [header setImages:idleImages forState:MJRefreshStateIdle];
     // Set the pulling state of animated images（Enter the status of refreshing as soon as loosen）
     [header setImages:pullingImages forState:MJRefreshStatePulling];
     // Set the refreshing state of animated images
     [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
     // Set header
     self.tableView.mj_header = header;
     
     */
    
#warning footer
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        Log(@"");
        sleep(arc4random()%3);
        self.refreshCount += 1;
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    }];
    
    //一些属性
    footer.refreshingTitleHidden = YES;//footer.stateLabel.hidden = YES;
    // Set title
//    [footer setTitle:@"Click or drag up to refresh" forState:MJRefreshStateIdle];
//    [footer setTitle:@"Loading more ..." forState:MJRefreshStateRefreshing];
//    [footer setTitle:@"No more data" forState:MJRefreshStateNoMoreData];

    // Set font
    footer.stateLabel.font = [UIFont systemFontOfSize:17];

    // Set textColor
    footer.stateLabel.textColor = [UIColor blueColor];
    //提示没有更多数据
    //[footer endRefreshingWithNoMoreData];
    //加载后隐藏
//    self.tableView.mj_footer.hidden = YES;
    self.tableView.mj_footer = footer;
    //第二种方式
    // Set the callback（Once you enter the refresh status，then call the action of target，that is call [self loadMoreData]）
//    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    /**
     上拉加载更多动图模式
     // Set the callback（Once you enter the refresh status，then call the action of target，that is call [self loadMoreData]）
     MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

     // Set the refresh image
     [footer setImages:refreshingImages forState:MJRefreshStateRefreshing];

     // Set footer
     self.tableView.mj_footer = footer;
     */
    
#warning 自动回弹的footer
    /**
     1.
     self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

     2.
     MJRefreshBackGifFooter *footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

     // Set the normal state of the animated image
     [footer setImages:idleImages forState:MJRefreshStateIdle];
     //  Set the pulling state of animated images（Enter the status of refreshing as soon as loosen）
     [footer setImages:pullingImages forState:MJRefreshStatePulling];
     // Set the refreshing state of animated images
     [footer setImages:refreshingImages forState:MJRefreshStateRefreshing];

     // Set footer
     self.tableView.mj_footer = footer;
     
     */
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20 * _refreshCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"随机数据 %d",arc4random()%1000];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
