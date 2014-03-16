scriptname="fibo-check"
libname="test-lib"
svcname="test-service"

testNewScript () {
    ./lfetool new script $scriptname
    result=`./fibo-check 42`
    expected="factorial 42 = 1405006117752879898543142606244511569936384000000000"
    assertEquals "$expected" "$result"
}

oneTimeTearDown () {
    rm $scriptname
    rm -rf $libname $svcname
}

. ./test/shunit2
