#!/bin/bash
#
# https://qiita.com/a_atsushi/items/72f4039038d67950f0f7

# 和集合
union() {
        printf '%s\n' $@ | sort | uniq
}

# 積集合
intersection() {
        printf '%s\n' $@ | sort | uniq -d
}

# 差集合 (1番目の引数 - 2番目の引数)
difference() {
        (printf '%s\n' $@ | sort -u; printf '%s\n' ${2}) | sort | uniq -u
}

##################################################################

array1=("1" "2" "3" "7")
array2=("1" "2" "4" "5" "6")

echo "array1: (${array1[@]})"
echo "array2: (${array2[@]})"

union_array=(`union "${array1[*]}" "${array2[*]}"`)
echo "union"
echo ${union_array[@]}

intersection_array=(`intersection "${array1[*]}" "${array2[*]}"`)
echo "intersection"
echo ${intersection_array[@]}

difference_array1=(`difference "${array1[*]}" "${array2[*]}"`)
echo "difference (array1 - array2)"
echo ${difference_array1[@]}

difference_array2=(`difference "${array2[*]}" "${array1[*]}"`)
echo "difference (array2 - array1)"
echo ${difference_array2[@]}
