"""
    Decimal to Hexadecimal representation. 
    (Python doesn't have overflow)
"""
def dec2hex(value: str) -> str:
    hex_char = ['A', 'B', 'C', 'D', 'E', 'F']
    def aux_dec2hex(e: int) -> str:
        if e >= 10:
            return hex_char[e - 10]
        else:
            return str(e) 

    x = int(value)
    if x == 0: 
        return '0'

    assert x > 0, "the input value must be positive. "
    ans: str = ""; 
    while x != 0:
        # quotient
        q = x // 16 
        r = x % 16 
        ans = aux_dec2hex(r) + ans 
        x = q
    return ans



if __name__ == "__main__":
    assert dec2hex("314156") == "4CB2C"
    assert dec2hex("0") == "0"
    assert dec2hex("1") == "1"
    assert dec2hex("5") == "5"
    assert dec2hex("10") == "A"