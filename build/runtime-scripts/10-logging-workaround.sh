#!/bin/bash

# Access LogFormat allows to define several formats and then select
# among them. That is not the case of ErrorLog, so this script add this
# directive to logging.conf

if [[ "${HTTPD_LOG_TYPE}" == "json" ]]; then

cat >> ${HTTPD_MAIN_CONF_D_PATH}/logging.conf << _EOF_
ErrorLogFormat "{ \"logtype\": \"error\", \"timestamp\": \"%t\", \"loglevel\": \"%l\", \"pid\": \"%P\", \"client\": \"%T\", \"message\": \"%M\" }"
_EOF_

fi
