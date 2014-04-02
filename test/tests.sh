#############
# common vars
#############

expectedversion="0.2.6"
scriptname="my-fibo"
libname="my-lib"
svcname="my-service"
yawsname="my-yaws"
yawsbootstrapname="my-yaws-bootstrap"
projecttestdirs="$libname $svcname $yawsname $yawsbootstrapname"
tmpdir=`date "+%Y%d%m%H%M%S_test_dir"`
lferepo="$tmpdir/lfe"
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
    result1=`../lfetool -h`
    expected1="Script: lfetool, v$expectedversion"
    assertEquals "$expected1" "`get-result-part "$result1"`"
    result2=`../lfetool help`
    expected2="Script: lfetool, v$expectedversion"
    assertEquals "$expected2" "`get-result-part "$result2"`"
    assertEquals "$result1" "$result2"
}

testVersion () {
    result1=`../lfetool -v`
    assertEquals "$result1" "$expectedversion"
    result2=`../lfetool version`
    assertEquals "$result2" "$expectedversion"
    assertEquals "$result1" "$result2"
}

testNewScript () {
    local expected=""
    ../lfetool new script $scriptname
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
    ../lfetool new library $libname &> /dev/null && \
        cd $libname && make check &> /dev/null
    cd - &> /dev/null
    assertEquals "include common.mk" \
        "`head -1 $libname/Makefile`"
    assertEquals "PROJECT = my-lib" \
        "`head -1 $libname/common.mk`"
    if [ "$TRAVIS" = "true" ]; then
        expected="9"
    else
        expected="12"
    fi
    assertEquals $expected \
        "`find $libname -type f|egrep -v 'deps|.git'|wc -l|tr -d ' '`"
    assertEquals '(defmodule my-lib' \
        "`head -1 $libname/src/my-lib.lfe`"
    assertEquals "{application, 'my-lib'," \
        "`head -2 $libname/src/my-lib.app.src|tail -1`"
    assertEquals '(defmodule unit-my-lib-tests' \
        "`head -1 $libname/test/unit/unit-my-lib-tests.lfe`"
    assertEquals 'my-lib' \
        "`head -2 $libname/README.rst|tail -1`"
    assertEquals 'name:"my-lib",' \
        "`head -2 $libname/package.exs|tail -1|tr -d ' '`"
    assertEquals '{erl_opts, [debug_info, {src_dirs, ["test/unit",' \
        "`head -1 $libname/rebar.config`"
}

testNewService () {
    local expected=""
    ../lfetool new service $svcname &> /dev/null && \
        cd $svcname && make check &> /dev/null
    cd - &> /dev/null
    assertEquals "include otp.mk" \
        "`head -1 $svcname/Makefile`"
    assertEquals "PROJECT = my-service" \
        "`head -1 $svcname/common.mk`"
    if [ "$TRAVIS" = "true" ]; then
        expected="12"
    else
        expected="17"
    fi
    assertEquals $expected \
        "`find $svcname -type f|egrep -v 'deps|.git'|wc -l|tr -d ' '`"
    assertEquals '(defmodule my-service-app' \
        "`head -1 $svcname/src/my-service-app.lfe`"
    assertEquals '(defmodule my-service-server' \
        "`head -9 $svcname/src/my-service-server.lfe|tail -1`"
    assertEquals '(defmodule my-service-sup' \
        "`head -1 $svcname/src/my-service-sup.lfe`"
    assertEquals "{application, 'my-service'," \
        "`head -2 $svcname/src/my-service.app.src|tail -1`"
    assertEquals '(defmodule unit-my-service-tests' \
        "`head -1 $svcname/test/unit/unit-my-service-tests.lfe`"
    assertEquals 'my-service' \
        "`head -2 $svcname/README.rst|tail -1`"
    assertEquals 'name:"my-service",' \
        "`head -2 $svcname/package.exs|tail -1|tr -d ' '`"
    assertEquals '{erl_opts, [debug_info, {src_dirs, ["test/unit",' \
        "`head -1 $svcname/rebar.config`"
}

