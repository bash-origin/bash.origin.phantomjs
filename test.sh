#!/bin/bash -e
# Source https://github.com/cadorn/bash.origin
. "$HOME/.bash.origin"
function init {
	eval BO_SELF_BASH_SOURCE="$BO_READ_SELF_BASH_SOURCE"
	BO_deriveSelfDir ___TMP___ "$BO_SELF_BASH_SOURCE"
	local __BO_DIR__="$___TMP___"


	function Test {

		VERSION=`BO_callPlugin "$__BO_DIR__/bash.origin.phantomjs" run "--version"`

		if [ "$VERSION" != "2.0.0" ]; then
			echo "ERROR: Got version '$VERSION' while we were looking for '2.0.0'"
			exit 1;
		fi

		echo "OK"
	}

	Test $@
}
init $@