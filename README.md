# UIActivityLabel

An UILabel with UIActivityIndicatorView, useful for use in asynchronous requests.

![](https://github.com/GuilhermeMachado/UIActivityLabel/blob/master/Resources/demo.gif)

## Installation with CocoaPods

#### Podfile iOS 8.0+

```ruby
platform :ios, '8.0'

pod 'UIActivityLabel'
```
### Manually

Copy UIActivityLabel.h and UIActivityLabel.m to your project folder.

## Usage

* Default Color: Black
* Default Positon: ActivityPositionCenter

#### #import <UIActivityLabel.h>

```obj-c

@interface TableViewController ()

@property (strong, nonatomic) IBOutletCollection(UIActivityLabel) NSArray *labelCollection;
@property (weak, nonatomic) IBOutlet UIActivityLabel *label2;
@property (weak, nonatomic) IBOutlet UIActivityLabel *label3;

@end

@implementation TableViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.label2 setActivityViewColor:[UIColor orangeColor]];
    [self.label2 setActivityPosition:ActivityPositionLeft];
    
    [self.label3 setActivityViewColor:[UIColor greenColor]];

}
```

#### Start label
```obj-c

  [self.label2 start];

```

#### Start label Collection
```obj-c

  [UIActivityLabel startCollection:self.labelCollection];

```

#### Stop label
```obj-c

  [self.label2 stop];

```

#### Stop label Collection
```obj-c

  [UIActivityLabel stopCollection:self.labelCollection];

```

See more in UIActivityLabelDemo

