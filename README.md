# CircleButton

Custom Circle Button created using CoreGraphics to draw.

![Screenshot](https://github.com/chainedtothewoods/CircleButton/blob/master/Screenshots/circleButton.png?raw=true)

# Usage

```
CGRect viewBounds = [[UIScreen mainScreen] bounds];
// Specify Frame
CircleButton *circleButton = [[CircleButton alloc] initWithFrame:CGRectMake((viewBounds.size.width - 60.0)/2,
                                                                            (viewBounds.size.height - 60.0 - kMenuButtonBottomInset),
                                                                            60.0,
                                                                            60.0)];

[circleButton.textLabel setText:@"Menu"];   // Optional - Specify Text
[self.view addSubview:circleButton];
```

# License

Copyright Michael Lapuebla. All Rights Reserved.
