#!/bin/sh
# this damn thing works!

usage() { echo "Usage: $0 [-t minutes] [-h <host>]" 1>&2; exit 1; }

while getopts ":t:h:" o; do
    case "${o}" in
        t)
            t=${OPTARG}
#            ((s == 45 || s == 90)) || usage
            ;;
        h)
            h=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${t}" ] || [ -z "${h}" ]; then
    usage
fi

# for testing
#echo "t = ${t}"
#echo "h = ${h}"

#api_key=
#app_key=
# changed
api_key=3cd30541525c05e08c71ee355d27d03f
#app_key=87ce4a24b5553d2e482ea8a8500e71b8ad4554ff
app_key=f696d12450207e024eb1a20444dc8a7221baba35

time_min=$t


start=$(date +%s)
echo "date -v+"$t"M +%s"
end=$(date -v+"$t"M +%s)
end_recurrence=$(date -v+21d +%s)
host=$h
curl -X POST -H "Content-type: application/json" \
-d '{
      "scope": "host:'$host'",
      "start": '"${start}"',
      "end": '"${end}"'
    }' \
    "https://app.datadoghq.com/api/v1/downtime?api_key=${api_key}&application_key=${app_key}"

