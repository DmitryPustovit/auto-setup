#!/bin/bash

RUNDIR=/opt/vyatta/bin/vyatta-op-cmd-wrapper

get_leases() {
        $RUNDIR show dhcp leases | tail -n +3
}

while IFS= read -r Lease
do
        array=($(echo "$Lease" | tr ',' '\t'))

        printf "dhcp_lease{\
ip_address="${array[0]}", \
hardware_address="${array[1]}", \
pool="${array[4]}", \
client_name="${array[5]}" \
} $(date -d "${array[2]////-} ${array[3]}" +"%s")\n"

done < <(printf '%s\n' "$(get_leases)")