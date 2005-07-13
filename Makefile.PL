use 5.006001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'asynchronous::universal::set_callback',
    VERSION_FROM      => 'lib/asynchronous/universal/set_callback.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/asynchronous/universal/set_callback.pm', # retrieve abstract from module
       AUTHOR         => 'U-OFFICE\David <David@familiehaase.de>') : ()),
);
