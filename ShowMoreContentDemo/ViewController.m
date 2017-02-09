//
//  ViewController.m
//  ShowMoreContentDemo
//
//  Created by ZJQ on 2017/2/9.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "MJExtension.h"
#import "TextModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end


static  NSString  * const cellID = @"cell";

@implementation ViewController

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray {

    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        _dataArray = [TextModel mj_objectArrayWithKeyValuesArray:@[@{@"author":@"辛弃疾",
                                                                     @"title":@"丑奴儿·书博山道中壁",
                                                                     @"content":@"少年不识愁滋味，爱上层楼。爱上层楼，为赋新词强说愁。\n而今识尽愁滋味，欲说还休。欲说还休，却道天凉好个秋。"},
                                                                   @{@"author":@"苏轼",
                                                                     @"title":@"水调歌头·明月几时有",
                                                                     @"content":@"明月几时有，把酒问青天。不知天上宫阙，今夕是何年。我欲乘风归去，又恐琼楼玉宇，高处不胜寒。起舞弄清影，何似在人间？\n转朱阁，低绮[qǐ]户，照无眠。不应有恨，何事长向别时圆？人有悲欢离合，月有阴晴圆缺，此事古难全。但愿人长久，千里共婵娟。"},
                                                                   @{@"author":@"苏轼",
                                                                     @"title":@"念奴娇·赤壁怀古",
                                                                     @"content":@"大江东去，浪淘尽，千古风流人物。故垒西边，人道是：三国周郎赤壁。乱石穿空，惊涛拍岸，卷起千堆雪。江山如画，一时多少豪杰。\n遥想公瑾当年，小乔初嫁了，雄姿英发。羽扇纶巾，谈笑间、强虏灰飞烟灭。故国神游，多情应笑我，早生华发。人间如梦，一樽还酹江月。"},
                                                                   @{@"author":@"李白",
                                                                     @"title":@"蜀道难",
                                                                     @"content":@"噫吁嚱，危乎高哉！\n蜀道之难，难于上青天！\n蚕丛及鱼凫，开国何茫然！\n尔来四万八千岁，不与秦塞通人烟。\n西当太白有鸟道，可以横绝峨嵋巅。\n地崩山摧壮士死，然后天梯石栈方钩连。\n上有六龙回日之高标，下有冲波逆折之回川。\n黄鹤之飞尚不得过，猿猱欲度愁攀援。\n青泥何盘盘，百步九折萦岩峦。\n扪参历井仰胁息，以手抚膺坐长叹。\n问君西游何时还？畏途巉岩不可攀。\n但见悲鸟号古木，雄飞从雌绕林间。\n又闻子规啼夜月，愁空山。\n蜀道之难，难于上青天，使人听此凋朱颜。\n连峰去天不盈尺，枯松倒挂倚绝壁。\n飞湍瀑流争喧豗，砯崖转石万壑雷。\n其险也若此，嗟尔远道之人，胡为乎来哉。\n剑阁峥嵘而崔嵬，一夫当关，万夫莫开。\n所守或匪亲，化为狼与豺。\n朝避猛虎，夕避长蛇，\n磨牙吮血，杀人如麻。\n锦城虽云乐，不如早还家。\n蜀道之难，难于上青天，侧身西望长咨嗟。"},
                                                                   @{@"author":@"李白",
                                                                     @"title":@"将进酒",
                                                                     @"content":@"君不见，黄河之水天上来，奔流到海不复回。\n君不见，高堂明镜悲白发，朝如青丝暮成雪。\n人生得意须尽欢，莫使金樽空对月。\n天生我材必有用，千金散尽还复来。\n烹羊宰牛且为乐，会须一饮三百杯。\n岑夫子，丹丘生，将进酒，杯莫停。\n与君歌一曲，请君为我倾耳听。\n 钟鼓馔玉不足贵，但愿长醉不复醒。\n古来圣贤皆寂寞，惟有饮者留其名。\n陈王昔时宴平乐，斗酒十千恣欢谑。\n主人何为言少钱，径须沽取对君酌。\n五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。"}]];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
    //[self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:cellID];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textModel = self.dataArray[indexPath.row];
    cell.showTextBlock = ^(CustomCell *customCell) {
    
        NSIndexPath *index = [tableView indexPathForCell:customCell];
        [tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    TextModel *model = self.dataArray[indexPath.row];
    if (model.isShowMore) {
        return [CustomCell cellMoreHeight:model];
    }else{
    
        return [CustomCell cellDefautHeight:model];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
