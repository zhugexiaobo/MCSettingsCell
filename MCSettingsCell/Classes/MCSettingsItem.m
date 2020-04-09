//
//  MCSettingsItem.m
//  MicroCourse
//
//  Created by xiaobo on 2019/12/30.
//  Copyright © 2019 Kuozhi Network Technology. All rights reserved.
//

#import "MCSettingsItem.h"

#define DefaultLeading          16.0
#define DefaultTrailing         16.0
#define DefaultTitlefontSize    14
#define DefaultDetailfontSize   14
#define DefaultsubTitlefontSize 12
#define DefaultItemCellHeight   60.0
#define DefaultSeparatorSpace   16.0
#define DefaultSeparatorH       1
#define DefaultSeparatorcColor  [UIColor colorWithRed:245.0 / 255.0 green:245.0 / 255.0 blue:245.0 / 255.0 alpha:1.0]
#define DefaultTitleColor       [UIColor colorWithRed:51.0 / 255.0 green:51.0 / 255.0 blue:51.0 / 255.0 alpha:1.0]
#define DefaultDetailColor      [UIColor colorWithRed:102.0 / 255.0 green:102.0 / 255.0 blue:102.0 / 255.0 alpha:1.0]

@implementation MCSettingsItem

- (instancetype)init {
    if (self = [super init]) {
        _accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        _height = DefaultItemCellHeight;
        _isTopSeparator = NO;
        _isBottomSeparator = NO;
        _topSeparatorSpace = DefaultSeparatorSpace;
        _bottomSeparatorSpace = DefaultSeparatorSpace;
        _topSeparatorH = DefaultSeparatorH;
        _bottomSeparatorH = DefaultSeparatorH;
        _topSeparatorcColor = DefaultSeparatorcColor;
        _bottomSeparatorcColor = DefaultSeparatorcColor;
        _itemLeading = DefaultLeading;
        _itemTrailing = DefaultTrailing;
        _titleBadge = -1;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail {
    if (self = [self init]) {
        self.titleString = title;
        self.detailString = detail;
    }
    return self;
}

- (void)setTitleString:(NSString *)titleString {
    if (!titleString.length) titleString = @"";
    _title = [[NSAttributedString alloc]
              initWithString:titleString
              attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:DefaultTitlefontSize],
                           NSForegroundColorAttributeName: DefaultTitleColor}];
}

- (NSString *)titleString {
    return _title.string;
}

- (void)setDetailString:(NSString *)detailString {
    if (!detailString.length) detailString = @"";
    _detail = [[NSAttributedString alloc]
               initWithString:detailString
               attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:DefaultDetailfontSize],
                            NSForegroundColorAttributeName: DefaultDetailColor}];
}

- (NSString *)detailString {
    return _detail.string;
}

- (void)setSubtitleString:(NSString *)subtitleString {
    if (!subtitleString.length) subtitleString = @"";
    _subtitle = [[NSAttributedString alloc]
                 initWithString:subtitleString
                 attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:DefaultsubTitlefontSize],
                              NSForegroundColorAttributeName: DefaultDetailColor }];
}

- (NSString *)subtitleString {
    return _subtitle.string;
}

- (void)setLeftImageView:(UIImageView *)leftImageView {
    _leftImageView = leftImageView;
    _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    _leftImageView.clipsToBounds = YES;
}

- (void)setRightIconView:(UIImageView *)rightIconView {
    _rightIconView = rightIconView;
    _rightIconView.contentMode = UIViewContentModeScaleAspectFill;
    _rightIconView.clipsToBounds = YES;
}

@end
