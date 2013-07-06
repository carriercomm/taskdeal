package Taskdeal::Client;
use Mojo::Base -base;

use Carp 'croak';
use File::Path 'rmtree';

has 'home';
has 'log';

sub current_role {
  my $self = shift;
  
  # Search role
  my $home = $self->home;
  my $dir = "$home/role_client";
  opendir my $dh, $dir
    or croak "Can't open directory $dir: $!";
  my @roles;
  while (my $role = readdir $dh) {
    next if $role =~ /^\./ || ! -d "$dir/$role";
    push @roles, $role;
  }
  
  # Check role counts
  my $count = @roles;
  $self->log->warn("role_client directory should contain only one role. Found $count role: @roles")
    if @roles > 1;
  
  return $roles[0];
}

sub cleanup_role {
  my $self = shift;
  
  my $home = $self->home;
  my $role_dir = "$home/role_client";
  
  croak unless -d $role_dir;
  
  for my $role (glob "$role_dir/*") {
    next if $role =~ /.gitdironly$/;
    rmtree $role;
  }
}

1;
