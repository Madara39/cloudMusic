//
//  songPlayViewController.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/31.
//

#import "songPlayViewController.h"
#import <Masonry/Masonry.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface songPlayViewController ()<AVAudioPlayerDelegate>

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UIButton *followButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UIImageView *needleImageView;
@property (nonatomic, strong) UIImageView *blackGlueImageView;
@property (nonatomic, strong) UIImageView *blackGlueBackgroundImageView;
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UIImageView *progressBarImageView;
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *downloadButton;
@property (nonatomic, strong) UIButton *singButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *moreButton;
@property (nonatomic, strong) UIButton *modelButton;
@property (nonatomic, strong) UIButton *lastButton;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) AVAudioPlayer *avAudioPlay;

@end

@implementation songPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildView];
    [self setupavAudioPlay];
}

- (void)buildView {
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.authorLabel];
    [self.view addSubview:self.followButton];
    [self.view addSubview:self.shareButton];
    [self.view addSubview:self.blackGlueBackgroundImageView];
    [self.view addSubview:self.blackGlueImageView];
    [self.view addSubview:self.coverImageView];
    [self.view addSubview:self.needleImageView];
    [self.view addSubview:self.progressBarImageView];
    [self.view addSubview:self.likeButton];
    [self.view addSubview:self.downloadButton];
    [self.view addSubview:self.singButton];
    [self.view addSubview:self.commentButton];
    [self.view addSubview:self.moreButton];
    [self.view addSubview:self.modelButton];
    [self.view addSubview:self.lastButton];
    [self.view addSubview:self.playButton];
    [self.view addSubview:self.nextButton];
    [self setupConstraints];
}

- (void)setupavAudioPlay {
    [self.avAudioPlay prepareToPlay];
}

- (void)setupConstraints {
    NSSet *set = [[UIApplication sharedApplication] connectedScenes];
    UIWindowScene *windowScene = [set anyObject];
    UIStatusBarManager *statusBarManager2 =  windowScene.statusBarManager;
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(statusBarManager2.statusBarFrame.size.height + 8);
        make.left.equalTo(@25);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(self.view);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(statusBarManager2.statusBarFrame.size.height);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@270);
        make.height.equalTo(@25);
    }];
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(1);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@58);
        make.height.equalTo(@13);
    }];
    [self.followButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.authorLabel);
        make.left.equalTo(self.authorLabel.mas_right).offset(2);
        make.width.equalTo(@16);
        make.height.equalTo(@11);
    }];
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backButton);
        make.right.equalTo(self.view.mas_right).offset(-25);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
    [self.needleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.authorLabel.mas_bottom).offset(75);
        make.left.equalTo(self.view.mas_centerX);
        make.width.equalTo(@102);
        make.height.equalTo(@178);
    }];
    [self.blackGlueBackgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view.mas_centerY).offset(-20);
        make.width.equalTo(@300);
        make.height.equalTo(@300);
    }];
    [self.blackGlueImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view.mas_centerY).offset(-20);
        make.width.equalTo(@275);
        make.height.equalTo(@275);
    }];
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view.mas_centerY).offset(-20);
        make.width.equalTo(@187);
        make.height.equalTo(@187);
    }];
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(statusBarManager2.statusBarFrame.size.height + 569);
        make.left.equalTo(@25);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
    [self.downloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(statusBarManager2.statusBarFrame.size.height + 569);
        make.left.equalTo(self.likeButton.mas_right).offset(44);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
    [self.singButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(statusBarManager2.statusBarFrame.size.height + 569);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
    [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(statusBarManager2.statusBarFrame.size.height + 569);
        make.left.equalTo(self.singButton.mas_right).offset(44);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(statusBarManager2.statusBarFrame.size.height + 569);
        make.right.equalTo(self.view.mas_right).offset(-25);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
    [self.progressBarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.moreButton.mas_bottom).offset(31);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@323);
        make.height.equalTo(@14);
    }];
    [self.modelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.progressBarImageView.mas_bottom).offset(31);
        make.left.equalTo(self.view).offset(25);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.progressBarImageView.mas_bottom).offset(15);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@60);
        make.height.equalTo(@60);
    }];
    [self.lastButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.progressBarImageView.mas_bottom).offset(31);
        make.right.equalTo(self.playButton.mas_left).offset(-30);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.progressBarImageView.mas_bottom).offset(31);
        make.left.equalTo(self.playButton.mas_right).offset(30);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
}

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        [_backgroundImageView setImage:[UIImage imageNamed:@"全屏背景"]];
    }
    
    return _backgroundImageView;
}

