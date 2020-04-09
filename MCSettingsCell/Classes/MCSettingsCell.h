//
//  MCSettingsCell.h
//  MCSettingsCell
//
//  Created by zhugexiaobo on 04/09/2020.
//  Copyright (c) 2020 zhugexiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCSettingsItem.h"

#define MCSettingsCellID @"MCSettingCellReuseID"

NS_ASSUME_NONNULL_BEGIN

@interface MCSettingsCell : UITableViewCell

@property (strong, nonatomic) MCSettingsItem *item;

@end

NS_ASSUME_NONNULL_END
