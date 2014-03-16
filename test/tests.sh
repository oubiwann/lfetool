#############
# common vars
#############

expectedversion="0.1.2"
scriptname="fibo-check"
libname="test-lib"
svcname="test-service"
lferepo="test-lfe-repo"
lfepath="$lferepo/bin"

###################
# support functions
###################

get-result-part () {
    result=$1
    echo "$result"|head -2|tail -1
}

############
# unit tests
############

testHelp () {
    result1=`./lfetool -h`
    expected1="Script: lfetool, v$expectedversion"
    assertEquals "$expected1" "`get-result-part "$result1"`"
    result2=`./lfetool help`
    expected2="Script: lfetool, v$expectedversion"
    assertEquals "$expected2" "`get-result-part "$result2"`"
    assertEquals "$result1" "$result2"
}

testVersion () {
    result1=`./lfetool -v`
    assertEquals "$result1" "$expectedversion"
    result2=`./lfetool version`
    assertEquals "$result2" "$expectedversion"
    assertEquals "$result1" "$result2"
}

testNewScript () {
    local expected=""
    ./lfetool new script $scriptname
    if [ "$TRAVIS" = "true" ]; then
        result="`PATH=$PATH:$lfepath ERL_LIBS=$lferepo ./$scriptname 42`"
    else
        result="`./$scriptname 42`"
    fi
    expected="factorial 42 = 1405006117752879898543142606244511569936384000000000"
    assertEquals "$expected" "$result"
}

testNewLibrary () {
    local expected=""
    ./lfetool new library $libname &> /dev/null
    assertEquals "include common.mk" \
        "`head -1 $libname/Makefile`"
    assertEquals "PROJECT = test-lib" \
        "`head -1 $libname/common.mk`"
    # this is different on the travis build server than locally
    if [ "$TRAVIS" = "true" ]; then
        expected=11
    else
        expected=12
    fi
    assertEquals $expected \
        "`find $libname -type f|egrep -v 'deps|.git'|wc -l|tr -d ' '`"
    assertEquals '(defmodule test-lib' \
        "`head -1 $libname/src/test-lib.lfe`"
    assertEquals "{application, 'test-lib'," \
        "`head -2 $libname/src/test-lib.app.src|tail -1`"
    assertEquals '(defmodule test-lib-tests' \
        "`head -1 $libname/test/test-lib-tests.lfe`"
    assertEquals 'test-lib' \
        "`head -2 $libname/README.rst|tail -1`"
    assertEquals 'name:"test-lib",' \
        "`head -2 $libname/package.exs|tail -1|tr -d ' '`"
    assertEquals '{erl_opts, [debug_info, {src_dirs, ["test"]}]}.' \
        "`head -1 $libname/rebar.config`"
}

testNewService () {
    local expected=""
    ./lfetool new service $svcname &> /dev/null
    assertEquals "include otp.mk" \
        "`head -1 $svcname/Makefile`"
    assertEquals "PROJECT = test-service" \
        "`head -1 $svcname/common.mk`"
    # this is different on the travis build server than locally
    if [ "$TRAVIS" = "true" ]; then
        expected=16
    else
        expected=17
    fi
    assertEquals $expected \
        "`find $svcname -type f|egrep -v 'deps|.git'|wc -l|tr -d ' '`"
    assertEquals '(defmodule test-service-app' \
        "`head -1 $svcname/src/test-service-app.lfe`"
    assertEquals '(defmodule test-service-server' \
        "`head -9 $svcname/src/test-service-server.lfe|tail -1`"
    assertEquals '(defmodule test-service-sup' \
        "`head -1 $svcname/src/test-service-sup.lfe`"
    assertEquals "{application, 'test-service'," \
        "`head -2 $svcname/src/test-service.app.src|tail -1`"
    assertEquals '(defmodule test-service-tests' \
        "`head -1 $svcname/test/test-service-tests.lfe`"
    assertEquals 'test-service' \
        "`head -2 $svcname/README.rst|tail -1`"
    assertEquals 'name:"test-service",' \
        "`head -2 $svcname/package.exs|tail -1|tr -d ' '`"
    assertEquals '{erl_opts, [debug_info, {src_dirs, ["test"]}]}.' \
        "`head -1 $svcname/rebar.config`"
}

##########
# fixtures
##########

oneTimeSetUp () {
    echo "Performing one-time set-up ..."
    echo
    if [ "$TRAVIS" = "true" ]; then
        git clone https://github.com/rvirding/lfe $lferepo &> /dev/null && \
        cd $lferepo && \
        make compile &> /dev/null && \
        cd -
    fi
}

oneTimeTearDown () {
    echo
    echo "Performing one-time tear-down ..."
    rm $scriptname
    rm -rf $libname $svcname $lferepo
}

#######################
# pull in the framework
#######################

. ./test/shunit2
