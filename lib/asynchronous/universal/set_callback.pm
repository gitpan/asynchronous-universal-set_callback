package asynchronous::universal::set_callback;

use 5.006001;

our $VERSION = '0.01';

sub UNIVERSAL::set_callback{

	my ($obj, $coderef, @args) = @_;

	&$coderef(@args);

};

sub UNIVERSAL::callback_queue{
	[];
};


1;
__END__

=head1 NAME

asynchronous::universal::set_callback - declare trivial UNIVERSAL::set_callback and UNIVERSAL::callback_queue methods

=head1 SYNOPSIS

  use asynchronous::universal::set_callback;
  my $obj = bless [],"something nondeferred";
  $obj->set_callback(sub{print @_}, "cheese!"); # prints "cheese!" immediately

=head1 DESCRIPTION

This module adds C<set_callback($coderef,@arguments)> 
and C<callback_queue>
methods to the UNIVERSAL class, that 
(1) immediately perform coderefs provided as arguments, rather than deferring
them until a deferred object completes what its waiting for, since it's
come back already, or wasn't deferred to start with; and (2) return
an empty coderef, since a non-deferred object has no callback queue.

=head1 CONFORMANCE

In scenarios in which an asynchronous framework returns a placeholder
object which becomes upgraded to a result object, multiple frameworks
may peacefully coexist by using this module rather than each adding
their own extension to UNIVERSAL.

=head2 behavior of set_callback method in conformant packages

Conformant asynchronous packages,
either deferred-asynchronous or fully asynchronous,
contain a C<set_callback> method which
queues a coderef for execution when the asynchronous operation is complete.

=head2 parameters to set_callback

A conformant package's C<set_callback>
method waits for the deferred operation to complete and then
executes set_callback's first argument, which must be a coderef,
with remaining arguments as arguments to the first.  Arguments
are copied rather than being passed by alias to avoid deferred
action at a distance problems.

=head2 execution order of multiple callbacks

Conformant packages execute callbacks in the order that they
are set, and deferred objects do not become ready until all
callbacks have completed.

=head2 callback_queue method

Conformant packages provide a callback_queue method which
returns an arrayref containing all callbacks that have been
set on a deferred object, with $DeferredObject->callback_queue->[0]
being the first in line.  The nature of the representation of
the callback queue is an implementation detail to the particular
asynchronous framework, but they should be deletable and reorderable
using C<splice>, and a coder aware of the representation details
of a particular framework can use the callback_queue method to
manipulate a defered object's callback queue directly
rather than calling set_callback.

UNIVERSAL::callback_queue returns an empty arrayref.

=head1 BUGS

UNIVERSAL methods are not invoked on the undefined value, or on
non-blessed references.

=head1 HISTORY


=head1 SEE ALSO

L<asynchronous::universal::ready>

=head1 AUTHOR

David Nicol <davidnico@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 David Nicol

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.6 or,
at your option, any later version of Perl 5 you may have available.


=cut
