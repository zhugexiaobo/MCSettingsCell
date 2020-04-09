//
//  MCSettingsCell.m
//  MCSettingsCell
//
//  Created by zhugexiaobo on 04/09/2020.
//  Copyright (c) 2020 zhugexiaobo. All rights reserved.
//

#import "MCSettingsCell.h"

@interface UIView (Frame)

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat w;
@property (assign, nonatomic) CGFloat h;
@property (assign, nonatomic) CGFloat cx;
@property (assign, nonatomic) CGFloat cy;

@end

@implementation UIView (Frame)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setW:(CGFloat)w {
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}

- (CGFloat)w {
    return self.frame.size.width;
}

- (void)setH:(CGFloat)h {
    CGRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
}

- (CGFloat)h {
    return self.frame.size.height;
}

- (void)setCx:(CGFloat)cx {
    CGPoint center = self.center;
    center.x = cx;
    self.center = center;
}

- (CGFloat)cx {
    return self.center.x;
}

- (void)setCy:(CGFloat)cy {
    CGPoint center = self.center;
    center.y = cy;
    self.center = center;
}

- (CGFloat)cy {
    return self.center.y;
}

@end

@implementation MCSettingsCell
{
    UIButton *_btn;
    UIView *_bottomSeparatorV;
    UIView *_topSeparatorV;

    UILabel *_titleLeb;
    UILabel *_titleBadgeLeb;
    UILabel *_subTitleLeb;
    UIView *_customContentV;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    return [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
}

- (void)setItem:(MCSettingsItem *)item {
    if (_item != item) {
        [_item.leftImageView removeFromSuperview];
        [_item.rightIconView removeFromSuperview];
    }
    _item = item;

    if (_item.leftImage) {
        self.imageView.image = _item.leftImage;
    } else if (_item.leftImageView) {
        [self.contentView addSubview:_item.leftImageView];
    }

    if (_item.subtitleString.length) {
        if (!_titleLeb) {
            _titleLeb = [UILabel new];
        }
        _titleLeb.attributedText = _item.title;
        [_titleLeb sizeToFit];

        if (!_subTitleLeb) {
            _subTitleLeb = [UILabel new];
            _subTitleLeb.numberOfLines = 0;
        }
        _subTitleLeb.attributedText = _item.subtitle;
        _subTitleLeb.y = _titleLeb.h + 6.0;

        if (!_customContentV) {
            _customContentV = [UIView new];
            _customContentV.backgroundColor = [UIColor clearColor];
            [_customContentV addSubview:_titleLeb];
            [_customContentV addSubview:_subTitleLeb];
            [self.contentView addSubview:_customContentV];
        }
        _customContentV.h = _titleLeb.h + _subTitleLeb.h;
        _customContentV.w = self.w / 2;
    } else {
        self.textLabel.attributedText = _item.title;
    }

    self.detailTextLabel.attributedText = _item.detail;

    if (_item.hintBtn) {
        _btn = _item.hintBtn;
        [_btn addTarget:self action:@selector(hintBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_btn];
    }
    
    if (_item.titleBadge >= 0) {
        if (!_titleBadgeLeb) {
            _titleBadgeLeb = [UILabel new];
            _titleBadgeLeb.backgroundColor = [UIColor colorWithRed:253/255.f green:72/255.f blue:82/255.f alpha:1];
            _titleBadgeLeb.textColor = [UIColor whiteColor];
            _titleBadgeLeb.layer.masksToBounds = YES;
            [_item.subtitleString.length ? _titleLeb : self.textLabel addSubview:_titleBadgeLeb];
        }
        if (_item.titleBadge == 0) {
            _titleBadgeLeb.w = 6;
            _titleBadgeLeb.h = 6;
            _titleBadgeLeb.layer.cornerRadius = 3;
        } else {
            _titleBadgeLeb.w = 12;
            _titleBadgeLeb.h = 12;
            _titleBadgeLeb.layer.cornerRadius = 6;
            _titleBadgeLeb.text = @(_item.titleBadge).stringValue;
        }
    }

    self.accessoryView = nil;
    if (_item.accessoryControl) {
        self.accessoryView = _item.accessoryControl;
    } else if (item.accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
        UIImageView *arrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"moreArrow"]];
        [arrow sizeToFit];
        self.accessoryView = arrow;
    }
    if (_item.rightIconView) {
        [self.contentView addSubview:_item.rightIconView];
    }

    if (_item.accessoryControl) {
        UIControlEvents event = _item.accessoryControlEvent;
        if ([_item.accessoryControl isKindOfClass:[UIButton class]]) {
            event = UIControlEventTouchUpInside;
        }
        if ([_item.accessoryControl isKindOfClass:[UISwitch class]]) {
            event = UIControlEventValueChanged;
        }
        [_item.accessoryControl addTarget:self action:@selector(accessoryControlEvent) forControlEvents:event];
    }

    if (_item.isBottomSeparator) {
        if (!_bottomSeparatorV) {
            _bottomSeparatorV = [[UIView alloc] init];
            _bottomSeparatorV.backgroundColor = _item.bottomSeparatorcColor;
        }
        [self.contentView addSubview:_bottomSeparatorV];
    }

    if (_item.isTopSeparator) {
        if (!_topSeparatorV) {
            _topSeparatorV = [[UIView alloc] init];
            _topSeparatorV.backgroundColor = _item.topSeparatorcColor;
        }
        [self.contentView addSubview:_topSeparatorV];
    }
}

