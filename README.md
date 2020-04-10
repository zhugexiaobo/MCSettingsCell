# MCSettingsCell

[![Build Status](https://github.com/zhugexiaobo/MCSettingsCell/workflows/CI/badge.svg?branch=master)](https://github.com/zhugexiaobo/MCSettingsCell/actions)
[![Version](https://img.shields.io/cocoapods/v/MCSettingsCell.svg?style=flat)](https://cocoapods.org/pods/MCSettingsCell)
[![License](https://img.shields.io/cocoapods/l/MCSettingsCell.svg?style=flat)](https://cocoapods.org/pods/MCSettingsCell)
[![Platform](https://img.shields.io/cocoapods/p/MCSettingsCell.svg?style=flat)](https://cocoapods.org/pods/MCSettingsCell)


快速创建常用设置页面元素。

## Example

```objc

// 创建单元格模型
MCSettingsItem *item = [[MCSettingsItem alloc] initWithTitle:@"Style 3" detail:@"detail"];
item.subtitleString = @"subtitle";
item1.leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
item.hintBtn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
item.settingItemClicked = ^(MCSettingsItem * _Nonnull item) {
    // 点击事件
};

// 加入数据源
_dataSource = @[item];


// tableview delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MCSettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:MCSettingsCellID];
    cell.item = _dataSource[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

```

## Installation

MCSettingsCell is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MCSettingsCell'
```

## License

MCSettingsCell is available under the MIT license. See the LICENSE file for more info.
