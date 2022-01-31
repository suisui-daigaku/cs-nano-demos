
#### Newton Rapson Method 


```cpp
double mySqrt(double a) {
    double h = 0.00001;
    double x, nx = a;
    do {
        x = nx;
        nx = 0.5 * (x + a / x);
    }while (fabs(nx - x) > h);

    return nx;
}
```

