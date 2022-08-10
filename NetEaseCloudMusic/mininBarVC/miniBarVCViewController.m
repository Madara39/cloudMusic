//
//  miniBarVCViewController.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/28.
//

#import "miniBarVCViewController.h"
#import <Masonry/Masonry.h>

@interface miniBarVCViewController ()

@property (nonatomic, strong) UIButton *figureButton;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *songListButton;
@property (nonatomic, strong) UILabel *songNameLabel;
@property (nonatomic, strong) UILabel *singerNameLabel;

@end

@implementation miniBarVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildView];
}

- (void)buildView {
    [self.view addSubview:self.figureButton];
    [self.view addSubview:self.playButton];
    [self.view addSubview:self.songListButton];
    [self.view addSubview:self.songNameLabel];
    [self.view addSubview:self.singerNameLabel];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.figureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(@17);
        make.width.equalTo(@42);
        make.height.equalTo(@42);
    }];
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(12);
        make.left.equalTo(self.view).offset(289);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
    [self.songListButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(13);
        make.left.equalTo(self.view).offset(337);
        make.width.equalTo(@25);
        make.height.equalTo(@25);
    }];
    [self.songNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.equalTo(self.view).offset(67);
        make.width.equalTo(@32);
        make.height.equalTo(@16);
    }];
    [self.singerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.equalTo(self.songNameLabel.mas_right).offset(4);
        make.width.equalTo(@50);
        make.height.equalTo(@12);
    }];
}

- (UIButton *)figureButton {
    if (!_figureButton) {
        _figureButton = [[UIButton alloc] init];
        [_figureButton setImage:[UIImage imageNamed:@"minifig"] forState:UIControlStateNormal];
    }
    
    return _figureButton;
}

- (UIButton *)playButton {
    if (!_playButton) {
        _playButton = [[UIButton alloc] init];
        [_playButton setImage:[UIImage imageNamed:@"miniplayButton"] forState:UIControlStateNormal];
    }
    
    return _playButton;
}

- (UIButton *)songListButton {
    if (!_songListButton) {
        _songListButton = [[UIButton alloc] init];
        [_songListButton setImage:[UIImage imageNamed:@"minisonglistButton"] forState:UIControlStateNormal];
    }
    
    return _songListButton;
}

- (UILabel *)songNameLabel {
    if (!_songNameLabel) {
        _songNameLabel = [[UILabel alloc] init];
        _songNameLabel.text = @"麻雀";
        _songNameLabel.font = [UIFont systemFontOfSize:15];
    }
    
    return  _songNameLabel;
}

- (UILabel *)singerNameLabel {
    if (!_singerNameLabel) {
        _singerNameLabel = [[UILabel alloc] init];
        _singerNameLabel.text = @"-李荣浩";
        _singerNameLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return  _singerNameLabel;
}

@end
