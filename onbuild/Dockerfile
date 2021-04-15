FROM composer:2

WORKDIR /app

RUN rm -rf /tmp/cache

# Add credentials on build
ONBUILD ARG SSH_KEY
RUN mkdir /root/.ssh/ \
    && echo -e "\
    # gitlab.zitcom.dk:22 SSH-2.0-OpenSSH_7.4 \n\ 
    gitlab.zitcom.dk ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFSTWEZNABvcOaUoQqcqvvKEBcYbDAiWSAQev5k9VO9sJLNTT8g8UvReFcsEXF1emNGFeL1SEctHkavgi1f6UxvvbzbcHDXdZin71qSUGrBdunWCZjMZA5pMNP+XdTwVB5oQqDpC+GNbysAtI6y3yysLu0OhkypCQGjhb9M7cO6rIytdDFzZPmMJ2lw9/ul7ydoCuSW1NC4JnCeqUps4GagctsDZKHdRpE3BlNjrwtA6CdvuNSqq7mBk/ndzgKyuA/Cf7uLUyDJv9xPcJ7rGNjkqJsOwOu9jfYLQCkSerVxBX9iJthkBOJsZSseXhYwgET+g27Z82Of0JAMnnPqgLt \n\
    # gitlab.zitcom.dk:22 SSH-2.0-OpenSSH_7.4 \n\
    gitlab.zitcom.dk ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFH7SevFToNzMQfaiC8PHewr+QdUDyUm4fVIstd+1ttWhUtAuzYuto/wpLzifYTX4n+m50B3EPM+MdGFdOlwjJE= \n\
    # gitlab.zitcom.dk:22 SSH-2.0-OpenSSH_7.4 \n\
    # github.com:22 SSH-2.0-babeld-85ff8279 \n\
    github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ== \n\
    # github.com:22 SSH-2.0-babeld-85ff8279 \n\
    # github.com:22 SSH-2.0-babeld-85ff8279 \n\
" > /root/.ssh/known_hosts

ONBUILD RUN echo "${SSH_KEY}" >> /root/.ssh/id_rsa && chmod 600 /root/.ssh/id_rsa
ONBUILD ADD --chown=www-data:www-data . /app
ONBUILD RUN composer install --no-dev --no-suggest --no-progress --optimize-autoloader