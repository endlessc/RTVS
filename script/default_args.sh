#! /bin/bash

##################################变量定义##################################

#证书

CV_PFX_PATH=${CV_PFX_PATH:-$CV_PXF_PATH} #兼容之前变量
CV_PFX_PWD=${CV_PFX_PWD:-$CV_PXF_PWD} #兼容之前变量
CV_PFX_PATH=${CV_PFX_PATH:-""}
CV_PFX_PWD=${CV_PFX_PWD:-""}
CV_PEM_PATH=${CV_PEM_PATH:-""}
CV_PEMKEY_PATH=${CV_PEMKEY_PATH:-""}

#网络
RTVS_NETWORK_HOST=${RTVS_NETWORK_HOST:-"false"}
DOCKER_NETWORK=${DOCKER_NETWORK:-"cvnetwork"}
DOCKER_NETWORK_IPS=${DOCKER_NETWORK_IPS:-"172.29.108"}
DOCKER_GATEWAY_HOST=${DOCKER_GATEWAY_HOST:-"$DOCKER_NETWORK_IPS.1"}

DOCKER_CVCLUSTER_IP=${DOCKER_CVCLUSTER_IP:-"$DOCKER_NETWORK_IPS.254"}
DOCKER_GW_IP=${DOCKER_GW_IP:-"$DOCKER_NETWORK_IPS.249"}
DOCKER_GB2JT_IP=${DOCKER_GB2JT_IP:-"$DOCKER_NETWORK_IPS.248"}
DOCKER_GBSIP_IP=${DOCKER_GBSIP_IP:-"$DOCKER_NETWORK_IPS.247"}
DOCKER_ATTACHMENT_IP=${DOCKER_ATTACHMENT_IP:-"$DOCKER_NETWORK_IPS.246"}
DOCKER_REDIS_IP=${DOCKER_REDIS_IP:-"$DOCKER_NETWORK_IPS.245"}
GRAFANA_DOCKER_IP=${GRAFANA_DOCKER_IP:-"$DOCKER_NETWORK_IPS.243"}
TSDB_DOCKER_IP=${TSDB_DOCKER_IP:-"$DOCKER_NETWORK_IPS.242"}
MYSQL_DOCKER_IP=${MYSQL_DOCKER_IP:-"$DOCKER_NETWORK_IPS.241"}
#WEBRTC_DOCKER_IP=${WEBRTC_DOCKER_IP:-"$DOCKER_NETWORK_IPS.240"}

#端口
MYSQL_DOCKER_PORT=${MYSQL_DOCKER_PORT:-3306}
GRAFANA_DOCKER_PORT=${GRAFANA_DOCKER_PORT:-33000}
WEBRTC_DOCKER_API_PORT=${WEBRTC_DOCKER_API_PORT:-"13188"} #内部用 一般不用修改，host模式时被占用才需要修改

DOCKER_HTTP_PORT=${DOCKER_HTTP_PORT:-30888}
DOCKER_HTTPS_PORT=${DOCKER_HTTPS_PORT:-30443}
DOCKER_WEBSOCKET_PORT=${DOCKER_WEBSOCKET_PORT:-17000}

DOCKER_GBSIP_PORT=${DOCKER_GBSIP_PORT:-5060}
DOCKER_GBSIP_HTTP_PORT=${DOCKER_GBSIP_HTTP_PORT:-9081}

DOCKER_808_PORT=${DOCKER_808_PORT:-9300}
DOCKER_808_HTTP_PORT=${DOCKER_808_HTTP_PORT:-9080}

DOCKER_SIP_PORT=${DOCKER_SIP_PORT:-5060}
DOCKER_RTP_PORT=${DOCKER_RTP_PORT:-30000}

DOCKER_ATTACHMENT_PORT=${DOCKER_ATTACHMENT_PORT:-6030}
DOCKER_ATTACHMENT_HTTP_PORT=${DOCKER_ATTACHMENT_HTTP_PORT:-9082}

PORT_DEV_START=${PORT_DEV_START:-6001}
PORT_DEV_END=${PORT_DEV_END:-65535}
Webrtc_Port_Start=${Webrtc_Port_Start:-14001}
Webrtc_Port_End=${Webrtc_Port_End:-65535}
PORT_DEV_BINDPORT_START=${PORT_DEV_BINDPORT_START:-0}

DOCKER_RTSP_PORT_RANGE_UDP=${DOCKER_RTSP_PORT_RANGE_UDP:-"14100-14200"}

