# pre-configure pydio
[[ ! -d /var/lib/pydio/plugins/boot.conf ]] && mkdir /var/lib/pydio/plugins/boot.conf
cp -f /opt/pydio/bootstrap.json /var/lib/pydio/plugins/boot.conf/bootstrap.json

# create some files which indicate that pydio has been installed.
touch /var/cache/pydio/admin_counted
touch /var/cache/pydio/diag_result.php
touch /var/cache/pydio/first_run_passed

[ -f /var/lib/pydio/public.htaccess ] && rm -f /var/lib/pydio/public/.htaccess
[ -f /usr/share/pydio/.htaccess ] && rm -f /usr/share/pydio/.htaccess
cp -f /opt/pydio/public.htaccess /var/lib/pydio/public/.htaccess
cp -f /opt/pydio/root.htaccess /usr/share/pydio/.htaccess
cp -f /opt/pydio/html.htaccess /var/www/html/.htaccess
cp -f /opt/pydio/pydio.conf /etc/httpd/conf.d/
chown -R apache:apache /var/lib/pydio/public
chown apache:apache /usr/share/pydio/.htaccess
chown apache:apache /var/www/html/.htaccess

# fix LANG
if [ "$LANG" = "" ]; then
mylang=$LANG
else
mylang="fr_FR.UTF-8"
fi
echo "define(\"AJXP_LOCALE\", \"$mylang\");" >> /etc/pydio/bootstrap_conf.php
