//
//  searchViewController.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/17.
//

#import "searchViewController.h"
#import <Masonry/Masonry.h>


@interface searchViewController ()

@property (nonatomic, strong) UIButton *settingsButton;
@property (nonatomic, strong) UIButton *identifySongsButton;
@property (nonatomic, strong) UITextField *searchBar;

@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self buildView];
}

- (void)buildView {
    [self.view addSubview:self.settingsButton];
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.identifySongsButton];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.settingsButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@8);
            make.left.equalTo(@16);
            make.width.equalTo(@28);
            make.height.equalTo(@28);
    }];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@4.5);
            make.left.equalTo(@50);
            make.width.equalTo(@275);
            make.height.equalTo(@35);
    }];
    [self.identifySongsButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@8);
            make.right.equalTo(@-16);
            make.width.equalTo(@28);
            make.height.equalTo(@28);
    }];
}

- (UIButton *)settingsButton {
    if (!_settingsButton) {
        _settingsButton = [[UIButton alloc] init];
        [_settingsButton setImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
    }
    
    return _settingsButton;
}

- (UITextField *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UITextField alloc] init];
        _searchBar.backgroundColor = [UIColor whiteColor];
//        _searchBar.borderStyle = UITextBorderStyleRoundedRect;
        _searchBar.layer.cornerRadius = 20.0;
    }
    
    return _searchBar;
}

- (UIButton *)identifySongsButton {
    if (!_identifySongsButton) {
        _identifySongsButton = [[UIButton alloc] init];
        [_identifySongsButton setImage:[UIImage imageNamed:@"听歌识曲"] forState:UIControlStateNormal];
    }
    
    return _identifySongsButton;
}

@end
