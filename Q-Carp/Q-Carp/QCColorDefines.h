

#ifndef Coin_News_CNColorDefines_h
#define Coin_News_CNColorDefines_h

#pragma mark - Function

#define COLOR_RGBA(r, g, b, a) [UIColor colorWithRed:((r) / 255.0f)    \
                                               green:((g) / 255.0f)    \
                                                blue:((b) / 255.0f)    \
                                               alpha:((a) / 255.0f)]

#define COLOR_RGB(r, g, b) COLOR_RGBA(r, g, b, 0xFF)

#pragma mark - Colors

#define COLOR_BLUE_DEFAULT  COLOR_RGB(0x1C, 0x48, 0x82)
//#define COLOR_DEFAULT [UIColor colorWithRed:0.22f green:0.25f blue:0.27f alpha:1.00f];
#define COLOR_DEFAULT [UIColor colorWithRed:0.00f green:0.65f blue:0.93f alpha:1.00f];

#endif
