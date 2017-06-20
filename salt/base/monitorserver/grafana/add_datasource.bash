#!/bin/bash

## Add datasource using curl

sudo curl -k -u 'admin:Admin123' 'https://monitor.example.com/api/datasources' -H "Content-Type: application/json" -X POST --data-binary '{"id":1,"orgId":1,"name":"MonitoringDataSource","type":"influxdb","typeLogoUrl":"public/app/plugins/datasource/influxdb/img/influxdb_logo.svg","access":"proxy","url":"http://localhost:8086","password":"","user":"","database":"collectd","basicAuth":false,"isDefault":true,"jsonData":{}}'
