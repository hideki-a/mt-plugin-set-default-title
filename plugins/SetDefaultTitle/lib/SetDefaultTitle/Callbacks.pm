package SetDefaultTitle::Callbacks;
use strict;

sub _hdlr_template_param {
    my ($cb, $app, $param, $tmpl) = @_;

    my $params = $app->param;
    my $blog_id = $params->param('blog_id');
    my $entry_id = $params->param('id');
    my $plugin = MT->component('SetDefaultTitle');
    my $default_title;
    my $type = $params->param('_type');

    $default_title = $plugin->get_config_value('title_setting', 'blog:' . $blog_id);

    if ($type eq 'entry' && $entry_id eq '' && $default_title ne '') {
        $param->{'title'} = $default_title;
    }
}

1;
