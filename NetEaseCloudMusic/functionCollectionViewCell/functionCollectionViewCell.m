//
//  functionCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/23.
//

#import "functionCollectionViewCell.h"
#import "subFunctionCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface functionCollectionViewCell () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *functionCollectionview;

@end

@implementation functionCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.functionCollectionview];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.functionCollectionview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self.contentView);
    }];
}

- (UICollectionView *)functionCollectionview {
    if (!_functionCollectionview) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _functionCollectionview = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _functionCollectionview.delegate = self;
        _functionCollectionview.dataSource = self;
        _functionCollectionview.backgroundColor = [UIColor whiteColor];
        _functionCollectionview.showsHorizontalScrollIndicator = NO;
        [_functionCollectionview registerClass:[subFunctionCollectionViewCell class]
                forCellWithReuseIdentifier:@"subFunctionCollectionViewCell"];
    }
    
    return _functionCollectionview;
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    subFunctionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"subFunctionCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.item == 0) {
        [cell.functionButton setImage:[UIImage imageNamed:@"????????????"] forState:UIControlStateNormal];
        cell.functionLabel.text = @"????????????";
        cell.functionLabel.font = [UIFont systemFontOfSize:12];
        cell.functionLabel.textAlignment = UITextAlignmentCenter;     // ????????????
    } else if (indexPath.item == 1) {
        [cell.functionButton setImage:[UIImage imageNamed:@"??????FM"] forState:UIControlStateNormal];
        cell.functionLabel.text = @"??????FM";
        cell.functionLabel.font = [UIFont systemFontOfSize:12];
        cell.functionLabel.textAlignment = UITextAlignmentCenter;
    } else if (indexPath.item == 2) {
        [cell.functionButton setImage:[UIImage imageNamed:@"??????"] forState:UIControlStateNormal];
        cell.functionLabel.text = @"??????";
        cell.functionLabel.font = [UIFont systemFontOfSize:12];
        cell.functionLabel.textAlignment = UITextAlignmentCenter;
    } else if (indexPath.item == 3) {
        [cell.functionButton setImage:[UIImage imageNamed:@"?????????"] forState:UIControlStateNormal];
        cell.functionLabel.text = @"?????????";
        cell.functionLabel.font = [UIFont systemFontOfSize:12];
        cell.functionLabel.textAlignment = UITextAlignmentCenter;
    } else if (indexPath.item == 4) {
        [cell.functionButton setImage:[UIImage imageNamed:@"??????"] forState:UIControlStateNormal];
        cell.functionLabel.text = @"??????";
        cell.functionLabel.font = [UIFont systemFontOfSize:12];
        cell.functionLabel.textAlignment = UITextAlignmentCenter;
    }else {
        [cell.functionButton setImage:[UIImage imageNamed:@"??????"] forState:UIControlStateNormal];
        cell.functionLabel.text = @"??????";
        cell.functionLabel.font = [UIFont systemFontOfSize:12];
        cell.functionLabel.textAlignment = UITextAlignmentCenter; 
    }
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"????????????%ld???item",(long)indexPath.item);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80, 69);
}


@end
