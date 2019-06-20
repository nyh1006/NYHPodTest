//
//  ViewController.m
//  NYHPodTest
//
//  Created by greenspiderios on 2019/6/19.
//  Copyright © 2019 NYH. All rights reserved.
//

/*
 项目添加 CocoaPods 支持注意事项:
 1.库文件问题(指定开源的库),资源文件也需要指定对用路径
 2.生成 podspec 文件问题,这个文件最好是你开源的库名称相同但是也可以不同(相对于 podspec 文件开始计算路径)
 3.第三方库依赖问题(如果依赖第三方库,该如何处理)
 4.git 命令行
 
 通过命令行把项目上传到 github
 1、cd *项目所在根目录*
 2、git init
 3、git add . *点的意思是添加目录下的所有文件，也可以写某个添加的某个文件名*
 4、git commit -m "注释内容"
 5、在GitHub上create new repository，并copy链接
 6、git remote add origin *这里写上一步copy的链接*
 7、回车之后，如果提示：remote origin already exists，
 请输入：git remote rm origin之后重新执行第6步。
 （如果没有错误，请忽略这一步）
 git pull origin master
 8、git push -u origin master
 9、刷新GitHub，项目已经上传成功。
 

 给项目打标记
 git tag "0.0.1"
 git push --tags
 git push origin master
 
 
 删除标记
 git tag -d 0.0.1                  // 删除本地tag
 git push origin :refs/tags/0.0.1  // 删除远程库tag

 
 验证 podspec 文件是否合法:
 pod lib lint NYHEmptyView.podspec

 Push 到 CocoaPods:
 pod trunk push NYHEmptyView.podspec

 */

#import "ViewController.h"
#import "NYHEmptyView.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NYHEmptyView *emptyView = [NYHEmptyView nyh_emptyView];
//    emptyView.frame = self.view.bounds;
    emptyView.dataType = NYHNoDataType;
    [self.view addSubview:emptyView];
    
    __weak typeof(self) weakSelf = self;
    [emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.top.equalTo(weakSelf.view);
    }];
}


@end
