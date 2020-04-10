//
//  MCViewController.m
//  MCSettingsCell
//
//  Created by zhugexiaobo on 04/09/2020.
//  Copyright (c) 2020 zhugexiaobo. All rights reserved.
//

#import "MCViewController.h"
#import "MCSettingsCell.h"

@interface MCViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSArray <MCSettingsItem *>*dataSource;

@end

@implementation MCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDataSource];
    [_tableview registerClass:MCSettingsCell.class forCellReuseIdentifier:MCSettingsCellID];
    [_tableview reloadData];
}

- (void)setupDataSource {
    MCSettingsItem *item1 = [[MCSettingsItem alloc] initWithTitle:@"Style 1" detail:nil];
    if (@available(iOS 13.0, *)) {
        UIImageView *aImage = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"music.note"]];
        item1.leftImageView = aImage;
    }
    
    MCSettingsItem *item2 = [[MCSettingsItem alloc] initWithTitle:@"style 2" detail:@"detail"];
    item2.settingItemClicked = ^(MCSettingsItem * _Nonnull item) {
        NSLog(@"clicked");
    };
    
    MCSettingsItem *item3 = [[MCSettingsItem alloc] initWithTitle:@"Style 3" detail:@"detail"];
    item3.hintBtn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    item3.settingItemClicked = ^(MCSettingsItem * _Nonnull item) {
        
    };
    
    MCSettingsItem *item4 = [[MCSettingsItem alloc] initWithTitle:@"Style 4" detail:nil];
    if (@available(iOS 13.0, *)) {
        item4.rightIconView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"ellipses.bubble"]];
    }
    item4.settingItemClicked = ^(MCSettingsItem * _Nonnull item) {
        
    };
    
    MCSettingsItem *item5 = [[MCSettingsItem alloc] initWithTitle:@"Style 5" detail:nil];
    item5.accessoryControl = [UIButton buttonWithType:UIButtonTypeInfoDark];
    item5.accessoryType = UITableViewCellAccessoryNone;
    item5.settingItemClicked = ^(MCSettingsItem * _Nonnull item) {
        
    };
    
    MCSettingsItem *item6 = [[MCSettingsItem alloc] initWithTitle:@"Style 6"
                               detail:[NSString stringWithFormat:@"v%@", [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"]]];
    item6.subtitleString = @"subtitle";
    item6.settingItemClicked = ^(MCSettingsItem * _Nonnull item) {
        
    };
    
    _dataSource = @[item1, item2, item3, item4, item5, item6];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MCSettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:MCSettingsCellID];
    cell.item = _dataSource[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _dataSource[indexPath.row].height;
}

@end
