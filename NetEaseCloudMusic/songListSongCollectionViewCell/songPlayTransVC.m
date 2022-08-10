//
//  songPlayVCViewController.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/31.
//

#import "songPlayTransVC.h"
#import <Masonry/Masonry.h>
#import "songPlayViewController.h"

@interface songPlayTransVC ()

@property (nonatomic, strong) UIButton *transButton;

@end

@implementation songPlayTransVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildView];
}

- (void)buildView {
    [self.view addSubview:self.transButton];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.transButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(self.view);
    }];
}

- (UIButton *)transButton {
    if (!_transButton) {
        _transButton = [[UIButton alloc] init];
        [_transButton addTarget:self action:@selector(pressed) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _transButton;
}

- (songCellModel *)cellModel {
    if (!_cellModel) {
        _cellModel = [[songCellModel alloc] init];
    }
    
    return _cellModel;
}

- (NSMutableArray *)songCellModels {
    if (!_songCellModels) {
        _songCellModels = [[NSMutableArray alloc] init];
    }
    
    return _songCellModels;
}

- (void)pressed {
    songPlayViewController *songPlayVC = [[songPlayViewController alloc] init];
    songPlayVC.cellModel = self.cellModel;
    songPlayVC.nextMusicUrl = self.nextMusicUrl;
    songPlayVC.lastMusicUrl = self.lastMusicUrl;
    songPlayVC.nextCoverImageUrl = self.nextCoverImageUrl;
    songPlayVC.lastCoverImageUrl = self.lastCoverImageUrl;
    songPlayVC.cellNum = self.cellNum;
    songPlayVC.songCellModels = self.songCellModels;
    songPlayVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    songPlayVC.modalPresentationStyle = UIModalPresentationOverFullScreen ;
    [self presentViewController:songPlayVC animated:YES completion:nil];
}

@end
