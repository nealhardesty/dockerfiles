FROM treyyoder/quakejs:latest

ADD server.cfg /quakejs/base/baseq3/server.cfg
ADD server.cfg /quakejs/base/cpma/server.cfg
ADD .htaccess /var/www/html/.htaccess
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN ln -sf /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