#其他
APIAuthorization=${APIAuthorization:-"12345678"}
RTVS_UPDATECHECK_DOCKER=${RTVS_UPDATECHECK_DOCKER:-"true"}
SwaggerUI=${SwaggerUI:-"true"}
VerifyHttpVideo=${VerifyHttpVideo:-"false"}

#
DOCKER_CLUSTER_NAME=${DOCKER_CLUSTER_NAME:-"cvcluster-1"}
DOCKER_CLUSTER_PATH=${DOCKER_CLUSTER_PATH:-"/etc/service/$DOCKER_CLUSTER_NAME"}
DOCKER_CLUSTER_IMAGE_NAME=${DOCKER_CLUSTER_IMAGE_NAME:-"vanjoge/cvcluster:1.3.9"}

DOCKER_GBSIP_NAME=${DOCKER_GBSIP_NAME:-"gbsip-1"}
DOCKER_GBSIP_PATH=${DOCKER_GBSIP_PATH:-"/etc/service/$DOCKER_GBSIP_NAME"}
DOCKER_GBSIP_IMAGE_NAME=${DOCKER_GBSIP_IMAGE_NAME:-"vanjoge/gbsip:latest"}
DOCKER_GBSIP_ENABLESIPLOG=${DOCKER_GBSIP_ENABLESIPLOG:-"true"}
DOCKER_GBSIP_ALIVETIMEOUTSEC=${DOCKER_GBSIP_ALIVETIMEOUTSEC:-180}
DOCKER_GBSIP_RTVSAPI=${DOCKER_GBSIP_RTVSAPI:-"http://$DOCKER_NETWORK_IPS.11/"}


DOCKER_GW_NAME=${DOCKER_GW_NAME:-"tstgw808-1"}
DOCKER_GW_PATH=${DOCKER_GW_PATH:-"/etc/service/$DOCKER_GW_NAME"}
DOCKER_GW_IMAGE_NAME=${DOCKER_GW_IMAGE_NAME:-"vanjoge/gw808"}


DOCKER_REDIS_NAME=${DOCKER_REDIS_NAME:-"tstgw_redis"}
DOCKER_REDIS_IMAGE_NAME=${DOCKER_REDIS_IMAGE_NAME:-"redis:4.0.10-alpine"}

DOCKER_GB2JT_NAME=${DOCKER_GB2JT_NAME:-"gb2jt-1"}
DOCKER_GB2JT_PATH=${DOCKER_GB2JT_PATH:-"/etc/service/$DOCKER_GB2JT_NAME"}
DOCKER_GB2JT_IMAGE_NAME=${DOCKER_GB2JT_IMAGE_NAME:-"vanjoge/gb2jt:1.3.4"}
#0 UDP 1 TCP
GB28181_RTP_TYPE=${GB28181_RTP_TYPE:-"1"}


DOCKER_ATTACHMENT_NAME=${DOCKER_ATTACHMENT_NAME:-"attachment-1"}
DOCKER_ATTACHMENT_PATH=${DOCKER_ATTACHMENT_PATH:-"/etc/service/$DOCKER_ATTACHMENT_NAME"}
DOCKER_ATTACHMENT_IMAGE_NAME=${DOCKER_ATTACHMENT_IMAGE_NAME:-"vanjoge/attachment:1.3.9"}
DOCKER_ATTACHMENT_KafkaTopic=${DOCKER_ATTACHMENT_KafkaTopic:-"media-complete"}


NGINX_DOCKER_PATH_TEMPLATE=${NGINX_DOCKER_PATH_TEMPLATE:-"/etc/service/nginx-rtmp-"}
NGINX_DOCKER_CONTAINER_NAME_TEMPLATE=${NGINX_DOCKER_CONTAINER_NAME_TEMPLATE:-"nginx-rtmp-"}
NGINX_DOCKER_IMAGE_NAME=${NGINX_DOCKER_IMAGE_NAME:-"vanjoge/nginx-rtmp:flvlive"}

MYSQL_DOCKER_PATH=${MYSQL_DOCKER_PATH:-"/etc/mysql"}
MYSQL_DOCKER_CONTAINER_NAME=${MYSQL_DOCKER_CONTAINER_NAME:-"mysql5.7"}
MYSQL_DOCKER_IMAGE_VERSION=${MYSQL_DOCKER_IMAGE_VERSION:-"5.7"}
#传入有效值时不启动MYSQL实例
#MYSQL_Server_IP
#MYSQL_Server_PORT