- (UIImageView *)needleImageView {
    if (!_needleImageView) {
        _needleImageView = [[UIImageView alloc] init];
        [_needleImageView setImage:[UIImage imageNamed:@"针"]];
    }
    
    return _needleImageView;
}

- (UIImageView *)blackGlueImageView {
    if (!_blackGlueImageView) {
        _blackGlueImageView = [[UIImageView alloc] init];
        [_blackGlueImageView setImage:[UIImage imageNamed:@"黑胶"]];
    }
    
    return _blackGlueImageView;
}

- (UIImageView *)blackGlueBackgroundImageView {
    if (!_blackGlueBackgroundImageView) {
        _blackGlueBackgroundImageView = [[UIImageView alloc] init];
        [_blackGlueBackgroundImageView setImage:[UIImage imageNamed:@"黑胶背景"]];
    }
    
    return _blackGlueBackgroundImageView;
}

- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] init];
        [_coverImageView setImageWithURL:[NSURL URLWithString:self.cellModel.coverImageUrl]
                       placeholderImage:nil];
        _coverImageView.layer.masksToBounds = YES;
        _coverImageView.layer.cornerRadius = 187 * 0.5;
    }
    
    return _coverImageView;
}

- (UIImageView *)progressBarImageView {
    if (!_progressBarImageView) {
        _progressBarImageView = [[UIImageView alloc] init];
        [_progressBarImageView setImage:[UIImage imageNamed:@"进度条"]];
    }
    
    return _progressBarImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.text = self.cellModel.songName;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textAlignment = UITextAlignmentCenter;
    }
    
    return _titleLabel;
}

