//
//  transViewController.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/30.
//

#import "transViewController.h"
#import "songListViewController.h"
#import <Masonry/Masonry.h>

@interface transViewController ()

@property (nonatomic, strong) UIButton *transButton;

@end

@implementation transViewController

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

- (void)pressed {
    songListViewController *songListVC = [[songListViewController alloc] init];
    songListVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    songListVC.modalPresentationStyle = UIModalPresentationOverFullScreen ;
    [self presentViewController:songListVC animated:YES completion:nil];
}

@end