- (void)accessoryControlEvent {
    if (_item.controlEvent) _item.controlEvent(_item);
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.accessoryView.x = self.w - _item.itemTrailing - self.accessoryView.w;
    if (_item.leftImage) {
        self.imageView.x = _item.itemLeading;
        self.imageView.y = (self.contentView.h - self.imageView.h) * 0.5;
    } else if (_item.leftImageView) {
        _item.leftImageView.x = _item.itemLeading;
        _item.leftImageView.y = (self.contentView.h - _item.leftImageView.h) * 0.5;
        self.imageView.x = _item.itemLeading;
        self.imageView.w = _item.leftImageView.w;
    }
    if (_item.subtitleString.length) {
        _subTitleLeb.w = self.contentView.w - _item.itemLeading - _item.itemTrailing;
        [_subTitleLeb sizeToFit];
        _customContentV.x = CGRectGetMaxX(self.imageView.frame) + _item.itemLeading;
        _customContentV.cy = self.h / 2;
    } else {
        self.textLabel.x = CGRectGetMaxX(self.imageView.frame) + _item.itemLeading;
    }
    if (_item.rightIconView) {
        _item.rightIconView.x = self.contentView.w - _item.itemTrailing - _item.rightIconView.w;
        _item.rightIconView.y = (self.contentView.h - _item.rightIconView.h) * 0.5;
        self.detailTextLabel.x = _item.rightIconView.x - self.detailTextLabel.w;
    } else {
        self.detailTextLabel.x = self.contentView.w - self.accessoryView.w - self.detailTextLabel.w;
    }
    if (_item.accessoryType == UITableViewCellAccessoryNone) {
        self.detailTextLabel.x -= _item.itemTrailing;
    }
    if (_item.hintBtn) {
        _btn.x = self.textLabel.x + self.textLabel.w + 4;
        _btn.cy = self.textLabel.cy;
    }
    if (_item.titleBadge >= 0) {
        UILabel *titleView = _item.subtitleString.length ? _titleLeb : self.textLabel;
        _titleBadgeLeb.x = titleView.w + _titleBadgeLeb.w;
        _titleBadgeLeb.y = 0;
    }
    if (_item.isBottomSeparator) {
        _bottomSeparatorV.w = self.w - _item.bottomSeparatorSpace;
        _bottomSeparatorV.y = self.contentView.h - _item.bottomSeparatorH;
        _bottomSeparatorV.x = _item.bottomSeparatorSpace;
        _bottomSeparatorV.h = _item.bottomSeparatorH;
    }
    if (_item.isTopSeparator) {
        _topSeparatorV.w = self.w - _item.topSeparatorSpace;
        _topSeparatorV.y = 0;
        _topSeparatorV.x = _item.topSeparatorSpace;
        _topSeparatorV.h = _item.topSeparatorH;
    }
}

- (void)hintBtnClick:(UIButton *)btn {
    _item.hintBtnClicked();
}

@end
