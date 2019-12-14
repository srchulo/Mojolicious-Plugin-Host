requires 'perl', '5.010001';

requires 'Mojolicious';

on develop => {
    requires 'Test::Pod';
};

on test => sub {
    requires 'Test::More', '0.96';
    requires 'Test::Exception';
};