- (UILabel *)authorLabel {
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] init];
        _authorLabel.textColor = [UIColor whiteColor];
        _authorLabel.text = self.cellModel.songAuthor;
        _authorLabel.font = [UIFont systemFontOfSize:12];
        _authorLabel.textAlignment = UITextAlignmentCenter;
    }
    
    return _authorLabel;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [[UIButton alloc] init];
        [_backButton setImage:[UIImage imageNamed:@"黑胶返回"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _backButton;
}

- (UIButton *)followButton {
    if (!_followButton) {
        _followButton = [[UIButton alloc] init];
        [_followButton setImage:[UIImage imageNamed:@"黑胶关注"] forState:UIControlStateNormal];
    }
    
    return _followButton;
}

- (UIButton *)shareButton {
    if (!_shareButton) {
        _shareButton = [[UIButton alloc] init];
        [_shareButton setImage:[UIImage imageNamed:@"黑胶分享"] forState:UIControlStateNormal];
    }
    
    return _shareButton;
}

- (UIButton *)likeButton {
    if (!_likeButton) {
        _likeButton = [[UIButton alloc] init];
        [_likeButton setImage:[UIImage imageNamed:@"喜欢"] forState:UIControlStateNormal];
    }
    
    return _likeButton;
}

- (UIButton *)downloadButton {
    if (!_downloadButton) {
        _downloadButton = [[UIButton alloc] init];
        [_downloadButton setImage:[UIImage imageNamed:@"下载"] forState:UIControlStateNormal];
    }
    
    return _downloadButton;
}

- (UIButton *)singButton {
    if (!_singButton) {
        _singButton = [[UIButton alloc] init];
        [_singButton setImage:[UIImage imageNamed:@"唱"] forState:UIControlStateNormal];
    }
    
    return _singButton;
}

- (UIButton *)commentButton {
    if (!_commentButton) {
        _commentButton = [[UIButton alloc] init];
        [_commentButton setImage:[UIImage imageNamed:@"黑胶评论"] forState:UIControlStateNormal];
    }
    
    return _commentButton;
}

- (UIButton *)moreButton {
    if (!_moreButton) {
        _moreButton = [[UIButton alloc] init];
        [_moreButton setImage:[UIImage imageNamed:@"黑胶更多"] forState:UIControlStateNormal];
    }
    
    return _moreButton;
}

- (UIButton *)modelButton {
    if (!_modelButton) {
        _modelButton = [[UIButton alloc] init];
        [_modelButton setImage:[UIImage imageNamed:@"播放模式"] forState:UIControlStateNormal];
    }
    
    return _modelButton;
}

- (UIButton *)lastButton {
    if (!_lastButton) {
        _lastButton = [[UIButton alloc] init];
        [_lastButton setImage:[UIImage imageNamed:@"上一首"] forState:UIControlStateNormal];
        [_lastButton addTarget:self action:@selector(playLastMusic) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _lastButton;
}

- (UIButton *)nextButton {
    if (!_nextButton) {
        _nextButton = [[UIButton alloc] init];
        [_nextButton setImage:[UIImage imageNamed:@"下一首"] forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(playNextMusic) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _nextButton;
}

- (UIButton *)playButton {
    if (!_playButton) {
        _playButton = [[UIButton alloc] init];
        [_playButton setImage:[UIImage imageNamed:@"开始播放"] forState:UIControlStateNormal];
        [_playButton setImage:[UIImage imageNamed:@"开始播放"] forState:UIControlStateSelected];
        [_playButton addTarget:self action:@selector(playmusic) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _playButton;
}

- (NSMutableArray *)songCellModels {
    if (!_songCellModels) {
        _songCellModels = [[NSMutableArray alloc] init];
    }
    
    return _songCellModels;
}

- (AVAudioPlayer *)avAudioPlay {
    if (!_avAudioPlay) {
        NSString *urlStr = self.cellModel.musicUrl;
        NSURL *url = [[NSURL alloc]initWithString:urlStr];
        NSData * audioData = [NSData dataWithContentsOfURL:url];
        NSString *docDirPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *filePath = [NSString stringWithFormat:@"%@/%@.mp3", docDirPath , @"temp"];
        [audioData writeToFile:filePath atomically:YES];
        NSURL *fileURL = [NSURL fileURLWithPath:filePath];
        _avAudioPlay = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
        _avAudioPlay.delegate = self;
        _avAudioPlay.numberOfLoops = -1 ;
    }
    
    return _avAudioPlay;
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"back");
    }];
}

- (songCellModel *)cellModel {
    if (!_cellModel) {
        _cellModel = [[songCellModel alloc] init];
    }
    
    return _cellModel;
}

- (void)playmusic {
    if (self.playButton.selected) {
        [self.avAudioPlay pause];
        self.playButton.selected = !self.playButton.selected;
    } else {
        [self.avAudioPlay play];
        self.playButton.selected = !self.playButton.selected;
    }
}

- (void)playNextMusic {
    int curCellNum = [self.cellNum intValue];
    songCellModel *tempModel;
    if (curCellNum <= 8) {
        tempModel = self.songCellModels[curCellNum];
        curCellNum = curCellNum + 1;
    } else {
        tempModel = self.songCellModels[0];
        curCellNum = 1;
    }
    self.cellNum = [NSString stringWithFormat:@"%d",curCellNum];
    [self.coverImageView setImageWithURL:[NSURL URLWithString:tempModel.coverImageUrl]
                   placeholderImage:nil];
    self.titleLabel.text = tempModel.songName;
    self.authorLabel.text = tempModel.songAuthor;
    NSString *urlStr = tempModel.musicUrl;
    NSURL *url = [[NSURL alloc]initWithString:urlStr];
    NSData * audioData = [NSData dataWithContentsOfURL:url];
    NSString *docDirPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@.mp3", docDirPath , @"temp"];
    [audioData writeToFile:filePath atomically:YES];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    self.avAudioPlay = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    self.avAudioPlay.delegate = self;
    self.avAudioPlay.numberOfLoops = -1 ;
    if (self.playButton.selected) {
        [self.avAudioPlay play];
    }
}

- (void)playLastMusic {
    int curCellNum = [self.cellNum intValue];
    songCellModel *tempModel;
    if (curCellNum >= 2) {
        tempModel = self.songCellModels[curCellNum - 2];
        curCellNum = curCellNum - 1;
    } else {
        tempModel = self.songCellModels[8];
        curCellNum = 9;
    }
    self.cellNum = [NSString stringWithFormat:@"%d",curCellNum];
    [self.coverImageView setImageWithURL:[NSURL URLWithString:tempModel.coverImageUrl]
                   placeholderImage:nil];
    self.titleLabel.text = tempModel.songName;
    self.authorLabel.text = tempModel.songAuthor;
    NSString *urlStr = tempModel.musicUrl;
    NSURL *url = [[NSURL alloc]initWithString:urlStr];
    NSData * audioData = [NSData dataWithContentsOfURL:url];
    NSString *docDirPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@.mp3", docDirPath , @"temp"];
    [audioData writeToFile:filePath atomically:YES];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    self.avAudioPlay = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    self.avAudioPlay.delegate = self;
    self.avAudioPlay.numberOfLoops = -1 ;
    if (self.playButton.selected) {
        [self.avAudioPlay play];
    }
}

@end

