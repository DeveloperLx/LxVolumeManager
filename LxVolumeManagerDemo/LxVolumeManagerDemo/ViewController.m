//
//  ViewController.m
//  LxVolumeManagerDemo
//

#import "ViewController.h"
#import "LxVolumeManager.h"

@interface ViewController ()
{
    UISlider * _volumeSlider;
}
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    _volumeSlider = [[UISlider alloc]init];
    _volumeSlider.minimumValue = 0;
    _volumeSlider.maximumValue = 1;
    _volumeSlider.value = LxVolumeManager.currentVolume;
    [_volumeSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_volumeSlider];
    
    _volumeSlider.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray * sliderConstraintsH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_volumeSlider]-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_volumeSlider)];
    NSArray * sliderConstraintsV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[_volumeSlider(==sliderHeight)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"sliderHeight":@6, @"topMargin":@180} views:NSDictionaryOfVariableBindings(_volumeSlider)];
    [self.view addConstraints:sliderConstraintsH];
    [self.view addConstraints:sliderConstraintsV];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [LxVolumeManager beginObserveVolumeChange:^(CGFloat volume) {
        _volumeSlider.value = volume;
    }];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];    
    [LxVolumeManager stopObserveVolumeChange];
}

- (void)sliderValueChanged:(UISlider *)slider
{
    [LxVolumeManager setVolume:slider.value];
}

@end
