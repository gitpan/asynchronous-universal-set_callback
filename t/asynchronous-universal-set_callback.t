# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl asynchronous-universal-set_callback.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 2 };
use asynchronous::universal::set_callback;
ok(1); # If we made it this far, we're ok.

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $object = bless {},'BogusTest';

my $other_object;
$object->set_callback(sub{$other_object = 5});

ok($other_object == 5);