TSDB_DOCKER_CONTAINER_NAME=${TSDB_DOCKER_CONTAINER_NAME:-"influxdb"}
TSDB_DOCKER_PATH=${TSDB_DOCKER_PATH:-"/etc/influxdb"}
INFLUXDB_VERSION=${INFLUXDB_VERSION:-"1.7"}
#传入TSDB_Server_IP和TSDB_Server_PORT有效值时不启动influxdb实例
#仅传入TSDB_Server_PORT表示映射出端口
#TSDB_Server_IP
#TSDB_Server_PORT

WEBRTC_DOCKER_CONTAINER_NAME=${WEBRTC_DOCKER_CONTAINER_NAME:-"sfu-mediasoup"}
WEBRTC_DOCKER_PATH=${WEBRTC_DOCKER_PATH:-"/etc/service/mediasoup"}
WEBRTC_DOCKER_IMAGE_NAME=${WEBRTC_DOCKER_IMAGE_NAME:-"vanjoge/mediasoup-demo:v3"}
WEBRTC_ONLY_TCP=${WEBRTC_ONLY_TCP:-"false"}
WEBRTC_ONLY_UDP=${WEBRTC_ONLY_UDP:-"false"}


GRAFANA_DOCKER_CONTAINER_NAME=${GRAFANA_DOCKER_CONTAINER_NAME:-"grafana"}
GRAFANA_DOCKER_PATH=${GRAFANA_DOCKER_PATH:-"/etc/grafana"}
GRAFANA_VERSION=${GRAFANA_VERSION:-"5.4.0"}
RUN_GRAFANA=${RUN_GRAFANA:-"false"}



RTVSWEB_DOCKER_CONTAINER_NAME_TEMPLATE=${RTVSWEB_DOCKER_CONTAINER_NAME_TEMPLATE:-"rtvsweb-publish-"}
RTVSWEB_DOCKER_PATH_TEMPLATE=${RTVSWEB_DOCKER_PATH_TEMPLATE:-"/etc/service/rtvs-"}
RTVSWEB_DOCKER_IMAGE_NAME=${RTVSWEB_DOCKER_IMAGE_NAME:-"vanjoge/rtvs"}
RTVSWEB_VERSION=${RTVSWEB_VERSION:-"1.3.11"}
MatchSim12And20=${MatchSim12And20:-"true"}
QueryVideoListTimeOutSec=${QueryVideoListTimeOutSec:-"60"}
DomainToIP=${DomainToIP:-"true"}




#CDN
RTVS_CDN_URL=${RTVS_CDN_URL:-"http://cdn.cvnavi.com:38220/api/RequestCdnNode"}
RTVS_CDN_ID=${RTVS_CDN_ID:-""}
RTVS_CDN_AKEY=${RTVS_CDN_AKEY:-""}
RTVS_CDN_HOST=${RTVS_CDN_HOST:-"cdn.cvnavi.com"}
RTVS_CDN_PORT=${RTVS_CDN_PORT:-"38225"}
RTVS_CDN_TYPE=${RTVS_CDN_TYPE:-"0"}



if [ ! -n "$ClusterServer" ]; then
    if [[ "$RTVS_NETWORK_HOST" == "true" ]]; then
        ClusterServer="http://127.0.0.1:$DOCKER_HTTP_PORT/Api"
    else
        ClusterServer="http://$DOCKER_CVCLUSTER_IP/Api"
    fi
fi
if [ ! -n "$WEBRTC_DOCKER_IP" ]; then
    if [[ "$RTVS_NETWORK_HOST" == "true" ]]; then
        WEBRTC_DOCKER_IP="127.0.0.1"
    else
        WEBRTC_DOCKER_IP="$DOCKER_NETWORK_IPS.240"
    fi
fi


#非x86_64启用第三方mysql镜像
if  [ ! -n "$MYSQL_DOCKER_IMAGE_NAME" ] ;then
    get_arch=`arch`
    if [[ $get_arch =~ "x86_64" ]];then
        echo "$get_arch"
        MYSQL_DOCKER_IMAGE_NAME="mysql"
    else
        echo "$get_arch"
        MYSQL_DOCKER_IMAGE_NAME="biarms/mysql"
        GRAFANA_VERSION="5.4.4"
    fi
fi

WEBRTC_RTP_URL=${WEBRTC_RTP_URL:-"rtp://$WEBRTC_DOCKER_IP"}