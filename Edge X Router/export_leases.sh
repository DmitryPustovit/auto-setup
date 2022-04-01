#!/bin/bash

RUNDIR=/opt/vyatta/bin/vyatta-op-cmd-wrapper

get_leases() {
        $RUNDIR show dhcp leases | tail -n +3
}

RESULTS=''

while IFS= read -r Lease
do
        array=($(echo "$Lease" | tr ',' '\t'))

        RESULTS+=$( printf "dhcp_lease{\
ip_address=\""${array[0]}\"", \
hardware_address=\""${array[1]}\"", \
pool=\""${array[4]}\"", \
client_name=\""${array[5]}\"" \
} $(date -d "${array[2]////-} ${array[3]}" +"%s")" )

        RESULTS+="\n"

done < <(printf '%s\n' "$(get_leases)")

echo -e "$RESULTS" | curl -v -H "Connection: close" --data-binary @- http://<PUSHGATEWAY>:9091/metrics/job/dhcp_exporter/instance/<EDGE_COUTER>