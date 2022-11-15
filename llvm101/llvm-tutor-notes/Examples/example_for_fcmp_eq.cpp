/**********************************************************************************************
 * Created by haohua on 30/1/2022.
 *      from https://github.com/banach-space/llvm-tutor/blob/main/inputs/input_for_fcmp_eq.c
 *
 * The Newton-Raphson method
 *      x1 = x0 - f(x0)/f'(x0)
 * if f(x) = sqrt(x)
 *
***********************************************************************************************/
#include <vector>
#include <cmath>
#include <iostream>

using namespace std;

// sqrt_impl uses the Newton-Raphson method for approximating square roots.
double mySqrt(double a) {
    double h = 0.00001;
    double x, nx = a;
    do {
        x = nx;
        nx = 0.5 * (x + a / x);
    }while (fabs(nx - x) > h);

    return nx;
}


int main(){
    int x = 213212321;
    std::cout << mySqrt(x) << ", " << std::sqrt(x) << std::endl;
    return 0;
}

