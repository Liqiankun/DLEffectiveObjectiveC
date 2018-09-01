//
//  ViewController.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/23.
//  Copyright © 2018年 David. All rights reserved.
//

#import "ViewController.h"
#import "BaseViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong) NSArray <NSString *> *dataArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = @[
                   @"MessageForwardingVC",
                   @"MethodSwizzlingVC",
                   @"DesignatedInitializerVC",
                   @"DescriptionVC",
                   @"PrivateMethodVC",
                   @"DelegateVC",
                   @"PersonVC",
                   @"DeallocVC",
                   @"TryCatchVC",
                   @"AutoreleaseVC",
                   @"BlockVC",
                   @"LockVC",
                   @"GCDGroupVC",
                   @"GCDOnceVC",
                   @"EnumerationVC",
                   @"BridgeVC",
                   @"TimerVC"
                   ];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    Class VCClass = NSClassFromString(_dataArray[indexPath.row]);
    BaseViewController *viewController = [[VCClass alloc] init];
    viewController.nameTitle = _dataArray[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
