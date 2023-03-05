#!/bin/bash

if [ $1 == "up" ]; then
	if test -f /tmp/vpnpid; then
		echo "VPN is already running"
		exit 1
	fi

	hosts=()
	for host in $(kubectl get ingress --all-namespaces -o json | jq -r '.items[].spec.rules[].host'); do
		found=false
		# filter null values
		if [ $host != "null" ]; then
			# check if hostname is already in the array
			for var in "${hosts[@]}"; do
				if [ $host == $var ]; then
					found=true
					break
				fi
			done

			if [ $found = false ]; then
				hosts+=($host)
			fi
		fi
	done

	{ printf "$(gopass -o Telefonica)\n"; sleep 1; printf "$(gopass otp -o Telefonica)\n"; } | sudo openconnect \
		--protocol fortinet \
		-c /Users/hfs/workspace/SmartDigits/vpn.pem \
		-u rt01121 \
		--passwd-on-stdin \
		--server vpn.iotbdtech.com:443/fullmfa \
		--servercert pin-sha256:s2CcoTsQeRhVeNZRabzVwkzpYJcoctE6DRzWc5EvOJw= \
		-s "vpn-slice ${hosts[*]} administrative-sonarqube-prod-sonarqube.telefonicadev.com" \
		-q \
		--no-dtls \
		-b \
		--pid-file /tmp/vpnpid
fi

if [ $1 == "down" ]; then
	if test -f /tmp/vpnpid; then
		sudo kill -s SIGINT $(cat /tmp/vpnpid)
		exit 0
	fi
	echo "VPN is not running"
fi
