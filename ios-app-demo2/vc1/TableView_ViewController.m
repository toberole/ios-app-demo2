#import "TableView_ViewController.h"

/**
 UITableViewDataSource
 
 @required(必须实现的)
     //返回第section行的row数量
     - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
     //返回第indexPath.row行的cell内容
     - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
 以上这两个方法会调用一次或多次,次数根据设置的section数量及每个section的cell数量而定.在开发中一般通过模型来传递数据,在控制器中创建一个数组接收模型数据,然后加载到cell中显示.

 @optional(可选的)
      //返回section的数量,默认为1
     - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
     //返回grouped样式中每组的头部标题
     - (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
     //返回grouped样式中每组的尾部标题
     - (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;
 
 UITableViewCell的创建及重用
 UITableViewCell在创建时,系统会自动设置为懒加载状态.但为了高效利用每一个cell,我们需要设置cell的重用标识(identfier),加载cell时先从缓存池中查找可用的cell.

 
 */
@interface TableView_ViewController ()

@property(nonatomic,strong)UITableView*tableView;

@property(nonatomic,strong)NSArray*data;

@end

@implementation TableView_ViewController

- (NSArray *)data{
    if (!_data) {
        _data = @[@"hello1",@"hello2",@"hello3",@"hello4",@"hello5"];
    }
    
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [self.view viewWithTag:1];
    self.tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 设置重用标识
    static NSString *ID=@"cell";
    // 根据重用标识从缓存池中查找可用cell
    UITableViewCell *cell=[self.tableView dequeueReusableCellWithIdentifier:ID];
    // 找不到可用cell,手动创建标识为ID的cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 板式输出
    cell.textLabel.text = [NSString stringWithFormat:@"test--%@",self.data[indexPath.row]];
    // 返回cell
    return cell;
}

@end
