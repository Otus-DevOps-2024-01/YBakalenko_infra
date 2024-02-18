# YBakalenko_infra

In order to SSH an internal VPC machine someinternalhost with command like
"ssh someinternalhost" from a local machine please follow the below steps:
1. Modify your local SSH configuration file ~/.ssh/config:
   nano ~/.ssh/config
2. Add the following lines to the configuration file:

    Host bastionhost
            HostName <bastionhost_public_IP>
            User appuser
            Port 22

    Host someinternalhost
            HostName <someinternalhost_internal_IP>
            User appuser
            Port 22
            ProxyJump bastionhost

bastionhost_public_IP = 51.250.66.22
someinternalhost_internal_IP = 10.128.0.24s