testNewYAWS () {
    ../lfetool new yaws $yawsname &> /dev/null && \
        cd $yawsname && make check &> /dev/null
    cd - &> /dev/null
    if [ "$TRAVIS" = "true" ]; then
        expected="14"
    else
        expected="20"
    fi
    assertEquals $expected \
        "`find $yawsname -type f|egrep -v 'deps|.git'|wc -l|tr -d ' '`"
    assertEquals "include yaws.mk" \
        "`head -1 $yawsname/Makefile`"
    assertEquals "PROJECT = my-yaws" \
        "`head -1 $yawsname/common.mk`"
    assertEquals '(defmodule my-yaws' \
        "`head -1 $yawsname/src/my-yaws.lfe`"
    assertEquals '(defmodule my-yaws-routes' \
        "`head -1 $yawsname/src/my-yaws-routes.lfe`"
    assertEquals '(defmodule my-yaws-content' \
        "`head -1 $yawsname/src/my-yaws-content.lfe`"
    assertEquals '(defmodule my-yaws-util' \
        "`head -1 $yawsname/src/my-yaws-util.lfe`"
    assertEquals "{application, 'my-yaws'," \
        "`head -2 $yawsname/src/my-yaws.app.src|tail -1`"
    assertEquals '(defmodule unit-my-yaws-tests' \
        "`head -1 $yawsname/test/unit/unit-my-yaws-tests.lfe`"
    assertEquals 'my-yaws' \
        "`head -2 $yawsname/README.rst|tail -1`"
    assertEquals 'name:"my-yaws",' \
        "`head -2 $yawsname/package.exs|tail -1|tr -d ' '`"
    assertEquals '{erl_opts, [debug_info, {src_dirs, ["test/unit",' \
        "`head -1 $yawsname/rebar.config`"
    assertEquals 'logdir = logs' \
        "`head -1 $yawsname/etc/yaws.conf`"
}

testNewYAWSBootstrap () {
    ../lfetool new yaws bootstrap $yawsbootstrapname &> /dev/null && \
        cd $yawsbootstrapname && make check &> /dev/null
    cd - &> /dev/null
    if [ "$TRAVIS" = "true" ]; then
        expected="25"
    else
        expected="32"
    fi
    assertEquals $expected \
        "`find $yawsbootstrapname -type f|egrep -v 'deps|.git'|wc -l|tr -d ' '`"
    assertEquals '(defmodule my-yaws-bootstrap-content' \
        "`head -1 $yawsbootstrapname/src/my-yaws-bootstrap-content.lfe`"
    assertEquals '(defmodule my-yaws-bootstrap-nav' \
        "`head -1 $yawsbootstrapname/src/my-yaws-bootstrap-nav.lfe`"
    assertEquals '(defmodule my-yaws-bootstrap-routes' \
        "`head -1 $yawsbootstrapname/src/my-yaws-bootstrap-routes.lfe`"
}

##########
# fixtures
##########

oneTimeSetUp () {
    echo
    echo "Performing one-time set-up ..."
    echo
    mkdir -p $tmpdir/{test,deps} && cd $tmpdir && \
      cp ../test/shunit2 ../test/tests.sh ./test
    # the next line seems to be causing errors
    #make build
    if [ "$TRAVIS" = "true" ]; then
        git clone https://github.com/rvirding/lfe $lferepo &> /dev/null && \
        cd $lferepo && \
        make compile &> /dev/null && \
        cd - &> /dev/null
    fi
    # set up a download cache
    for DIR in $projecttestdirs; do
        mkdir -p $DIR && cd $DIR && ln -s ../deps deps
        cd - &> /dev/null
    done
}

oneTimeTearDown () {
    echo
    echo "Performing one-time tear-down ..."
    rm -rf ../$tmpdir
}

#######################
# pull in the framework
#######################

. ./test/shunit2
