#############
# common vars
#############

expectedversion="0.1.2"
scriptname="test-fibo"
libname="test-lib"
svcname="test-service"
yawsname="test-yaws"
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
    assertEquals 12 \
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
    assertEquals 17 \
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

testNewYAWS () {
    ./lfetool new yaws $yawsname &> /dev/null
    if [ "$TRAVIS" = "true" ]; then
        expected="14"
    else
        expected="20"
    fi
    assertEquals $expected \
        "`find $yawsname -type f|egrep -v 'deps|.git'|wc -l|tr -d ' '`"
    assertEquals "include yaws.mk" \
        "`head -1 $yawsname/Makefile`"
    assertEquals "PROJECT = test-yaws" \
        "`head -1 $yawsname/common.mk`"
    assertEquals '(defmodule test-yaws' \
        "`head -1 $yawsname/src/test-yaws.lfe`"
    assertEquals '(defmodule test-yaws-routes' \
        "`head -1 $yawsname/src/test-yaws-routes.lfe`"
    assertEquals '(defmodule test-yaws-content' \
        "`head -1 $yawsname/src/test-yaws-content.lfe`"
    assertEquals '(defmodule test-yaws-util' \
        "`head -1 $yawsname/src/test-yaws-util.lfe`"
    assertEquals "{application, 'test-yaws'," \
        "`head -2 $yawsname/src/test-yaws.app.src|tail -1`"
    assertEquals '(defmodule test-yaws-tests' \
        "`head -1 $yawsname/test/test-yaws-tests.lfe`"
    assertEquals 'test-yaws' \
        "`head -2 $yawsname/README.rst|tail -1`"
    assertEquals 'name:"test-yaws",' \
        "`head -2 $yawsname/package.exs|tail -1|tr -d ' '`"
    assertEquals '{erl_opts, [debug_info, {src_dirs, ["test"]}]}.' \
        "`head -1 $yawsname/rebar.config`"
    assertEquals 'logdir = logs' \
        "`head -1 $yawsname/etc/yaws.conf`"
}

##########
# fixtures
##########

oneTimeSetUp () {
    echo
    echo "Performing one-time set-up ..."
    echo
    # the next line seems to be causing errors
    #make build
    if [ "$TRAVIS" = "true" ]; then
        git clone https://github.com/rvirding/lfe $lferepo &> /dev/null && \
        cd $lferepo && \
        make compile &> /dev/null && \
        cd - &> /dev/null
    fi
}

oneTimeTearDown () {
    echo
    echo "Performing one-time tear-down ..."
    rm $scriptname
    rm -rf $libname $svcname $yawsname $lferepo
}

#######################
# pull in the framework
#######################

. ./test/shunit2
