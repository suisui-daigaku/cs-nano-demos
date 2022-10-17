#!/bin/bash

# WARNING: 
# 2GB (524288 pagse) may cause error (default type is int, as 2147483648 is out of int type range)
# 5GB 
cmake -DOE_HEAP_ALLOTTED_PAGE_COUNT=1310720 .