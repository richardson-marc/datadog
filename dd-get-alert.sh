#!/bin/sh
# this damn thing works!

usage() { echo "Usage: $0 [-t minutes] [-h <host>]" 1>&2; exit 1; }

while getopts ":t:h:" o; do
    case "${o}" in
        t)
            a=${OPTARG}
#            ((s == 45 || s == 90)) || usage
            ;;
#        h)
#            h=${OPTARG}
#            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

#if [ -z "${t}" ] || [ -z "${h}" ]; then
#    usage
#fi

# for testing
#echo "t = ${t}"
#echo "h = ${h}"

#api_key=
#app_key=
# changed
api_key=APIKEY
app_key=APPKEY

#time_min=$t


# start=$(date +%s)
# echo "date -v+"$t"M +%s"
# end=$(date -v+"$t"M +%s)
# end_recurrence=$(date -v+21d +%s)
# host=$h
curl -X POST -H "Content-type: application/json" \
-d '{
#      "scope": "host:'$host'",
#      "start": '"${start}"',
#      "end": '"${end}"'
    }' \
    "https://app.datadoghq.com/api/v1/monitor?api_key=${api_key}&application_key=${app_key}"

