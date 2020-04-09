//
//  MCSettingsItem.h
//  MCSettingsCell
//
//  Created by zhugexiaobo on 04/09/2020.
//  Copyright (c) 2020 zhugexiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用于设置界面 cell
 *  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 *  ┃ title            detail  >┃
 *  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
 *  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 *  ┃ 🏞 title         detail  >┃
 *  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
 *  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 *  ┃ title 🖱         detail  >┃
 *  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
 *  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 *  ┃ title                 🏞 >┃
 *  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
 *  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 *  ┃ title            [control]┃
 *  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
 *  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 *  ┃ title            detail > ┃
 *  ┃ title                     ┃
 *  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
*/
NS_ASSUME_NONNULL_BEGIN

@interface MCSettingsItem : NSObject

/**
 * titleSring和titleString 会始终被settingcell读取
 * 高度自定义可通过 title和details进行设置
 */
@property (strong, nonatomic) NSAttributedString *title;
@property (strong, nonatomic) NSAttributedString *detail;
@property (nonatomic) NSString *titleString;
@property (nonatomic) NSString *detailString;

/**
 * 副标题
 */
@property (strong, nonatomic) NSAttributedString *subtitle;
@property (nonatomic) NSString *subtitleString;

/**
 * 默认:UITableViewCellAccessoryDisclosureIndicator
 */
@property (assign, nonatomic) UITableViewCellAccessoryType accessoryType;

/**
 * 左部缩进 默认:16
 */
@property (assign, nonatomic) CGFloat itemLeading;

/**
 * 右部缩进 默认:16
 */
@property (assign, nonatomic) CGFloat itemTrailing;

/**
 * 左侧标志图片 默认为:nil
 */
@property (strong, nonatomic) UIImage *leftImage;

/**
 * 如果有值将在cell左侧添加此imageView显示 可以自行控制大小
 * 与 leftImage 互斥
 */
@property (strong, nonatomic) UIImageView *leftImageView;

/**
 * title右上方标记 默认为:-1 不显示
 */
@property (assign, nonatomic) NSInteger titleBadge;

/**
 * title后面按钮 默认为:nil 可自行控制大小
 */
@property (strong, nonatomic) UIButton *hintBtn;

/**
 * hintBtn被点击的回调
 */
@property (copy, nonatomic) void (^hintBtnClicked)(void);

/**
 * 如果有值将在cell右侧添加此imageView显示 可以自行控制大小
 */
@property (strong, nonatomic) UIImageView *rightIconView;

/**
 * 顶部分割线
 *
 * isTopSeparator 是否显示顶部分割线 Default:NO
 * topSeparatorSpace 顶部分割线左边距 Default:16.0
 * topseparatorH 顶部分割线粗细 Default:1
 * topseparatorcColor 顶部分割线颜色 Default:r:245,g:245,b:245
 */
@property (assign, nonatomic) BOOL isTopSeparator;
@property (assign, nonatomic) CGFloat topSeparatorSpace;
@property (assign, nonatomic) CGFloat topSeparatorH;
@property (strong, nonatomic) UIColor *topSeparatorcColor;

/**
 * 底部分割线
 *
 * isBottomSeparator 是否显示底部分割线 Default:NO
 * bottomSeparatorSpace 底部分割线左边距 Default:16.0
 * bottomSeparatorH 底部分割线粗细 Default:1
 * bottomSeparatorcColor 底部分割线颜色 Default:r:245,g:245,b:245
 */
@property (assign, nonatomic) BOOL isBottomSeparator;
@property (assign, nonatomic) CGFloat bottomSeparatorSpace;
@property (assign, nonatomic) CGFloat bottomSeparatorH;
@property (strong, nonatomic) UIColor *bottomSeparatorcColor;

/**
 * 如果设置了accessoryControl,control将作为cell的accessoryView,
 * cell的accessoryType将为none
 * accessoryControl如果是UIButton和UISwitch,事件为UIControlEventTouchUpInside和
 * UIControlEventValueChanged
 * 其他control需要指定accessoryControlEvent
 */
@property (strong, nonatomic) UIControl *accessoryControl;
@property (assign, nonatomic) UIControlEvents accessoryControlEvent;

/**
 * settingCell的高 默认为:60.0
 */
@property (assign, nonatomic) CGFloat height;

/**
 * cell被点击的回调
 */
@property (copy, nonatomic) void (^settingItemClicked)(MCSettingsItem *item);

/**
 * accessoryControl的事件回调
 */
@property (copy, nonatomic) void (^controlEvent)(MCSettingsItem *item);

/**
 * 初始化一个 MCSettingsItem
 * @param title  默认字体为14,颜色为 DefaultTitleColor
 * @param detail 默认字体为14,颜色为 DefaultDetailColor
 * @return MCSettingsItem instance
 */
- (instancetype)initWithTitle:(NSString *)title detail:(NSString *__nullable)detail;

@end

NS_ASSUME_NONNULL_END
