# == Class: linux_cis
#
# This is the main class of the cis benchmark
#
class linux_cis (
  String            $cisrulesetversion      = undef,
  String            $cisruleapp             = undef,
  Optional[Array]   $cisrules               ,
) inherits ::linux_cis::params {

  if ( $cisrules.size >= 1 ) {
    $cisrules.each |String $cisrule| {
      $cisrulepath = "::$module_name::$cisrulesetversion::$cisruleapp::$cisrule"
      include $cisrulepath
    }
  }
}
