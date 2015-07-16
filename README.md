# LxVolumeManager
Control and observe iOS system volume.

### Installation
You only need drag LxVolumeManager.h and LxVolumeManager.m to your project.

### Support
Minimum support iOS version: iOS 6.0

### Usage

	UISlider * _volumeSlider;

    _volumeSlider.minimumValue = 0;
    _volumeSlider.maximumValue = 1;
    _volumeSlider.value = LxVolumeManager.currentVolume;
    [_volumeSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    - (void)sliderValueChanged:(UISlider *)slider
	{
	    [LxVolumeManager setVolume:slider.value];
	}

    [LxVolumeManager beginObserveVolumeChange:^(CGFloat volume) {
        _volumeSlider.value = volume;
    }];
    
    [LxVolumeManager stopObserveVolumeChange];


### License
LxVolumeManager is available under the Apache License 2.0. See the LICENSE file for more info.
