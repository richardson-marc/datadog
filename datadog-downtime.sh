#!/bin/sh
# Make sure you replace the API and/or APP key below
# with the ones for your account

api_key=27602f7a1d1398b89edba031e39baaa3
app_key=68d4c8f406b31c91c98ea635d95fcc496f3ba9fc



time_min=$1
start=$(date +%s)
#end=$(date -v+5M +%s)
end=$(date -v+$1M +%s)
end_recurrence=$(date -v+21d +%s)
host=$2

echo "time is $start"
echo "downtime for $time_min"
echo "downtime ends $end"


curl -X POST -H "Content-type: application/json" \
-d '{
      "scope": "env:host",
      "start": '"{$start}"',
      "end": '"{$end}"'
#!/bin/sh
# Make sure you replace the API and/or APP key below
# with the ones for your account

api_key=APIKEY
app_key=APPKEY



time_min=$1
start=$(date +%s)
#end=$(date -v+5M +%s)
end=$(date -v+$1M +%s)
end_recurrence=$(date -v+21d +%s)
host=$2


#!/bin/sh
# Make sure you replace the API and/or APP key below
# with the ones for your account

api_key=27602f7a1d1398b89edba031e39baaa3
app_key=68d4c8f406b31c91c98ea635d95fcc496f3ba9fc



time_min=$1
start=$(date +%s)
#end=$(date -v+5M +%s)
end=$(date -v+$1M +%s)
end_recurrence=$(date -v+21d +%s)
host=$2


curl -X POST -H "Content-type: application/json" \
-d '{
      "scope": "env:prod",
      "start": '"${start}"',
      "end": '"${end}"',
      "recurrence": {
        "type": "weeks",
        "period": 1,
        "week_days": ["Mon", "Tue", "Wed", "Thu", "Fri"],
        "until_date": '"${end_recurrence}"'
      }
    }' \
    "https://app.datadoghq.com/api/v1/downtime?api_key=${api_key}&application_key=${app_key}"
